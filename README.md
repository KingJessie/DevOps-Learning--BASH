## ✍️ Shell Scripting Basics

Shell scripting is a powerful tool that allows you to automate tasks, enhance productivity and unlock the full potential of your Linux system.

⸻
## 📚 Table of Contents

- [What is Bash?](#what-is-bash)
- [Creating and Running a Script](#creating-and-running-a-script)
- [Comments in Bash](#comments-in-bash)
- [Variables](#variables)
- [Parameters and Arguments](#parameters-and-arguments)
- [Arithmetic Expansion](#arithmetic-expansion)
- [Comparison Operators](#comparison-operators)
  - [Numeric Operators](#numeric-operators)
  - [String Comparisons](#string-comparisons)
  - [File Test Operators](#file-test-operators)
- [Conditional Statements](#conditional-statements)
  - [If and Else Statements](#if-and-else-statements)
  - [Nested If Statements](#nested-if-statements)
- [Loops](#loops)
  - [While Loops](#while-loops)
  - [For Loops](#for-loops)
- [Break and Continue](#break-and-continue)
- [Functions](#functions)
  - [Function Parameters](#function-parameters)
- [User Input](#user-input)
- [Error Handling](#error-handling)
  - [Input Validation](#input-validation)
  - [Sanitising Input](#sanitising-input)
  - [Exit Codes](#exit-codes)
  - [Strict Mode with set -e -u -x](#strict-mode-with-set--e--u--x)
- [Piping](#piping)
- [Environment Variables](#environment-variables)
  - [Standard Environment Variables](#standard-environment-variables)
  - [Reading Environment Variables](#reading-environment-variables)
  - [Add Script Directory to PATH](#add-script-directory-to-path)
- [Reading and Writing Files](#reading-and-writing-files)
  - [Reading Files](#reading-files)
  - [Writing Files](#writing-files)
- [File Checksums](#file-checksums)

⸻

## What is Bash?

The shebang (also known as a hash bang or interpreter directive) plays a crucial role in the execution of Bash scripts. For Bash, it typically looks like this: `#!/bin/bash`

It allows you to specify which interpreter should execute the script. For example, if you’re writing a Python script, the shebang might look like: `#!/usr/bin/python3`

## Creating and Running a Script
```
# Step 1: Create the script file
touch my-script.sh

# Step 2: Open the file in an editor
vi my-script.sh 
```
Inside the file, insert the following code:

```bash
#!/bin/bash

echo "Hello world"
```
Save and exit:
Press Esc, then type `:wq!`.

Grant the script executable permissions: `chmod +x my-script.sh`

Run the script using any of the following commands:
```bash
./my-script.sh
sh my-script.sh
bash my-script.sh
```

## Comments in Bash
Comments help enhance the clarity and readability of your script. Comments are lines that are not executed as part of the code; instead, they serve as informative text for readers. Adding comments to your script is best practice because it helps you and others understand the purpose, functionality, and logic of the script.

In Bash, there are two types of comments: single-line comments and multi-line comments.

```bash
#!/bin/bash

# Prints greeting to the console.
echo "Hello world"

: '
This is a multi-line comment
This is a multi-line comment
'
```

## Variables
Variables are elements that store and manipulate data, making your script dynamic and flexible. They act as containers for values that can be accessed and modified throughout the script.
```bash
#!/bin/bash

greetings="Hello world"
name="Claire"

echo "$greetings, $name"
```
