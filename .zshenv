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
    elif [[ $1 == "b" ]]; then
        command git branch $@[2,$#]
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

pos() {
  if [[ $1 == "activity-s" ]]; then
    command psql -U fn_activity_monitor -h fn-web-app-list-manager-s01.cjdtimdpf6hg.us-east-1.rds.amazonaws.com web_app_activity_monitor
  elif [[ $1 == "activity-p" ]]; then
    command psql -U fn_activity_monitor -h fn-web-app-list-manager-p01.cjdtimdpf6hg.us-east-1.rds.amazonaws.com web_app_activity_monitor
  fi
}

export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/9.3/bin
