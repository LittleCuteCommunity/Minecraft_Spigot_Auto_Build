#!/bin/bash

echo Download and Compress BungeeCord
cd BungeeCord
curl -O https://ci.md-5.net/job/BungeeCord/lastSuccessfulBuild/artifact/bootstrap/target/BungeeCord.jar
cd module
curl -O https://ci.md-5.net/job/BungeeCord/lastSuccessfulBuild/artifact/module/cmd-alert/target/cmd_alert.jar
curl -O https://ci.md-5.net/job/BungeeCord/lastSuccessfulBuild/artifact/module/cmd-find/target/cmd_find.jar
curl -O https://ci.md-5.net/job/BungeeCord/lastSuccessfulBuild/artifact/module/cmd-kick/target/cmd_kick.jar
curl -O https://ci.md-5.net/job/BungeeCord/lastSuccessfulBuild/artifact/module/cmd-list/target/cmd_list.jar
curl -O https://ci.md-5.net/job/BungeeCord/lastSuccessfulBuild/artifact/module/cmd-send/target/cmd_send.jar
curl -O https://ci.md-5.net/job/BungeeCord/lastSuccessfulBuild/artifact/module/cmd-server/target/cmd_server.jar
curl -O https://ci.md-5.net/job/BungeeCord/lastSuccessfulBuild/artifact/module/reconnect-yaml/target/reconnect_yaml.jar
cd ..
zip -q -r ../dist/BungeeCord.zip *
cd ..

echo Build Spigot
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
echo -n $buildNumber > new_moe_build.txt
mv spigot-*.jar dist

echo Upload
cd dist
if [ -f 'new_moe_build.txt' ];then
    TAGNAME=$(cat new_moe_build.txt)
    NAME="$(for a in 'spigot-*.jar'; do echo $a; done)"
    bungeecordBuild=`curl https://ci.md-5.net/job/BungeeCord/lastSuccessfulBuild/buildNumber`
    lastNAME=$NAME"_Build_"$TAGNAME"+Bungeecord_build_"$bungeecordBuild
    # hub release create $(for a in 'spigot-*.jar'; do echo -a $a; done) -m "$NAME" -t "master" "$TAGNAME"
    gh release create "$TAGNAME" --target "master" --title "$lastNAME" *
fi
