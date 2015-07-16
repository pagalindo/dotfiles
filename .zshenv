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
    elif [[ $1 == "d" ]]; then
        command git diff $@[2,$#]
    elif [[ $1 == "dr" ]]; then # this is my own special command
        command git diff -- "*$2*"
    elif [[ $1 == "l" ]]; then
        command git log $@[2,$#]
    elif [[ $1 == "ar" ]]; then
        command git add -- "*$2*"
    else
        command git $@
    fi
}
