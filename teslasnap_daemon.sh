#!/bin/bash
# tSnap - tesla.sexy auto uploader

cd "/Users/$USER/Library/Application Support/teslasnap"
uploadkey=$(cat uploadkey.txt | tr -d '\n')
echo `date`\: 'Changed directory successfully to ' `pwd` >> ../logs.txt
cd "/Users/$USER/Library/Application Support/teslasnap/temp"
echo `date`\: 'Changed directory successfully to ' `pwd` >> ../logs.txt

while :
do
sleep 0.2
filecheck=$(ls -1)
        if [[ -z $filecheck ]]
        then
                echo
        else
                echo `date`\: 'Image recieved. Uploading...'>> ../logs.txt
                imageurl=$(curl -XPOST -H ""auth": "$uploadkey"" -F file=@"$filecheck" -F URL=$json:url$ https://api.tesla.sexy/files/upload)
                refinedimgurl=$(echo $imageurl | tr -d '\n' | ../jq .url | sed -e 's/^....//' | tr -d '"')
                echo `date`\: ''$imageurl >> ../logs.txt
                echo $refinedimgurl | tr -d '\n' | pbcopy
                case $refinedimgurl in
                h*) osascript -e 'display notification "Image uploaded successfully." with title "tSnap" sound name "Submarine"' ;;
                *) osascript -e 'display notification "An error occurred. Please ask on our discord for help." with title "tSnap" sound name "Frog"' ;;
                        esac
                cp -a "$filecheck" "/Users/$USER/Desktop/Screenshots/Screenshot-$(date +"%m-%d-%y-%r").png"
                rm -f "$filecheck"
        fi
done
