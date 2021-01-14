#!/bin/sh

# Homebrew setup and installing its packages
sh ./nicky_for_brewing

# git config
### configure username and email
cp ssh-config $HOME/.ssh/config
git config --global user.name "Yuuki Fujita"
git config --global user.email fujita@atama.plus

# python environment setup
### for using pyenv and pyenv-virtualenv
echo 'export PYENV_ROOT=${HOME}/.pyenv
export PATH=${PYENV_ROOT}/bin:$PATH
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"' >> ~/.bash_profile
exec $SHELL -l

### insatll python 3.7.4
pyenv install 3.7.4
pyenv global 3.7.4
pyenv refresh

pip install -r pypackages.txt


# vim set up
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
cp .vimrc ~/.vimrc
vim +"PlugInstall" +:q
