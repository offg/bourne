# pyenv configuration
export PYENV_ROOT=$HOME/.pyenv
export PATH=$PYENV_ROOT/bin:$PATH
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# autocompletion for git commands
if [ -f ~/.git-completion.bash ]; then . ~/.git-completion.bash fi

# postgres db location
export PGDATA=/usr/local/var/postgres
