
BIN_OUTPUT_PATH = bin
TOOL_BIN = bin/gotools/$(shell uname -s)-$(shell uname -m)
UNAME_S ?= $(shell uname -s)

build:
	rm -f $(BIN_OUTPUT_PATH)/renogy
	go build $(LDFLAGS) -o $(BIN_OUTPUT_PATH)/renogy main.go

module.tar.gz: build
	rm -f $(BIN_OUTPUT_PATH)/module.tar.gz
	tar czf $(BIN_OUTPUT_PATH)/module.tar.gz $(BIN_OUTPUT_PATH)/renogy meta.json

renogy: *.go 
	go build -o renogy *.go

clean:
	rm -rf $(BIN_OUTPUT_PATH)/renogy $(BIN_OUTPUT_PATH)/module.tar.gz renogy

gofmt:
	gofmt -w -s .

lint: gofmt
	go mod tidy

update-rdk:
	go get go.viam.com/rdk@latest
	go mod tidy
