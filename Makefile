# File paths
DHF_DIR      = ../sf90
INPUT        = main.md
OUTPUT_DIR   = output
COMBINED     = $(OUTPUT_DIR)/combined.md
HTML_OUTPUT  = $(OUTPUT_DIR)/document.html
PDF_OUTPUT   = $(OUTPUT_DIR)/document.pdf
PREPROCESSOR = preprocess.py
STYLE        = style.css
TEMPLATE     = $(abspath template.html)

PANDOC_PDF_OPTS = \
	--from markdown \
	--standalone \
	--toc \
	--highlight-style tango \
	-o $@ $<

PANDOC_HTML_OPTS = \
	--from markdown \
	--standalone \
	--toc \
	--highlight-style tango \
	--template=$(TEMPLATE) \
	-o $@ $<

all: \
	$(OUTPUT_DIR)/images \
	$(OUTPUT_DIR)/$(STYLE) \
	$(OUTPUT_DIR)/favicon.ico \
	check \
	$(HTML_OUTPUT) \
	$(PDF_OUTPUT)

$(OUTPUT_DIR):
	@echo "📁 Ensure output directory exists."
	mkdir -p $@

$(COMBINED): $(INPUT) | $(OUTPUT_DIR)
	@echo "🔄 Resolve includes"
	python3 $(PREPROCESSOR) $(INPUT) $(COMBINED)

$(OUTPUT_DIR)/$(STYLE): $(STYLE) | $(OUTPUT_DIR)
	@echo "🎨 Copy stylesheet for HTML preview"
	cp -v $(STYLE) $@

$(OUTPUT_DIR)/images: | $(OUTPUT_DIR)
	@echo "🖼️ Copy images for HTML preview"
	cp -rv images $(OUTPUT_DIR)

$(HTML_OUTPUT): $(COMBINED)
	@echo "🌐 Build HTML"
	pandoc $(PANDOC_HTML_OPTS)

$(PDF_OUTPUT): $(COMBINED)
	@echo "📄 Build PDF"
	pandoc $(PANDOC_PDF_OPTS)

clean:
	@echo "🧹 Clean generated files"
	rm -rf $(OUTPUT_DIR)

$(OUTPUT_DIR)/favicon.ico: | $(OUTPUT_DIR)
	@echo "📄 Add placeholder favicon"
	touch $@

check:
	@echo "🔍 Running pre-build checks"
	@test -f $(INPUT) || (echo "Γ¥î Missing: $(INPUT)"; exit 1)
	@test -f $(PREPROCESSOR) || (echo "❌ Missing: $(PREPROCESSOR)"; exit 1)
	@test -f $(STYLE) || (echo "❌ Missing: $(STYLE)"; exit 1)
	@test -f $(TEMPLATE) || (echo "❌ Missing: $(TEMPLATE)"; exit 1)
	@test -d images || (echo "❌ Missing: images directory"; exit 1)
	@echo "✅ All required files are present."

preview:
	@echo "🌍 Serving HTML at http://localhost:8000"
	@cd $(OUTPUT_DIR) && python3 -m http.server

dhf.create:
	@echo "📄 Setup Design History FIle"
	./setup_dhf.sh

dhf.remove:
	@echo "🧹 Remove Design History File"
	rm -rf $(DHF_DIR)

dhf.build:
	@echo "📄 Build Design History File"
	@cd $(DHF_DIR) && docbld

.PHONY: all clean check preview

