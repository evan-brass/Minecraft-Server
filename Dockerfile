FROM alpine

# Java
RUN apk update
RUN apk add openjdk17

# Minecraft Java Server
ADD https://launcher.mojang.com/v1/objects/e00c4052dac1d59a1188b2aa9d5a87113aaf1122/server.jar /
VOLUME /world/
EXPOSE 25565

# Fabric Mod Loader
ADD https://maven.fabricmc.net/net/fabricmc/fabric-installer/0.11.0/fabric-installer-0.11.0.jar /
RUN ["java", "-jar", "fabric-installer-0.11.0.jar", "server"]

# Performance mods
ADD https://mediafiles.forgecdn.net/files/3825/272/lithium-fabric-mc1.19-0.8.0.jar /mods/
ADD https://mediafiles.forgecdn.net/files/3832/74/phosphor-fabric-mc1.19.x-0.8.1.jar /mods/

# Simple Voice Chat
ADD https://mediafiles.forgecdn.net/files/3864/158/voicechat-fabric-1.19-2.2.49.jar /mods/
EXPOSE 24454/udp

# Server Files
ADD eula.txt /
ADD server.properties /
ADD ops.json /

# Start Command
CMD ["java", "-jar", "fabric-server-launch.jar", "nogui"]