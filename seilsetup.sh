#!!! Remember to disable caps lock in System Preferences > keyboard !!!#
#!!! Remember to remap caps to 53 (esc) in Seil.app !!!#

# Fetch Seil .dmg #
echo "*** Fetching Seil ***"
curl https://pqrs.org/osx/karabiner/files/Seil-11.2.0.dmg --output ~/Downloads/Seil.dmg

# Mount dmg #
echo "*** Mounting dmg ***"
sudo hdiutil attach ~/Downloads/Seil.dmg

# Install pkg #
echo "*** Installing pkg ***"
sudo installer -package /Volumes/Seil-11.2.0/Seil.pkg -target /

# Delete dmg and unmount disk #
echo "*** Cleaning up ***"
rm ~/Downloads/Seil.dmg
sudo hdiutil detach /Volumes/Seil-11.2.0