# BFI
BFI is a [Brainfuck](https://en.wikipedia.org/wiki/Brainfuck) interpreter written in Java.

## Getting Started
1. Download the zip of this repository, and then unzip it. Or, clone the repository with the git command.
```bash
$ git clone https://github.com/zshiba/bfi.git
```
2. Move to the **bfi** directory.
3. Compile the source.
```bash
$ javac -d . ./src/BFI.java
```
4. Run the interpreter.
BFI supports input from stdin and file.
```bash
$ # input from stdin. This prints 0. (See also the Limitation section below.)
$ java BFI
++++++++++++++++++++++++++++++++++++++++++++++++.
$ 0
```

```bash
$ # input from stdin. This prints 0.
$ cat ./test/single_line.bf | java BFI 
$ 0
```

```bash
$ # input from a file. This prints 0.
$ java BFI ./test/single_line.bf
$ 0
```

4. Run other tests. First, move to the **bfi/test** directory. Then, run the shell script.
```bash
$ # run tests
$ ./run_tests.sh
```
Note: Currently, the file **bfi/test/hello_world.bf** is used as a place holder. Before using **run_tests.sh**, copy the hello world program from 
[Brainfuck Hello_World!](https://en.wikipedia.org/wiki/Brainfuck#Hello_World!) and paste it in the file.

## Limitation
To indicate the end of the command source with stdin, it is necessary to enter a newline character (hit the enter key) at the end of the command source and then send a EOF control (Ctrl+D).

## Development Environment
Mac, JDK 1.8

## License
MIT
