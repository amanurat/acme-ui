FROM wgorder/java8-jce
MAINTAINER Bill Gorder <william.gorder>

# Add the application to the container
ADD server/build/libs/acme-ui.jar /data/acme-ui.jar

# Expose
EXPOSE  8081

# Run
CMD ["java", "-jar", "acme-ui.jar"]
