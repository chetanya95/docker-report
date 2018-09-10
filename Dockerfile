FROM alpine/git as clone
WORKDIR /app
RUN git clone https://github.com/pramila-git/AutomatedTestReport.git

FROM maven:3.5-jdk-8-alpine as build
WORKDIR /app
COPY --from=clone /app/AutomatedTestReport/testng-test /app
RUN mvn clean test
RUN mkdir /app/reports
CMD cp -R target/surefire-reports /app/reports
