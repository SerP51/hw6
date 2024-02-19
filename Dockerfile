FROM ubuntu:20.04
RUN apt update
RUN DEBIAN_FRONTEND=noninteractive TZ=Etc/UTC apt-get -y install tzdata
RUN apt install default-jdk tomcat9 maven git -y
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git
RUN mvn -f /boxfuse-sample-java-war-hello/pom.xml package
RUN cp /boxfuse-sample-java-war-hello/target/hello-1.0.war /var/lib/tomcat9/webapps/
EXPOSE 8080
ENV JAVA_HOME /usr/lib/jvm/default-java
WORKDIR /usr/share/tomcat9
RUN cp /usr/share/tomcat9/etc/server.xml /usr/share/tomcat9/conf/
CMD ["bin/catalina.sh", "run"]