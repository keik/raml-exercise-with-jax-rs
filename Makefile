PACKAGE      = info.keik.exercises.raml_exercise
GEN_API_DIR  = src/gen/java
RAML_DIR     = src/main/resources/raml

api-mock: node_modules
	@cd $(RAML_DIR) && \
  ../../../../node_modules/.bin/raml-server

api-editor: node_modules
	@node_modules/.bin/api-designer

api-gen: $(wildcard $(RAML_DIR)/*)
	@mkdir -p $(GEN_API_DIR) && \
  java -cp raml-to-jax-rs.jar org.raml.jaxrs.codegen.core.Launcher \
  -basePackageName $(PACKAGE) \
  -outputDirectory $(GEN_API_DIR) \
  -sourceDirectory $(RAML_DIR) \
  -useJsr303Annotations true \
  -jaxrsVersion 2.0 \
  -jsonMapper jackson2

node_modules: package.json
	@npm install

.PHONY: gen-api
