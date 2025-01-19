mkdir ~/.notes 2> /dev/null

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
