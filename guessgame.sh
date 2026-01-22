#!/bin/bash

read -p "Please give me a minimum number: " minnum
read -p "Please give me a maximum number: " maxnum

counttries=0

if [[ -n "$minnum" && -n "$maxnum" ]] && (( maxnum >= minnum + 2 )); then
    random_number=$((RANDOM % (maxnum - minnum + 1) + minnum))
    printf "Now it's time to guess the number\n"

    while true; do
        read -p "Your guess: " userguess
        ((counttries++))

        if [[ "$userguess" -eq "$random_number" ]]; then
            printf "\nCongratulations! You found the number.\n"
            printf "It took you %d turns.\n" "$counttries"
            break
        else
            printf "Wrong, try again.\n"
        fi
    done
else
    echo "RTFM Next Time"
fi
