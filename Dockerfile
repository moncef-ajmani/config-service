FROM openjdk:19
EXPOSE 8888
ADD target/config-service.jar config-service.jar
ENTRYPOINT ["java","-jar","/config-service.jar"]