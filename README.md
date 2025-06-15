## ✍️ Shell Scripting Basics

Shell scripting is a powerful tool that allows you to automate tasks, enhance productivity and unlock the full potential of your Linux system.

⸻
## 📚 Table of Contents

- [What is Bash?](#what-is-bash)
- [Creating and Running a Script](#creating-and-running-a-script)
- [Comments in Bash](#comments-in-bash)
- [Variables](#variables)
- [Parameters](#parameters)
- [Arithmetic Expansion](#arithmetic-expansion)
- [Comparison Operators](#comparison-operators)
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

## Parameters

When a Bash script is executed, it can receive input values from the command line. These inputs are known as **parameters** or **arguments**.

Each argument is automatically assigned to a special variable:
- `$0` refers to the script name
- `$1`, `$2`, `$3`, etc., refer to the first, second, third argument respectively
- `$@` refers to all arguments
- `$#` gives the total number of arguments

### 🧪 Example

Run the script with arguments: `./my-script.sh apple banana cherry`
```bash
#!/bin/bash

echo "Parameter 1: $1"
echo "Parameter 2: $2"
echo "Parameter 3: $3"
```
Output:
```shell
Parameter 1: apple
Parameter 2: banana
Parameter 3: cherry
```

## Arithmetic Expansion

Bash offers a simple way to perform mathematical operations using **arithmetic expansion**. This is done by enclosing the expression within `$(( ))` .

```bash
#!/bin/bash

length=5
width=8

area=$((length * width))
perimeter=$((2 * (length + width)))

echo "Rectangle area: $area"
echo "Rectangle perimeter: $perimeter"
```

### Arithmetic Expansion (with Parameters)

You can also use arithmetic expansion with command-line arguments or user input to perform calculations dynamically.

```bash
#!/bin/bash

length=$1
width=$2

area=$((length * width))
perimeter=$((2 * (length + width)))

echo "Rectangle area: $area"
echo "Rectangle perimeter: $perimeter"
```

Run: `./my-script.sh 10 15`

Output:
```shell
Rectangle area: 150
Rectangle perimeter: 50
```
## Comparison Operators
In Bash, comparison operators are used inside `if` statements to evaluate conditions. These comparisons can be numerical, string-based or file-related.

---

| Operator | Description              | Example          |
|----------|--------------------------|------------------|
| -eq      | Equal to                 | `[ $a -eq $b ]`  |
| -ne      | Not equal to             | `[ $a -ne $b ]`  |
| -gt      | Greater than             | `[ $a -gt $b ]`  |
| -lt      | Less than                | `[ $a -lt $b ]`  |
| -ge      | Greater than or equal to | `[ $a -ge $b ]`  |
| -le      | Less than or equal to    | `[ $a -le $b ]`  |

---

| Operator | Description                        | Example                                          |
|----------|------------------------------------|--------------------------------------------------|
| `=`      | Equal to                           | `[ "$a" = "$b" ]`                                |
| `!=`     | Not equal to                       | `[ "$a" != "$b" ]`                               |
| `==`     | Equal to (alternative to `=`)      | `[ "$a" == "$b" ]`                               |
| `-z`     | String is empty                    | `[ -z "$a" ]`                                    |
| `-n`     | String is not empty                | `[ -n "$a" ]`                                    |
| `&&`     | Logical AND (combine conditions)   | `[ "$a" = "$b" ] && [ "$c" = "$d" ]`             |
| `\|\|`   | Logical OR (combine conditions)         | `[ "$a" = "$b" ] \|\| [ "$c" = "$d" ]`      |


---

### Example: Basic If Statement

```bash
#!/bin/bash

age=25 

if [ $age -gt 18 ]
then
    # Code block to be executed 
    echo "You are an adult"
fi
```
Script Output:
```text
"You are an adult"
```

```bash
#!/bin/bash

grade=85

if [ $grade -ge 90 ] && [ $grade -le 100 ]
then
    # Code block to be executed 
    echo "Excellent"
fi
```
Script Output:
```text
No output displayed since grade=85 doesn't meet the conditions (90-100)
```

## Conditional Statements

### If and Else Statements
The if statement allows you to execute a block of code based on a condition.

The else statement provides an alternative code block to be executed when the if condition evaluates to false. It provides an alternative path in your script flow, offering flexibility and versatility.

```bash
#!/bin/bash

age=15

if [ $age -gt 18 ]; then
    echo "You are an adult"
else
    echo "You are not an adult"
fi
```
> Note: elif stands for “else if” and allows checking multiple conditions in sequence.

```bash
#!/bin/bash

score=85

if [ $score -ge 90 ]; then
    echo "Brilliant score"
elif [ $score -ge 80 ]; then
    echo "Good"
else
    echo "Better luck next time"
fi
```

### Nested If Statements
```bash
#!/bin/bash

age=19
grade=70

if [ $age -ge 18 ]; then
    echo "You are eligible based on age"

    if [ $grade -ge 80 ]; then
        echo "You are eligible based on grade and age"
        echo "Congratulations! You are eligible for the scholarship"
    else
        echo "Sorry, your grade is not high enough"
    fi

else
    echo "Sorry, you are not eligible by age"
fi
```
Script Output:
```text
You are eligible based on age
Sorry, your grade is not high enough
```

## Loops

### While Loops

A while loop allows you to repeatedly execute a block of code **as long as a specified condition remains true**. It’s a powerful tool for automating repetitive tasks and iterating over data. The loop continues to run until the given condition evaluates to false.

```bash
#!/bin/bash

count=1

while [ $count -le 5 ]
do
    echo "Count: $count"
    ((count++))
done
```
```text
Output:
Count: 1
Count: 2
Count: 3
Count: 4
Count: 5
```

> On the sixth check, [ 6 -le 5 ] evaluates to false, so the loop terminates

```bash
#!/bin/bash
fruits=("cherry" "apple" "orange")
index=0

# Loop through the array while index is less than the number of elements
while [ $index -lt ${#fruits[@]} ]; do
    # Print the fruit at the current index
    echo "Fruit: ${fruits[$index]}"
    
    # Increment the index
    ((index++))
done
```

Script Ouput:
```text
Fruit: cherry
Fruit: apple
Fruit: orange
```

### For Loops
A for loop is used to iterate over a list of items (sequence of values) and execute a block of code for each item.

🧪 Example 1: Basic Loop - Counting from 1-5
```bash
#!/bin/bash

# for variable in sequence
# do
	# Code block to be executed
# done

for (( i=1; i<=5; i++))
do
	echo "Number: $i"
done	
```
🧪 Example 2: Sequence-based for loop using seq
```bash
#!/bin/bas
for number in $(seq 1 5)
do
	echo "Number: $number"
done
```
🧪 Example 3: Looping Through an Array
```bash
#!/bin/bash
fruits=("cherry" "apple" "orange")

for fruit in "${fruits[@]}"  
do
    echo "Fruits: $fruit"
done
```

Script Output:
```text
Fruits: cherry
Fruits: apple
Fruits: orange
```

## Break and Continue

`break` and `continue` are essential control statements that give you greater control within for and while loops.

•	**break** is used to **exit the loop early** when a specific condition is met.

•	**continue** skips the **current iteration** and moves to the next one.

These statements allow you to interrupt or skip iterations based on specific conditions.

🧪 Example 1: for loop with break:
```bash
#!/bin/bash

for (( i=1; i<=5; i++ )); do
    if [ $i -eq 3 ]; then
        break
    fi
    echo "Number: $i"
done
```
Script Output:
```text
Number: 1
Number: 2
```

🧪 Example 2: for loop with continue:
```bash
#!/bin/bash

for (( i=1; i<=5; i++ )); do
    if [ $i -eq 3 ]; then
        continue
    fi
    echo "Number: $i"
done
```

🧪 Example 3: while loop with continue
```bash
#!/bin/bash

count=1

while [ $count -le 5 ]; do
    if [ $count -eq 3 ]; then
        ((count++))
        continue
    fi
    echo "Count: $count"
    ((count++))
done
```

🧪 Example 4: while loop with break after a condition:
```bash
#!/bin/bash

count=1

while [ $count -le 5 ]; do
    echo "Count: $count"
    ((count++))

    if [ $count -eq 4 ]; then
        break
    fi
done
```

🧪 Example 5: Infinite while loop with break:
```bash
#!/bin/bash

count=1

while true; do
    echo "Count: $count"
    ((count++))

    if [ $count -eq 4 ]; then
        break
    fi
done
```

## Functions

Functions allow you to organise your code into reusable modules, making your scripts cleaner, more efficient, and easier to maintain. Think of functions as mini-programs within your Bash script that can be defined once and called multiple times whenever needed.

```bash
#!/bin/bash

greet_person() {
    local name="$1"         
    local greet="Bonjour" 

    echo "$greet, $name"
}

greet_person "Ahmed"
```
Script Output:
```text
Bonjour, Ahmed
```

### Function Parameters
Parameters allow us to pass data to functions, making them more versatile and adaptable. Function parameters provide a way to send data to functions, enabling them to perform specific tasks based on provided inputs.

```bash
print_args() {
    echo "Number of arguments: $#"
    echo "Script name: $0"
    echo "First argument: $1"
    echo "Second argument: $2"
    echo "All arguments: $@"
}

print_args "Alice" "Bob" "Ahmed"
```
Script Output:
```text
Number of args: 3
Script name: ./my-script.sh
First argument: Alice
Second argument: Bob
All arguments: Alice Bob Ahmed
```

## User Input
User input allows Bash scripts to interact with users during execution.

🧪 Example 1: Prompt the user for input:
```bash
#!/bin/bash

greet_user() {
    echo "What is your name?"
    read name
    echo "Hello, $name"
}

greet_user
```
🧪 Example 2: Use a default argument if provided:
```bash
#!/bin/bash

greet_user() {
    local name
    if [ $# -eq 0 ]; then
        echo "What is your name?"
        read name
    else
        name="$1"
    fi
    echo "Hello, $name"
}

greet_user "Craig"
```
>Note: `read` captures a single line of user input and stores it in the specified variable.

## Error Handling
Error handling refers to managing invalid or unexpected user input.

Error handling in a script involves anticipating potential points of failure and implementing safeguards to manage them gracefully, preventing crashes or unintended behavior during execution.

🧪 Example 1: Bash does not support division by zero and will return an error to stderr if attempted.

```bash
#!/bin/bash

num1=10
num2=0

# This line will cause an error because you can't divide by zero
result=$((num1 / num2))

# This script will crash because division by zero is undefined
echo "The result is: $result"

# To avoid crashing, we check if the second number is zero before dividing
num1=10
num2=0

# If num2 is zero, show an error and stop the script
# Exit the script to prevent an invalid calculation.

if [ $num2 -eq 0 ]; then
    echo "Error: Division by zero is not allowed"
fi

# Safe to divide now
result=$((num1 / num2))
echo "The result is: $result"
```

🧪 Example 2: This script demonstrates how to use an if statement to check whether a file exists in a directory. The script returns a message indicating the file's existence status.

```bash
#!/bin/bash

FILE="/nonexistence"

if [[ -f "$FILE" ]]; then
    echo "File exists."
else
    echo "File does not exist."
fi
```

### Input Validation

This example shows how to validate user input to ensure it is numeric and meets minimum requirements.

```bash
#!/bin/bash

validate_age() {
    local age=$1
    if [[ ! $age =~ ^[0-9]+$ ]]; then
        echo "Invalid age, please provide a numeric value"
        return 1 # non-zero return indicates an error
    fi
    if (( $age < 18 )); then
        echo "Sorry, you must be 18 or over"
        return 1
    fi
    echo "Congratulations, you are eligible"
    return 0
}

echo "Please enter your age: "
read user_age

validate_age "$user_age"
exit_status=$?

if (( exit_status != 0 )); then
    echo "Input validation failed"
fi
```
>Note: return 1 signals an error, while return 0 indicates success. $? captures the last command’s exit code.

### Sanitizing Input

Another technique to handle bad data is by implementing sanitization. This involves cleaning and formatting user data and ensuring it meets the requited format or constraints.

For example, the script requires a username that contains **only letters and numbers**, with no special characters.

If you enter a username containing special characters, they will be automatically removed, leaving only the alphanumeric characters in the final result.

🧪 Example 1: Removes special characters:


```shell
Prompt: Please enter a username:
dhvb*&^sd
Sanitized username: dhvbsd
```

```bash
#!/bin/bash

# Function to remove non-alphanumeric characters
sanitize_string() {
    local input="$1"
    local sanitized_input="${input//[^a-zA-Z0-9]/}"
    echo "$sanitized_input"
}

# Get input from user
echo "Please enter a username:"
read input_username

sanitized_username=$(sanitize_string "$input_username")

echo "Sanitized username: $sanitized_username"
```
### Exit Codes

Whenever a command or script ends, it returns an exit code to the system—a numeric value that represents whether the command or script completed successfully or not. An exit code of 0 usually indicates success, while any non-zero exit codes like 1 indicate an error

To check the exit code after running a command, use `echo $?`

```bash
#!/bin/bash

# Check whether a command exists in the system
command -v git 2>/dev/null

if [ $? -ne 0 ]; then
    echo "git is not installed. Please install git"
    exit 1
else
    echo "git is installed"
fi
```
### Strict Mode with set -e -u -x

**Set -e**

When we include `set -e` at the start of a script, the script will stop executing as soon as any command returns a non-zero exit code.

```bash
#!/bin/bash

set -e

echo "Before the script"

nonexistentcommand # Script stops at the error. Using set -e helps us catch
# errors immediately and prevent unexpected behavior from unhandled errors

echo "After the script"
```

**Set -u**

`set -u` forces the Bash script to stop if it encounters an uninitialized variable. It helps prevent scenarios where missing data could lead to incorrect results or unexpected behavior.

```bash
#!/bin/bash
set -u

X=10
Y=20
Z=$((X + Y + W))
echo "Z equals: $Z"

# The script will stop due to uninitialized variable W even though X and Y is 
# initialized correctly.
```

**Set -x** 

The `set -x` command makes the shell print each command to the terminal before it runs. This is very helpful for tracking the flow of your script and debugging issues.

```bash
set -x

echo "Starting the script"
X=10
Y=20
Z=$((X + Y ))
echo "Z equals: $Z"

# Note: In the terminal you can see each step in execution.

set +x
#After this point, in the terminal we no longer have a line that starts with +
echo "After the script"
```

**Set -eux**

The set -eux command combines three useful Bash options to make your script safer and easier to debug:

- e: Exit the script immediately if any command fails
- u: Treat unset variables as an error and exit
- x: Print each command before executing it (for tracing)

This combination is commonly used in production scripts to **fail fast**, **catch mistakes early**, and **trace execution steps**

```bash
#!/bin/bash

set -eux  # Enable strict mode: stop on error, unset vars, and trace commands

echo "This is a test"

echo "The value of X is: $X"

nonexistencecommand  
```

### **set -o nounset (or set -u)**

- Treats **unset variables** as an error.
- If you reference a variable that hasn’t been defined, the script will **exit immediately**.

```bash
#!/bin/bash
set -o nounset  # or set -u

echo "User: $USERNAME"  # Will exit if USERNAME is not defined
```

### **set -o errexit (or set -e)**

- Causes the script to **exit immediately** if any command returns a **non-zero exit code** (i.e., fails).
```bash
#!/bin/bash
set -o errexit  # or set -e

echo "Starting..."
invalid_command   # Script will exit here due to failure
echo "This won't run."
```

### **set -o pipefail**

- Ensures that the **entire pipeline fails** if **any** command within it fails.
- Without this, only the last command’s exit status is considered.

```bash
#!/bin/bash
set -o pipefail

cat nonexistentfile | grep "something" 
# The script will fail because file doesn't `nonexistentfile` exists.
# grep part won't even run.
```

## Piping

**Piping** is a powerful feature in Bash that allows you to take the output of one command and use it as the input for another, enabling seamless connection between commands.

Pipe symbol: `|`
```bash
#!/bin/bash

get_file_count() {
    local directory="$1"
    local file_count
    
    file_count=$(ls "$directory" | wc -l)
    echo "Number of files in $directory: $file_count"
}

get_file_count "./"
```

Piping can also be combined with other commands or functions to perform complex operations.
```bash
#!/bin/bash

search_logs() {
    local search_term="$1"
    grep "$search_term" log.txt | awk '{print $2}'
}

search_logs "ERROR"
```

## Environment Variables
Environment variables act like built-in containers that store important information your scripts can use. They provide a convenient way to access system settings, user details, and configuration values during script execution.
```bash
#!/bin/bash

# Display system environment variables
echo "Home directory: $HOME"
echo "Current user: $USER"
echo "OS Type: $OSTYPE"

# Assign environment variables to custom variables
my_home="$HOME"
my_user="$USER"
my_os="$OSTYPE"

# Display values from the custom variables
echo "Home directory (from variable): $my_home"
echo "Current user (from variable): $my_user"
echo "OS Type (from variable): $my_os"
```

### Standard Environment Variables
Standard environment variables offer valuable insights into the system, user, and runtime environment. They help make Bash scripts more robust, adaptable, and context-aware by providing access to important information like the current user, home directory, operating system type, and more.

```bash
#!/bin/bash

# Display common environment variables
echo "Username: $LOGNAME"
echo "Shell: $SHELL"
echo "Current Directory: $PWD"
echo "Executable Paths: $PATH"
echo "Default Language: $LANG"
```

### Add Script Directory to PATH

1. **Create a directory to store your scripts: `mkdir ~/my_scripts`**

2. **Create a new script: `vi ~/my_scripts/hello_world.sh`**

1. **Inside the file, add:**
```bash
#!/bin/bash
echo "Hello world"
```
4. **Make the script executable: `chmod +x ~/my_scripts/hello_world.sh`**
5. **Add the script directory to your PATH permanently (for zsh users):**
```bash
echo 'export PATH="$PATH:$HOME/my_scripts"' >> ~/.zshrc
```
>Adds your script directory to the PATH permanently by appending it to .zshrc
>This ensures the change is applied automatically in every new shell session


6. **Apply the changes: `source ~/.zshrc`**
7. **Now you can run your script from anywhere without having to use `./`:**

Run `hello_world.sh`

```text
💡 Summary of What’s Happening

- mkdir ~/my_scripts: Creates a directory for your custom scripts.
- vi ~/my_scripts/hello_world.sh: Opens a new file in vi for script editing.
- chmod +x: Makes the script executable.
- export PATH=...: Adds your script directory to the shell’s executable path.
- >> ~/.zshrc: Saves the change permanently in your shell config file.
- source ~/.zshrc: Reloads the config so the change takes effect immediately.
```

## Reading and Writing Files

### Reading Files

Reading files is an important task in scripting, as it allows us to access and extract valuable information from various types of files.
```bash
#!/bin/bash

read_file() {
    # Local variable to store file path
    local file_path="$1"
    
    # Read each line of the file
    # IFS= preserves leading/trailing whitespace
    # -r prevents backslash escapes from being interpreted
    
    while IFS= read -r line; do
        echo "$line"
    done < "$file_path"
}
read_file "./log.txt"

# -----------------------------------------

process_file() {
    local file_path="$1"
    cat "$file_path"| while IFS= read -r line; do
        echo "Processing line: $line"
    done
}
process_file "./log.txt"
```

### Writing Files

Writing files allows us to create, modify, and store information in various formats.

```bash
#!/bin/bash

write_to_file() {
    local file_path="$1"
    local data="$2"
    
    # Write data to file
    echo "$data" > "$file_path"
}

write_to_file "read.txt" "Hello World"
```
```text
# Check the content using: cat read.txt
# You will see "Hello World"
echo "$data" > "$file_path"   # overwrite
echo "$data" >> "$file_path"  # append
```

## File Checksums

File checksums are cryptographic hashes that act as a unique fingerprint for a file. They allow us to verify the file’s integrity and authenticity by detecting any changes or corruption.

```bash
#!/bin/bash

# Function: Generate MD5 checksum of a file
calculate_md5sum() {
    local file_path="$1"
    md5sum "$file_path"
}

# Example usage
# Make sure md5sum is installed (e.g. with brew)
calculate_md5sum "read.txt"

# -----------------------------------------

# Function: Generate SHA-256 checksum of a file
calculate_sha256sum() {
    local file_path="$1"
    sha256sum "$file_path"
}

# Example usage
# Make sure sha256sum is installed
calculate_sha256sum "read.txt"

# -----------------------------------------

# Function: Compare two checksum values
compare_checksums() {
    local checksum1="$1"
    local checksum2="$2"

    if [[ "$checksum1" == "$checksum2" ]]; then
        echo "✅ Checksums match. File is intact."
    else
        echo "❌ Checksums do not match. File integrity may be compromised."
    fi
}

# Example comparisons
compare_checksums "123" "123"     # Match
compare_checksums "123" "1234"    # Mismatch
```

