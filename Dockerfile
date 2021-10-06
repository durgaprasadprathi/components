FROM ubuntu:18.04

RUN apt-get update

RUN apt-get install default-jdk -y

RUN apt-get install maven

RUN mvn -v


CMD [""]
