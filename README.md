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

Example RESTful API endpoints are:

* http://localhost:8080/raml_exercise/rest/users

* http://localhost:8080/raml_exercise/rest/users

Undeploy the Archive

```
% mvn wildfly:undeploy
```


## TIPS

To output model classes with Bean Validation annotated by [raml-to-jax-rs](https://github.com/mulesoft/raml-for-jax-rs) v1.3.3, we have to do following two points:

* Enable raml-to-jax-rs option `useJsr303Annotations`.
* To output `@NotNull` annotations to model classes, `required` property must be specified in schema definations such like:

  ```
  "properties": {
    "id": {
      "type": "integer",
      "required": true
    }
  }
  ```

  As notes, but the following example would **not** output `@NotNull` annotations:

  ```
  "properties": {
    "id": {
      "type": "integer",
    },
  },
  "required": [
    "id"
  ]
  ```
