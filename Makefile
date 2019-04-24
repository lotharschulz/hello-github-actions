GOCMD         		=go
GOBUILD       		=$(GOCMD) build
GOCLEAN       		=$(GOCMD) clean
GOTEST        		=$(GOCMD) test
GOGET         		=$(GOCMD) get
BINARY_NAME   		=hello_world

GOPKGS        		=$(shell go list ./... | grep -v /vendor/)
VERSION       		?=$(shell git describe --tags --always --dirty)-$(shell /bin/date "+%Y%m%d%H%M%S")

DOCKERFILE    		?= Dockerfile
DOCKERFILE_FOLDER	?= .
DOCKER_BASE_IMAGE	=lotharschulz/hello-github-actions
DOCKER_IMAGE		=$(DOCKER_BASE_IMAGE):$(VERSION)

#build static linked binary
build: 
		CGO_ENABLED=0 GOOS=linux $(GOBUILD) -a -installsuffix cgo -ldflags '-w -extldflags "-static"' -o $(BINARY_NAME) .

# test
test: 
		$(GOTEST) -v ./...

# benchmark
benchmark: 
		$(GOTEST) -v --bench . --benchmem

# clean
clean: 
		$(GOCLEAN)
		rm -f $(BINARY_NAME)

# run
run:
		$(GOBUILD) -o $(BINARY_NAME) -v ./...
		chmod +x ./$(BINARY_NAME)
		./$(BINARY_NAME)

# docker build
build.docker: build
	docker build --rm -t $(DOCKER_IMAGE) -f $(DOCKERFILE) $(DOCKERFILE_FOLDER)
