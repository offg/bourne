export PATH="/usr/local/bin:$PATH"
export PIPENV_VENV_IN_PROJECT=1
export PGDATA=/usr/local/var/postgres
export NODEBREW_HOME=/usr/local/var/nodebrew/current
export PYENV_ROOT="$HOME/.pyenv"
export NODEBREW_ROOT=/usr/local/var/nodebrew

export PATH=$PATH:$NODEBREW_HOME/bin
export PATH="$PYENV_ROOT/bin:$PATH"
export PATH="/usr/local/opt/ruby/bin:$PATH"

if [ -f ~/.zshrc ] ; then
. ~/.zshrc
fi
