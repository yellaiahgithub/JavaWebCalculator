FROM maven as build
RUN mkdir /app
WORKDIR /app
COPY . /app 
RUN mvn clean package

FROM tomcat
COPY --from=build /app/target/*.war /usr/local/tomcat/webapps
