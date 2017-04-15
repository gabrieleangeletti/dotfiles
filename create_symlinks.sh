# Create symlinks between dotfiles/ and home directory
cd ~

# remove older config
rm -r .oh-my-zsh
rm -r .vim
rm .vimrc
rm .zshrc
rm .zsh-syntax-highlighting.zsh

# zsh
ln -s ./dotfiles/.oh-my-zsh .oh-my-zsh
ln -s ./dotfiles/.zshrc .zshrc

ln -s dotfiles/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ~/.zsh-syntax-highlighting.zsh

# vim
ln -s ./dotfiles/.vim .vim
ln -s ./dotfiles/.vimrc .vimrc
