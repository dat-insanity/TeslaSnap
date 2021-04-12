#!/bin/bash
# tSnap - tesla.sexy installer

cd "/Users/$USER/Library/LaunchAgents/"
echo "[`date`] Changed directory to `pwd`"
launchctl unload ~/Library/LaunchAgents/sexy.tesla.datinsanity.plist
echo "[`date`] Unload the launch agent for teslasnap, under user `whoami`"
rm -f sexy.tesla.datinsanity.plist
echo "[`date`] Deleted teslasnap directory"
defaults write com.apple.screencapture location "~/Desktop/"
echo "[`date`] Reset screenshot configuration"
cd "/Users/$USER/Library/Application Support/"
echo "[`date`] Changed directory to `pwd`"
rm -rf teslasnap
echo "[`date`] Deleted TeslaSnap folder, with configs."

echo "[`date`] Done! Thank you for using teslasnap! TeslaSnap is now completely removed. Delete me and your good to go :P"
echo "[`date`] Note: your screenshots folder has not been deleted or touched"
