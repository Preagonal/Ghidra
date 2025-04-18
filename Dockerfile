FROM  eclipse-temurin:23 AS build
COPY . /home/gradle/src
USER root
WORKDIR /home/gradle/src
RUN apt update ; apt install -y build-essential python3 python3-pip
RUN ./gradlew -I gradle/support/fetchDependencies.gradle
RUN ./gradlew prepDev
RUN ./gradlew buildGhidra --parallel --no-daemon --stacktrace
