FROM ubuntu:20.04
RUN apt update
RUN DEBIAN_FRONTEND=noninteractive TZ=Etc/UTC apt-get -y install tzdata
RUN apt install default-jdk tomcat9 maven git -y
RUN cd /tmp
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git
RUN cd boxfuse-sample-java-war-hello/
RUN mvn -f ./pom.xml package
RUN cd target/
RUN cp hello-1.0.war /var/lib/tomcat9/webapps/
EXPOSE 8080