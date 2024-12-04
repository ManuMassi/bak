bak() {
    # Check if an argument is provided
    if [ $# -ne 1 ]; then
        echo "Usage: bak <file>"
        return 1
    fi

    # Get the file name from the argument
    local file="$1"

    # Check if the argument is a folder
    if [ -d "$file" ]; then
        echo "Error: '$file' is a directory, not a file."
        return 1
    fi

    # Check if the file exists
    if [ ! -e "$file" ]; then
        echo "Error: File '$file' does not exist."
        return 1
    fi

    # Generate the new file name with .bak appended
    local backup_file="${file}.bak"

    # Copy the file
    cp "$file" "$backup_file"

    # Output success message
    echo "Backup created: '$backup_file'"
}


unbak() {
    # Check if an argument is provided
    if [ $# -ne 1 ]; then
        echo "Usage: unbak <file.bak>"
        return 1
    fi

    # Get the file name from the argument
    local file="$1"

    # Check if the file exists
    if [ ! -e "$file" ]; then
        echo "Error: File '$file' does not exist."
        return 1
    fi

    # Check if the file has the .bak extension
    if [[ "$file" != *.bak ]]; then
        echo "Error: File '$file' does not have a .bak extension."
        return 1
    fi

    # Generate the original file name by removing .bak
    local original_file="${file%.bak}"

    # Rename the file back to its original name
    mv "$file" "$original_file"

    # Output success message
    echo "File renamed to '$original_file'"
}
