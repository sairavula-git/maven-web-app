#Creating the build environment
FROM maven:latest as build

#Creating app directory in the build container
WORKDIR /app

#Copying the contents to the app directory
COPY . .

#Running Maven build 
RUN mvn clean package

#Spinning up the deployment container
FROM tomcat:8.0.20-jre8

#Copying the war file from Build container to the Deployment container
COPY --from=build /app/target/01-maven-web-app*.war /usr/local/tomcat/webapps/maven-web-app.war
