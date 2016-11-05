# sdk manager

echo "  Checking sdkman installation"

if [ ! -s ~/.sdkman/bin/sdkman-init.sh ]
then
  echo "Installing sdkman"
  curl -s get.sdkman.io | bash
fi
