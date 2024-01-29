FROM eclipse-temurin:17-jdk-jammy

ARG JAR_FILE=target/*.jar

COPY ${JAR_FILE} discovery-service.jar

ENTRYPOINT [ "java", "-jar", "/discovery-service.jar" ]

EXPOSE 8761

#
# Spring profile specific docker image:
# ENTRYPOINT [ "java", "-Dspring.profiles.active=docker", "-jar", "/discovery-service.jar" ]
#
#
# Build docker image:
# docker build -t princeabhijeet/discovery-service:latest .
# -t : tag info will be provided in command
# last . : find Dockerfile in current root folder to build docker image 

#
# See all images:
# docker images

#
# Run docker image:
# docker run -d -p8761:8761 --name discovery-service princeabhijeet/discovery-service:latest
# docker run -d -p 8761:8761 --net msnet --name discovery-service princeabhijeet/discovery-service:latest
# -d : detatched mode
# -p : port information
# 8761:8761 : hostport:containerport
# --name : name of container
# last name/imageid : at last should be image name or image id
# docker network create msnet
# docker network rm msnet

#
# see running images/containers
# docker ps -a
#
#
