FROM alpine

# Java
RUN apk update
RUN apk add openjdk17

# Minecraft Java Server 1.19.2
ADD https://piston-data.mojang.com/v1/objects/f69c284232d7c7580bd89a5a4931c3581eae1378/server.jar /
VOLUME /world/
VOLUME /logs/
EXPOSE 25565

# Fabric Mod Loader
ADD https://maven.fabricmc.net/net/fabricmc/fabric-installer/0.11.0/fabric-installer-0.11.0.jar /
RUN ["java", "-jar", "fabric-installer-0.11.0.jar", "server"]

# Mods
ADD https://mediafiles.forgecdn.net/files/3921/681/fabric-api-0.59.0%2B1.19.2.jar /mods/
ADD https://mediafiles.forgecdn.net/files/3923/806/lithium-fabric-mc1.19.2-0.8.3.jar /mods/
ADD https://mediafiles.forgecdn.net/files/3832/74/phosphor-fabric-mc1.19.x-0.8.1.jar /mods/
# ADD https://mediafiles.forgecdn.net/files/3865/34/fabric-chunkpregen-0.3.5.jar /mods/
ADD https://mediafiles.forgecdn.net/files/3915/913/flan-1.19-1.8.1-fabric.jar /mods/

# Simple Voice Chat
ADD https://mediafiles.forgecdn.net/files/3930/694/voicechat-fabric-1.19.2-2.3.5.jar /mods/
EXPOSE 24454/udp

# Server Files
ADD eula.txt /
ADD server.properties /
ADD server-icon.png /
ADD ops.json /

# Start Command
CMD ["java", "-jar", "fabric-server-launch.jar", "nogui"]