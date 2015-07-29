# !!! Remember to set 'Load preferences from custom url' in ITerm > Preferences to ~/.dotfiles/Iterm2/preferences !!! #

echo "*** Executing ***"

# Fetch and install ITerm2 #
echo "*** Fetching ITerm2 ***"
LOC=~/Downloads/iterm2.zip
curl https://iterm2.com/downloads/stable/iTerm2-2_1_1.zip --output $LOC
unzip $LOC -d ~/../../Applications
rm $LOC

# Make .dotfiles ITerm2 subdirectory if needed
ITERM2DIR=~/.dotfiles/ITerm2
mkdir -p $ITERM2DIR

# Clone ITerm2 preferences
rm -rf $ITERM2DIR/Preferences
echo "*** Cloning com.googlecode.iterm2.plist (ITerm2 preferences) ***"
git clone https://github.com/coxy1989/iTermPreferences.git $ITERM2DIR/Preferences

echo "*** Done! ***"