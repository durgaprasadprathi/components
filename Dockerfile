FROM ubuntu:18.04

RUN apt-get update

RUN apt-get install default-jdk -y

RUN apt-get install maven -y

RUN mvn -v

COPY pom.xml /usr/local/service/pom.xml

COPY src /usr/local/service/src

WORKDIR /usr/local/service

RUN #!/bin/sh 

RUN export JDBC_DRIVER="org.postgresql.Driver" 

RUN export JDBC_URL="jdbc:postgresql://128.199.17.156/exec_module" 

RUN export POSTGRES_USERNAME="exec_module" 

RUN export POSTGRES_PASSWORD="exec_module1010#" 

RUN export WORKING_DIR="/home/execution-module/" 

RUN export TERRAFORM_POSTGRES_CONN_STR="postgres://exec_module1:exec_module1010@128.199.17.156/exec_module?sslmode=disable"

RUN mvn clean install

FROM tomcat:latest

ADD ./target/execution-module-0.0.1-SNAPSHOT.war /usr/local/tomcat/webapps/

EXPOSE 8080

CMD ["catalina.sh", "run"]
