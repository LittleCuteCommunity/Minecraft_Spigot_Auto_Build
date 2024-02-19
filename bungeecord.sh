#!/bin/bash

echo Download and Compress BungeeCord
wget -O ./BungeeCord/BungeeCord.jar https://ci.md-5.net/job/BungeeCord/lastSuccessfulBuild/artifact/bootstrap/target/BungeeCord.jar
wget -O ./BungeeCord/module/cmd_alert.jar https://ci.md-5.net/job/BungeeCord/lastSuccessfulBuild/artifact/module/cmd-alert/target/cmd_alert.jar
wget -O ./BungeeCord/module/cmd_find.jar https://ci.md-5.net/job/BungeeCord/lastSuccessfulBuild/artifact/module/cmd-find/target/cmd_find.jar
wget -O ./BungeeCord/module/cmd_kick.jar https://ci.md-5.net/job/BungeeCord/lastSuccessfulBuild/artifact/module/cmd-kick/target/cmd_kick.jar
wget -O ./BungeeCord/module/cmd_list.jar https://ci.md-5.net/job/BungeeCord/lastSuccessfulBuild/artifact/module/cmd-list/target/cmd_list.jar
wget -O ./BungeeCord/module/cmd_send.jar https://ci.md-5.net/job/BungeeCord/lastSuccessfulBuild/artifact/module/cmd-send/target/cmd_send.jar
wget -O ./BungeeCord/module/cmd_server.jar https://ci.md-5.net/job/BungeeCord/lastSuccessfulBuild/artifact/module/cmd-server/target/cmd_server.jar
wget -O ./BungeeCord/module/reconnect_yaml.jar https://ci.md-5.net/job/BungeeCord/lastSuccessfulBuild/artifact/module/reconnect-yaml/target/reconnect_yaml.jar
zip -q -r ./dist/BungeeCord.zip BungeeCord
