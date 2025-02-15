if ! test -d ~/.notes; then
    # echo "Directory does not exists."
    mkdir ~/.notes 2> /dev/null
    git init ~/.notes > /dev/null 2>&1
fi

# Add a remote git repo
function remotenote() {
    if [[ $# -ne 1 ]]; then
        echo "Please pass the remote to this function."
    else
        cd ~/.notes/
        git remote add origin $1
        touch .gitignore
        git add .gitignore
        git commit -m "Adding a gitignore file"
        git push --set-upstream origin main
        cd -
    fi
}

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
