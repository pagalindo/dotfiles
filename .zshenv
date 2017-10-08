#
# Defines environment variables.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Ensure that a non-login, non-interactive shell has a defined environment.
if [[ "$SHLVL" -eq 1 && ! -o LOGIN && -s "${ZDOTDIR:-$HOME}/.zprofile" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprofile"
fi

c() {
    command clear $@
}

g() {
    if [[ $1 == "s" ]]; then
        command git status $@[2,$#]
    elif [[ $1 == "c" ]]; then
        command git checkout $@[2,$#]
    elif [[ $1 == "r" ]]; then
        command git reset $@[2,$#]
    elif [[ $1 == "d" ]]; then
        command git diff $@[2,$#]
    elif [[ $1 == "f" ]]; then
        command git fetch $@[2,$#]
    elif [[ $1 == "dr" ]]; then # this is my own special command
        command git diff -- "*$2*"
    elif [[ $1 == "l" ]]; then
        command git log $@[2,$#]
    elif [[ $1 == "ar" ]]; then
        command git add -- "*$2*"
    elif [[ $1 == "sa" ]]; then
        command git stash apply stash\@\{$2\}
    elif [[ $1 == "sd" ]]; then
        command git stash drop stash\@\{$2\}
    elif [[ $1 == "sp" ]]; then
        command git stash pop stash\@\{$2\}
    elif [[ $1 == "ss" ]]; then
        command git stash show -p stash\@\{$2\}
    else
        command git $@
    fi
}
