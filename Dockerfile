FROM ubuntu
RUN apt-get update
RUN apt-get install default-jdk -y
RUN apt-get install tomcat9 -y
EXPOSE 8080
RUN apt-get install maven -y
RUN apt-get install git -y
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git
WORKDIR /boxfuse-sample-java-war-hello
RUN mvn package
WORKDIR /boxfuse-sample-java-war-hello/target
RUN ls
RUN cp hello-1.0.war /var/lib/tomcat9/webapps/
WORKDIR /var/lib/tomcat9/webapps/
CMD ["catalina.sh", "run"]
