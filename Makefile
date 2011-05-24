# Package information

pkgid = agda-text-xml
dependencies = agda-web-uri

# Dependency URIs

export agda-web-uri ?= https://github.com/agda/agda-web-uri/tarball/v0.0.2

# Include the Agda makefile

export agdamakefileuri ?= https://github.com/agda/agda-makefile/raw/v0.0.2/Makefile
export agdamakefile ?= $(CURDIR)/build/share/make/agda-makefile
export CURL ?= curl

$(agdamakefile):
	$(CURL) --create-dir -o $@ $(agdamakefileuri)

include $(agdamakefile)

# Targets

.PHONY: install-agda install-html install-doc install clean veryclean

install-agda: $(agdadir)/Text/XML/Everything.agdai

install-html: $(htmldir)/Text/XML/Everything.html

install-doc:
	$(INSTALL) -D README $(docdir)
	$(INSTALL) -D LICENSE $(docdir)

install: install-dependencies install-agda install-html install-doc

clean:

veryclean:
	rm -rf $(builddir)
