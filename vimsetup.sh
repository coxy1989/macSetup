echo "*** Executing ***"

# Make .dotfiles Vim subdirectory if needed
VIMDIR=~/.dotfiles/Vim
mkdir -p $VIMDIR

# Clone .vimrc and .xvimrc
echo "*** Cloning .vimrc & .xvimrc ***"
rm -rf $VIMDIR/Vimrc
git clone https://github.com/coxy1989/Vimrc.git $VIMDIR/Vimrc

# Create .vim
mkdir -p $VIMDIR/.vim

# Fetch Pathogen
echo "*** Fetching Pathogen ***"
mkdir -p $VIMDIR/.vim/autoload $VIMDIR/.vim/bundle && \
curl -LSso $VIMDIR/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# CLONE PATHOGEN PLUGINS HERE #

# --> NERDTREE PLUGIN
echo "*** Cloning .NERDTree ***"
rm -rf $VIMDIR/.vim/bundle/nerdtree
git clone https://github.com/scrooloose/nerdtree.git $VIMDIR/.vim/bundle/nerdtree

# --> YOUCOMPLETEME PLUGIN
echo "*** Cloning .YOUCOMPLETEME ***"
rm -rf $VIMDIR/.vim/bundle/YouCompleteMe
git clone https://github.com/Valloric/YouCompleteMe.git
cd YouCompleteMe
git submodule update --init --recursive
./install.sh --clang-completer
cd ..
 
# END OF PATHOGEN PLUGINS #

# Symbolic link .vimrc .xvimrc .vim to ~/ (overwrite existing paths)
echo "*** Symbolic linking .vimrc, .xvimrc and .vim ***"
ln -sf $VIMDIR/Vimrc/.vimrc ~/.vimrc
ln -sf $VIMDIR/Vimrc/.xvimrc ~/.xvimrc
ln -sf $VIMDIR/.vim ~/.vim

#Fetch and install MacVim
echo "*** Fetching MacVim ***"
brew install macvim --with-features=huge --override-system-vim --HEAD
brew linkapps macvim
#DIR=~/Downloads
#curl -L https://github.com/b4winckler/macvim/releases/download/snapshot-73/MacVim-snapshot-73-Mavericks.tbz --output $DIR/MacVim.tbz
#tar -xf $DIR/MacVim.tbz -C $DIR/
#mv $DIR/MacVim-snapshot-73/MacVim.app ~/../../Applications
#rm $DIR/MacVim.tbz
#rm -rf $DIR/MacVim-snapshot-73

echo "*** Done! ***"
