#!/bin/bash

count_lines_by_owner(){
  local owner=$1
  local lines=0

  echo -e "Looking for files where the owner is: $owner \n"

  for file in *.*; do
    local file_owner=$(stat $file | awk '{ print $5 }')

    if [[ $file_owner == $owner ]]; then
      lines=$(wc -l $file)

      echo "File: $file, Lines: $lines"
    fi
  done
}

count_lines_by_month(){
  local month=$1
  local lines=0

  echo -e "Looking for files where the month is: $month \n"

  for file in *.*; do
    local file_month=$(stat -f "%Sm" -t "%b" $file)

    if [[ $file_month == $month ]]; then
      lines=$(wc -l $file)

      echo "File: $file, Lines: $lines"
    fi
  done
}

show_usage(){
  echo "Usage: ./countlines.sh [-o <owner>] [-m <month>]"
  echo "Options:"
  echo "  -o <owner>     Count lines in text files owned by <owner>"
  echo "  -m <month>     Count lines in text files created in <month>"
  echo "  -h <help>      Show help"
}

if [[ $# -gt 2 ]]; then
  echo -e "Invalid number of arguments. \n"
  show_usage
  exit 1
fi

if [[ $# -eq 0 ]]; then
  show_usage
  exit 1
fi

while getopts "o:m:h" opt; do
  case $opt in
    m)
      month=$OPTARG
      count_lines_by_month "$month"
      ;;
    o)
      owner=$OPTARG
      count_lines_by_owner "$owner"
      ;;
    h)
      show_usage
    ;;
    *)
      echo -e "Invalid argument. \n"
      show_usage
    ;;
  esac
done

