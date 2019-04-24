# Hello github actions

### build

``` 
CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -ldflags '-w -extldflags "-static"' -o hello_world .
```

### test
```
go test
go test -v --bench . --benchmem
```