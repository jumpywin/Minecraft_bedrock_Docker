#version: 0.0.1
FROM ubuntu:18.04
MAINTAINER jumpwin "jumpy@outlook.com"
ENV LANG C.UTF-8
RUN sed -i s@/archive.ubuntu.com/@/mirrors.aliyun.com/@g /etc/apt/sources.list
RUN apt-get clean
RUN apt-get update
RUN apt-get install -y default-jre
RUN apt-get install -y libcurl4
ENV time  2020.12.2.10
RUN mkdir Minecraft_bedrock
WORKDIR Minecraft_bedrock
CMD chmod +x /Minecraft_bedrock/bedrock_server
CMD LD_LIBRARY_PATH=. ./bedrock_server
EXPOSE 19132/udp
