FROM alpine

# Java
RUN apk update
RUN apk add openjdk17

# Minecraft Java Server 1.19.1
ADD https://piston-data.mojang.com/v1/objects/8399e1211e95faa421c1507b322dbeae86d604df/server.jar /
VOLUME /world/
VOLUME /logs/
EXPOSE 25565

# Fabric Mod Loader
ADD https://maven.fabricmc.net/net/fabricmc/fabric-installer/0.11.0/fabric-installer-0.11.0.jar /
RUN ["java", "-jar", "fabric-installer-0.11.0.jar", "server"]

# Mods
ADD https://mediafiles.forgecdn.net/files/3902/660/fabric-api-0.58.5%2B1.19.1.jar /mods/
ADD https://mediafiles.forgecdn.net/files/3906/634/lithium-fabric-mc1.19.1-0.8.3.jar /mods/
ADD https://mediafiles.forgecdn.net/files/3832/74/phosphor-fabric-mc1.19.x-0.8.1.jar /mods/
# ADD https://mediafiles.forgecdn.net/files/3865/34/fabric-chunkpregen-0.3.5.jar /mods/
ADD https://mediafiles.forgecdn.net/files/3902/630/flan-1.19-1.8.0-fabric.jar /mods/

# Simple Voice Chat
ADD https://mediafiles.forgecdn.net/files/3902/398/voicechat-fabric-1.19.1-2.2.52.jar /mods/
EXPOSE 24454/udp

# Datapacks
ADD server-pack /world/datapacks/server-pack

# Server Files
ADD eula.txt /
ADD server.properties /
ADD server-icon.png /
ADD ops.json /

# Start Command
CMD ["java", "-jar", "fabric-server-launch.jar", "nogui"]