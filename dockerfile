#version: 0.0.1
FROM ubuntu:18.04
MAINTAINER jumpwin "jumpy@outlook.com"
ENV LANG C.UTF-8
RUN sed -i s@/archive.ubuntu.com/@/mirrors.aliyun.com/@g /etc/apt/sources.list
RUN apt-get clean
RUN apt-get update
RUN apt-get install -y default-jre
RUN apt-get install -y libcurl4
RUN apt-get install -y unzip
RUN apt-get install -y wget
#ADD ./Minecraft_bedrock /Minecraft_bedrock
ENV time  2020.12.1.10
RUN wget https://minecraft.azureedge.net/bin-linux/bedrock-server-1.16.101.01.zip
RUN unzip bedrock-server-1.16.101.01.zip -d Minecraft_bedrock/
WORKDIR Minecraft_bedrock
ADD run.sh /Minecraft_bedrock/run.sh
ADD server.properties /Minecraft_bedrock/server.properties
CMD chmod +x run.sh
CMD chmod +x bedrock_server
CMD ./run.sh
EXPOSE 19132/udp
