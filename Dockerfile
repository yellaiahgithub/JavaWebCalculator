FROM maven:3-adoptopenjdk-8 as build
RUN mkdir /app
WORKDIR /app
COPY . /app 
RUN mvn clean package

FROM tomcat:8.0
COPY --from=build /app/target/*.war /usr/local/tomcat/webapps
