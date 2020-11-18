#version: 0.0.1
FROM ubuntu:18.04
MAINTAINER jumpwin "jumpy@outlook.com"
ENV LANG C.UTF-8
RUN sed -i s@/archive.ubuntu.com/@/mirrors.aliyun.com/@g /etc/apt/sources.list
RUN apt-get clean
ENV time  2020.11.16.20
RUN apt-get update
RUN apt-get install -y default-jre
RUN apt-get install -y libcurl4
RUN apt-get install -y unzip
RUN apt-get install -y wget
#ADD ./Minecraft_bedrock /Minecraft_bedrock
RUN wget https://minecraft.azureedge.net/bin-linux/bedrock-server-1.16.100.04.zip
RUN unzip bedrock-server-1.16.100.04.zip -d Minecraft_bedrock/
WORKDIR Minecraft_bedrock
ADD run.sh /Minecraft_bedrock/run.sh
ADD server.properties /Minecraft_bedrock/server.properties
RUN chmod +x run.sh
RUN chmod +x bedrock_server
VOLUME "/Minecraft_bedrock"
CMD ./run.sh
EXPOSE 19132:19132/udp
