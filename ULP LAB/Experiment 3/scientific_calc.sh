#!/bin/bash

add() {
    echo "$1 + $2"
}

subtract() {
    echo "$1 - $2"
}

multiply() {
    echo "$1 * $2"
}

divide() {
    echo "$1 / $2"
}

sin() {
    echo "s($1)"
}

cos() {
    echo "c($1)"
}

tan() {
    echo "s($1) / c($1)"
}

while true; do
    clear
    echo "Scientific Calculator"
    echo "1 for Addition"
    echo "2 for Subtraction"
    echo "3 for Multiplication"
    echo "4 for Division"
    echo "5 for Sine"
    echo "6 for Cosine"
    echo "7 for Tangent"
    echo "8 for Exit"
    read -p "Enter your choice: " choice

    case $choice in
        1)
            read -p "Enter first number: " num1
            read -p "Enter second number: " num2
            result=$(add "$num1" "$num2")
            echo "Result: $result"
            ;;
        2)
            read -p "Enter first number: " num1
            read -p "Enter second number: " num2
            result=$(subtract "$num1" "$num2")
            echo "Result: $result"
            ;;
        3)
            read -p "Enter first number: " num1
            read -p "Enter second number: " num2
            result=$(multiply "$num1" "$num2")
            echo "Result: $result"
            ;;
        4)
            read -p "Enter dividend: " num1
            read -p "Enter divisor: " num2
            result=$(divide "$num1" "$num2")
            echo "Result: $result"
            ;;
        5)
            read -p "Enter angle in radians: " angle
            result=$(sin "$angle")
            echo "Result: $result"
            ;;
        6)
            read -p "Enter angle in radians: " angle
            result=$(cos "$angle")
            echo "Result: $result"
            ;;
        7)
            read -p "Enter angle in radians: " angle
            result=$(tan "$angle")
            echo "Result: $result"
            ;;
        8)
            echo "Exiting calculator. Bye!"
            exit 0
            ;;
        *)
            echo "Invalid choice. Please select a valid option."
            ;;
    esac

    read -p "Press Enter to continue..."
done

