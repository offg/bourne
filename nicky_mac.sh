#!/bin/sh

# homebrew setup
### installing homebrew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

### updating homebrew
brew update

### install packages in brew list via brew
brew install < brew_list.txt

### install packages in brew cask list via brew cask
export HOMEBREW_CASK_OPTS="--appdir=/Applications"
cask_package_list_filename='brew_cask_list.txt'
cask_packages=`cat $cask_package_list_filename`
for package_name in $cask_packages
do
    brew cask install $package_name
done

# git config
### configure username and email
git config --global user.name "Yuuki Fujita"
git config --global user.email fujita@atama.plus

# python environment setup
### for using pyenv and pyenv-virtualenv
echo 'export PYENV_ROOT=${HOME}/.pyenv
export PATH=${PYENV_ROOT}/bin:$PATH
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"' >> ~/.bash_profile
exec $SHELL -l

### insatll python 3.5.2
pyenv install 3.5.2
pyenv global 3.5.2
pyenv refresh

pip install -r pypackages.txt
