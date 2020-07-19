GOCMD         		=go
GOBUILD       		=$(GOCMD) build
GOCLEAN       		=$(GOCMD) clean
GOTEST        		=$(GOCMD) test

GOOSL				=linux
GOOSD				=darwin

BINARY_NAME   		=hello_world
BINARY_NAME_DARWIN	=hello_world_d

GOPKGS        		=$(shell go list ./... | grep -v /vendor/)
VERSION       		?=$(shell git describe --tags --always --dirty)-$(shell /bin/date "+%Y%m%d%H%M%S")

DOCKERFILE    		?= Dockerfile
DOCKERFILE_FOLDER	?= .
DOCKER_BASE_IMAGE	=lotharschulz/hello-github-actions
DOCKER_IMAGE		=$(DOCKER_BASE_IMAGE):$(VERSION)

#build static linked binary linux
build: 
		CGO_ENABLED=0 GOOS=$(GOOSL) $(GOBUILD) -a -installsuffix cgo -ldflags '-w -extldflags "-static"' -o $(BINARY_NAME) .

#build static linked binary darwin
build-darwin: 
		CGO_ENABLED=0 GOOS=$(GOOSD) $(GOBUILD) -a -installsuffix cgo -ldflags '-w -extldflags "-static"' -o $(BINARY_NAME_DARWIN) .

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
