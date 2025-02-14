if ! test -d ~/.notes; then
    # echo "Directory does not exists."
    mkdir ~/.notes 2> /dev/null
    git init ~/.notes > /dev/null 2>&1
fi

# Create of modify an existing note
function note() {
    $EDITOR ~/.notes/$1.md
}

# List all the notes in the system
function notes() {
    ls ~/.notes
}

# Delete an existing note
function delnote() {
    rm ~/.notes/$1.md
}
