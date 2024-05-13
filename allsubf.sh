#!/bin/bash

# Function to run command recursively
run_command_recursively() {
    local command="$1"
    local depth="$2"

    # Base case: if depth is 0, exit
    if [ "$depth" -eq 0 ]; then
        return
    fi

	echo ""

    # Loop through all subdirectories
    for dir in */; do
        if [ -d "$dir" ]; then

		echo $dir

            # Navigate into the subdirectory
            cd "$dir" || continue

            # Run the provided command
            eval "$command"

            # Run the function recursively with reduced depth
            run_command_recursively "$command" $((depth - 1))

            # Navigate back to the parent directory
            cd ..

		echo ""
        fi
    done
}

# Initialize depth to a default value
depth=1 #modified from 0 to 1

# Check if depth option is provided
while getopts ":d:" opt; do
    case ${opt} in
        d)
            depth=${OPTARG}
            ;;
        \?)
            echo "Invalid option: -$OPTARG" >&2
            exit 1
            ;;
        :)
            echo "Option -$OPTARG requires an argument." >&2
            exit 1
            ;;
    esac
done
shift $((OPTIND -1))

# Get the command to run
command="$@"

# Run the command recursively
run_command_recursively "$command" "$depth"
