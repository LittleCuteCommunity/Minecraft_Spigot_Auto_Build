#!/bin/bash

set -euo pipefail
buildNumber=`curl https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/buildNumber`
my_number=`curl https://api.github.com/repos/LittleCuteCommunity/Minecraft_Spigot_Auto_Build/releases/latest | jq -r '.tag_name'`

echo latest spigot build tools release Number: $buildNumber
echo latest my_build number: $my_number

# Some times because of network error, it may not be digital, then we exit.
if [ -n "`echo ${my_number} | sed -n '/^[0-9][0-9]*$/p'`" -a -n "`echo ${buildNumber} | sed -n '/^[0-9][0-9]*$/p'`" ];then

    if [ $my_number -eq $buildNumber ];then
        exit 0
    fi
else
    exit 0
fi

curl -O https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar
java -jar -Xmx1024M BuildTools.jar
echo -n $buildNumber > new_build.txt
