PACKAGE          = info.keik.exercises.raml_exercise
GEN_API_DIR      = src/gen/java
GEN_API_DOC_DIR  = doc
RAML_DIR         = src/main/resources/raml
JSONS            = $(wildcard $(RAML_DIR)/*.json)

api-doc: node_modules
	@mkdir -p $(GEN_API_DOC_DIR) && \
  node_modules/.bin/raml2html $(RAML_DIR)/*.raml -o $(GEN_API_DOC_DIR)/api.html

api-mock: node_modules
	@cd $(RAML_DIR) && \
  ../../../../node_modules/.bin/raml-server

api-editor: node_modules
	@node_modules/.bin/api-designer

api-gen: validate-json
	@rm -rf $(GEN_API_DIR) && \
  mkdir -p $(GEN_API_DIR) && \
  java -cp raml-to-jax-rs.jar org.raml.jaxrs.codegen.core.Launcher \
  -basePackageName $(PACKAGE) \
  -outputDirectory $(GEN_API_DIR) \
  -sourceDirectory $(RAML_DIR) \
  -useJsr303Annotations true \
  -jaxrsVersion 2.0 \
  -jsonMapper jackson2

validate-json: node_modules $(JSONS)
	@$(foreach JSON, $(JSONS), echo Validate $(JSON) ...; node_modules/.bin/jsonlint $(JSON) -q || exit;)

node_modules: package.json
	@npm install

.PHONY: api-mock api-editor api-gen validate-json
