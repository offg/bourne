# pyenv configuration
export PYENV_ROOT=$HOME/.pyenv
export PATH=$PYENV_ROOT/bin:$PATH
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# autocompletion for git commands
if [ -f ~/.git-completion.bash ]
    then . ~/.git-completion.bash
fi

# postgres db location
export PGDATA=/usr/local/var/postgres

# locale settings
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"


if [ -f ~/.bashrc ] ; then
. ~/.bashrc
fi
source /usr/local/opt/autoenv/activate.sh
source /usr/local/opt/autoenv/activate.sh
