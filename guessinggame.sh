#!/usr/bin/env bash
# Guessing Game: guess how many regular files are in the current directory.

count_files() {
    find . -maxdepth 1 -type f | wc -l | tr -d ' '
}

play_game() {
    local file_count="$1"
    local guess

    echo "Welcome to the Guessing Game!"
    echo "How many files are in the current directory?"

    while true; do
        read -r -p "Your guess: " guess

        if [[ ! "$guess" =~ ^[0-9]+$ ]]; then
            echo "Please enter a whole number."
        elif (( guess < file_count )); then
            echo "Too low. Try again."
        elif (( guess > file_count )); then
            echo "Too high. Try again."
        else
            echo "Congratulations! Your guess is correct."
            break
        fi
    done
}

main() {
    local total_files
    total_files=$(count_files)
    play_game "$total_files"
}

main
