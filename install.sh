#/bin/bash
ln -s "$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"/vimrc ~/.vim/vimrc 
add-apt-repository ppa:jonathonf/vim
apt update
apt-get install vim-nox-py2

apt-get install exuberant-ctags

curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
