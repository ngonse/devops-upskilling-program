# Lab 1 - Bash Shell Scripting

## Shell Script to do a line count over files

Create a Bash Shell script using functions to count the number of lines in text files located in the current directory when:

They belong to an owner OR
When were created in a specific month

The shell script should accept the following options:

To select files where the owner is \<owner>

  ```bash
  -o <owner>
  ```

To select files where the creation month is \<month>

  ```bash
  -m <month>
  ````

When receiving invalid arguments, show help

Invalid arguments:

```bash
  ./countlines.sh
  ./countlines.sh -o owner -m month
```

Other arguments

```bash
  ./countlines.sh -x owner
```

Valid arguments:

```bash
./countlines.sh -o nick.gonzalez
```

Expected Output:

```text
  Looking for files where the owner is: nick.gonzalez

  File: countlines.sh, Lines:       55 countlines.sh
  File: example1.txt, Lines:        5 example1.txt
  File: example2.txt, Lines:        5 example2.txt
  File: example4.txt, Lines:        5 example4.txt
```

```text
  Looking for files where the month is: Jun

  File: countlines.sh, Lines:       55 countlines.sh
  File: example1.txt, Lines:        5 example1.txt
```
