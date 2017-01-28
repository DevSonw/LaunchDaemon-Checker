#! /bin/bash

uname=$(whoami)

read -p "Are you creating a reference file? (y/n) " option
echo ""
if [[ $option == "n"  ]]
then
  echo "Verifying LaunchAgentss..."
  echo ""
  read -p "What version of OS X? (Example: 10.11.6) " version

  shasum /System/Library/LaunchAgents/* -c ./Reference/$version.txt >> /Users/$uname/Desktop/Results.txt
  echo ""
  echo "Process Complete"
  
else
  echo "Creating Reference File..."
  echo ""
  read -p "Which version of OS X are you checking? (Example: 10.11.6) " newversion

  shasum /System/Library/LaunchAgents/* >> ./Reference/$newversion
  echo ""
  echo "Process Complete"
fi

exit
