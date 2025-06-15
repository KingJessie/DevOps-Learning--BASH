#!/bin/bash

# length=5
# width=8

# area=$((length * width))
# perimeter=$((2 * (length + width)))

# echo "Rectangle area: $area"
# echo "Rectangle perimeter: $perimeter"


# echo "Rectangle perimeter: $perimeter"

# length=$1
# width=$2

# area=$((length * width))
# perimeter=$((2 * (length + width)))

# echo "Rectangle area: $area"
# echo "Rectangle perimeter: $perimeter"



# score=85

# if [ $score -ge 90 ]; then
#     echo "Brilliant score"
# elif [ $score -ge 80 ]; then
#     echo "Good"
# else
#     echo "Better luck next time"
# fi


# age=19
# grade=70

# if [ $age -ge 18 ]; then
#     echo "You are eligible based on age"

#     if [ $grade -ge 80 ]; then
#         echo "You are eligible based on grade and age"
#         echo "Congratulations!! You are eligible for the scholarship"
#     else
#         echo "Sorry, your grade is not high enough"
#     fi

# else
#     echo "Sorry, you are not eligible by age"
# fi


# count=1

# while [ $count -le 5 ]
# do
#     echo "Count: $count"
#     ((count++))

# done    



# fruits=("cherry" "apple" "orange")
# index=0

# # Loop through the array while index is less than the number of elements
# while [ $index -lt ${#fruits[@]} ]; do
#     # Print the fruit at the current index
#     echo "Fruit: ${fruits[$index]}"
    
#     # Increment the index
#     ((index++))
# done

# for (( i=1; i<=5; i++))
# do
# 	echo "Number: $i"
# done	


# fruits=("cherry" "apple" "orange")

# for fruit in "${fruits[@]}"  
# do
#     echo "Fruits: $fruit"
# done


# for number in $(seq 1 5)
# do
# 	echo "Number: $number"
# done


# for (( i=1; i<=5; i++ ))
# do
#     if [ $i -eq 3 ]
#     then
#         break
#     fi
#     echo "Number: $i"
# done



# count=1

# # Loop while count is less than or equal to 5
# while [ $count -le 5 ]; do
#     echo "Count: $count"
#     # Increment the count
#     ((count++))

#     # If count is equal to 4, exit the loop
#     if [ $count -eq 4 ]; then
#         break
#     fi

# done


# count=1

# while true
# do
#     echo "Count: $count"
#     ((count++))

#     if [ $count -eq 4 ]; then
#         break
#     fi
    
# done


# count=1

# while [ $count -le 5 ]
# do
#     if [ $count -eq 3 ]; then
#         ((count++))
#         continue
#     fi
#     echo "Count: $count"
#     ((count++))

# done    



# greet_person() {
#     local name="$1"         
#     local greet="Bonjour" 

#     echo "$greet, $name"
# }
# greet_person "Ahmed"


# hello_world() {
# 	echo "Hello world!"
# }

# hello_world


# print_args(){

# 	echo "Number of args: $#"
# 	echo "Script name: $0"
# 	echo "First argument: $1"
# 	echo "Second argument: $2"
# 	echo "All arguments: $@"
# }

# print_args "Alice" "Bob" "Ahmed"



# greet_user(){
#     echo "What is your name?"
#     read name
#     echo "Hello, $name"
# }
# greet_user


# greet_user() {
#     local name
#     if [ $# -eq 0 ]; then
#         echo "What is your name?"
#         read name
#     else
#         name="$1"
#     fi
#     echo "Hello, $name"
# }
# greet_user "Craig"



# validate_age() {
#     local age=$1
#     if [[ ! $age =~ ^[0-9]+$ ]]; then
#         echo "Invalid age, please provide a numeric value"
#         return 1 # non-zero return indicates an error
#     fi
#     if (( $age < 18 )); then
#         echo "Sorry, you must be 18 or over"
#         return 1
#     fi
#     echo "Congratulations, you are eligible"
#     return 0
# }

# echo "Please enter your age: "
# read user_age

# validate_age "$user_age"
# exit_status=$?

# if (( exit_status != 0 )); then
#     echo "Input validation failed"
# else echo "Validation passed"
# fi


# Function sanitizing user input
# sanitize_string() {
#     local input=$1
#     local sanitized_input=${input//[^a-zA-Z0-9]/}
#     echo "$sanitized_input"
# }

# # Calling the "sanitize_string" function
# echo "Please enter a username:"
# read input_username

# sanitized_username=$(sanitize_string "$input_username")

# echo "Sanitized username: $sanitized_username"


# get_file_count() {
#     local directory="$1"
#     local file_count
    
#     file_count=$(ls "$directory" | wc -l)
#     echo "Number of files in $directory: $file_count"
# }

# get_file_count "./"


# FILE="/nonexistence"

# if [[ -f "$FILE" ]]; then
#     echo "File exists."
# else
#     echo "File does not exist."
# fi


# command -v git 2>/dev/null

# if [ $? -ne 0 ]; then
#     echo "git is not installed. Please install git"
#     exit 1
# else
#     echo "git is installed"
# fi


# set -x

# echo "Starting the script"
# X=10
# Y=20
# Z=$((X + Y ))
# echo "the value of Z equals: $Z"
for (( i=1; i<=5; i++))
do
	echo "Number: $i"
done	