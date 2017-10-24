#Old Docker File to build a minimal java 8 image
#FROM alpine:3.6
#RUN apk --update add openjdk8-jre
#CMD ["/usr/bin/java", "-version"]

#New docker File to build my java microservice container for kubernetes
#FROM cpruvost/minimal-java8
#VOLUME /tmp
#RUN mkdir -p /home/myapp
#WORKDIR /home/myapp
#COPY ./target/rest-example-0.2.0.jar /home/myapp
#ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/home/myapp/rest-example-0.2.0.jar"]
#EXPOSE 8090

#New docker File for werker
FROM cpruvost/minimal-java8

# Create app directory; same as Wercker default
RUN mkdir -p /pipeline/source
WORKDIR /pipeline/source

# Bundle app source
COPY . /pipeline/source/
RUN mvn install

EXPOSE 8090
