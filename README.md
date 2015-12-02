# RAML exercise with JAX-RS

An example of effective developing workflow by integraion of RAML and JAX-RS.


## System requirements

The application this project produces is designed to be run on Red Hat JBoss Enterprise Application Platform 7 or later.


## Deploy

Start the JBoss EAP Server

```
% EAP7_HOME/bin/standalone.sh
```

Build and Deploy

```
% mvn clean install wildfly:deploy
```

Then the application is deployed to http://localhost:8080/raml_exercise .


Undeploy the Archive

```
mvn wildfly:undeploy
```
