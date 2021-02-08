FROM ubuntu:16.04
RUN apt-get update
RUN apt-get install default-jdk -y
ENV CATALINA_HOME /usr/local/tomcat 
ENV PATH $CATALINA_HOME/bin:$PATH 
RUN mkdir -p "$CATALINA_HOME" 
WORKDIR $CATALINA_HOME 
RUN apt-get install wget -y
RUN wget https://downloads.apache.org/tomcat/tomcat-9/v9.0.43/bin/apache-tomcat-9.0.43.tar.gz -O /tmp/tomcat.tar.gz 
RUN cd /tmp && tar xvfz tomcat.tar.gz 
RUN cp -Rv /tmp/apache-tomcat-9.0.43/* /usr/local/tomcat/ 
EXPOSE 8080
RUN pwd
RUN ls 
RUN apt-get install maven -y
RUN apt-get install git -y
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git
WORKDIR $CATALINA_HOME/boxfuse-sample-java-war-hello
RUN mvn package
WORKDIR $CATALINA_HOME/boxfuse-sample-java-war-hello/target
RUN pwd
RUN cp hello-1.0.war /usr/local/tomcat/webapps/
WORKDIR /usr/share/tomcat9/bin
CMD ["/usr/local/tomcat/bin/catalina.sh", "run"]
