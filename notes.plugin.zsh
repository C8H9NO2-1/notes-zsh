#TODO:Add echo everywhere to make it more clear

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

# Clone a remote git repo
function clonenote() {
    if [[ $# -ne 1 ]]; then
        echo "Please pass the remote to this function."
    else
        # cd ~/
        rm -rf ~/.notes
        git clone $1
        # We get the name of the directory
        str=$1
        temp=(${(@s:/:)${str}})
        index=${#temp[@]}
        other_temp=(${(@s/./)${temp[index]}})
        name=${other_temp[1]}
        mv ${name} ~/.notes
        # cd -
    fi
}

function pushnote() {
    cd ~/.notes/
    git push
    cd -
}

function pullnote() {
    cd ~/.notes/
    git pull
    cd -
}

# Create of modify an existing note
function note() {
    temp=0
    if test -f ~/.notes/$1.md; then
        temp=1
    fi

    $EDITOR ~/.notes/$1.md
    # We check if the file exists
    if [[ -f ~/.notes/$1.md ]]; then
        cd ~/.notes
        git add $1.md
        if [[ ${temp} -eq 1 ]]; then
            git commit -m "Modifying $1.md"
        else
            git commit -m "Creating $1.md"
        fi
        cd -
    fi
}

# List all the notes in the system
function notes() {
    ls ~/.notes
}

# Delete an existing note
function delnote() {
    if [[ -f ~/.notes/$1.md ]]; then
        cd ~/.notes
        git rm $1.md
        git commit -m "Removing $1.md"
        cd -
    else
        echo "This note doesn't exists"
    fi
    # rm ~/.notes/$1.md
}
