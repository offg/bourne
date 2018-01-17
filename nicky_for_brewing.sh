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
