#!/bin/bash
# tSnap - tesla.sexy installer

cd "/Users/$USER/Library/Application Support/"
echo "[`date`] Changed directory to `pwd`"
mkdir teslasnap
echo "[`date`] Created teslasnap directory"
cd "/Users/$USER/Library/Application Support/teslasnap"
echo "[`date`] Changed directory to `pwd`"
read -p "Paste in your tesla.sexy key: " teslauploadkey
touch uploadkey.txt
echo "[`date`] Created uploadkey file"
echo $teslauploadkey | tr -d '\n' > uploadkey.txt
echo "[`date`] Wrote key ($teslauploadkey) to file"
mkdir temp
echo "[`date`] Created temp directory"
curl -H 'Cache-Control: no-cache' https://raw.githubusercontent.com/dat-insanity/TeslaSnap/main/teslasnap_daemon.sh -o teslasnap_daemon.sh
echo "[`date`] Created and saved teslasnap_daemon"
chmod +X "/Users/$USER/Library/Application Support/teslasnap/teslasnap_daemon.sh"
echo "[`date`] Gave exec permissions to teslasnap_daemon"


cd ~/Library/LaunchAgents/
echo "[`date`] Changed directory to `pwd`"
curl -H 'Cache-Control: no-cache' https://raw.githubusercontent.com/dat-insanity/TeslaSnap/main/sexy.tesla.datinsanity.plist -o sexy.tesla.datinsanity.plist
echo "[`date`] Created and saved sexy.tesla.datinsanity.plist"
sed -i "" "s/REPLACEWITHUSERNAME/`whoami`/g" sexy.tesla.datinsanity.plist
echo "[`date`] Created launch agent for user `whoami`"
cd ~/Desktop
echo "[`date`] Changed directory to `pwd`"
mkdir Screenshots
echo "[`date`] Created screenshots directory. All your screenshots will be saved here."
launchctl load ~/Library/LaunchAgents/sexy.tesla.datinsanity.plist
echo "[`date`] Load the launch agent for teslasnap, under user `whoami`"
defaults write com.apple.screencapture location "~/Library/Application Support/teslasnap/temp"
pkill screencapture
defaults write com.apple.screencapture location "~/Library/Application Support/teslasnap/temp"
# i have to do it twice because sometimes macos shits itself and it dont work
echo "[`date`] Route screenshots to a folder for teslasnap_daemon to upload"
echo "[`date`] Done! Thank you for installing teslasnap! If you have issues with teslasnap, please make a ticket in our server, or dm dat_insanity#2048 \n Note: all your screenshots will now be saved in ~/Desktop/Screenshots"
