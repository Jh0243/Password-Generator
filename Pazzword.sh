#!/bin/bash

# The function to generate the password
generate_password() {
    # Define character sets for different types of characters
    lowercase="abcdefghijklmnopqrstuvwxyz"
    uppercase="ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    numbers="0123456789"
    special_chars="!@#$%^&*()-=_+[]{}|;:'\",.<>/?"

    # Combines character sets
    all_chars="${lowercase}${uppercase}${numbers}${special_chars}"

    # Generate a random password of 12 characters
    password=$(tr -dc "$all_chars" < /dev/urandom | head -c 12)
    
    echo "$password"
}

# Generate and display 10 unique passwords
echo "Here are your 10 unique passwords:"
for ((i = 1; i <= 10; i++)); do
    password=$(generate_password)
    
    # Ensure that the passwords are unique by checking against existing passwords
    while [[ "${passwords[@]}" =~ "${password}" ]]; do
        password=$(generate_password)
    done
    
    passwords+=("$password")
    
    echo "$i. $password"
done

