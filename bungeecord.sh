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
