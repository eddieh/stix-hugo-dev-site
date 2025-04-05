PROJROOT := $(patsubst %/,%,$(dir $(abspath $(lastword $(MAKEFILE_LIST)))))

LOCAL_CONFIG ?= local.mk
-include ${LOCAL_CONFIG}

# used to install go
GO0 = /usr/local/go/bin/go

GOPATH = $(PROJROOT)/go

GO_VER = go1.24.2

GO = $(GOPATH)/bin/$(GO_VER)
HUGO = $(GOPATH)/bin/hugo


# UTC 8601 formatted (2020-01-12T09:43:08-0800)
DATE := $(shell date "+%FT%T%z")
BUILD_ROOT = themes/stix/docs

export GOPATH

install-go:
	@echo Installing go GOPATH=$(GOPATH)
	$(GO0) install golang.org/dl/$(GO_VER)@latest
	$(GO) download

check-go:
	@$(GO) version
	$(GO) env GOROOT

install-hugo:
	CGO_ENABLED=1 $(GO) install -tags extended,withdeploy github.com/gohugoio/hugo@latest


build:
	$(HUGO) --destination $(BUILD_ROOT) --logLevel debug


server:
	$(HUGO) server -D -O


.PHONY: build
