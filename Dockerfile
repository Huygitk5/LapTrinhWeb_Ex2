
# Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
# Click nbfs://nbhost/SystemFileSystem/Templates/Other/Dockerfile to edit this template

FROM maven:3.8.1-openjdk-17-slim AS builder
WORKDIR /deployServletProject
COPY . .
RUN mvn clean package -DskipTests

FROM tomcat:9.0.108-jdk17-corretto
RUN rm -rf /usr/local/tomcat/webapps/* //xóa mặc định của tomcat
COPY --from=builder /Tuan1_Buoi2-1.0-SNAPSHOT/target/Tuan1_Buoi2-1.0-SNAPSHOT.war /usr/local/tomcat/webapps/ROOT.war
EXPOSE 8080
CMD ["catalina.sh", "run"]