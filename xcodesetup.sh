# !!! Remember to set key bindings in Xcode > Preferences > Key Bindings to Coxy !!!#
# !!! Remember to set line number on in Xcode > Preferences > text editing !!!#

echo "*** Executing ***"

# Make .dotfiles Xcode subdirectory if needed
XCDIR=~/.dotfiles/XCode
mkdir -p $XCDIR

# Clone .ideKeyBindings
echo "*** Cloning .idekeybindings ***"
rm -rf $XCDIR/KeyBindings
git clone https://github.com/coxy1989/XCodeKeyBindings.git $XCDIR/KeyBindings

# Symbolic link Coxy.idekeybindings into ~/Library/Developer/Xcode/UserData/KeyBindings
echo "*** Symbolic linking into ~/Library/Developer/Xcode/UserData/KeyBindings ***"
ln -sf $XCDIR/KeyBindings/Coxy.idekeybindings ~/Library/Developer/Xcode/UserData/KeyBindings

# Fetch Alcatraz
curl -fsSL https://raw.githubusercontent.com/supermarin/Alcatraz/deploy/Scripts/install.sh | sh

echo "*** Done! ***"
