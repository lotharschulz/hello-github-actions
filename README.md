# Hello GitHub actions

This is my playground repository for [GitHub actions](https://github.com/features/actions). 

This one contains one action that
- build a go binary
- tests the go code
- benchmarks the go code
- builds a docker image
- logs in to docker hub
- pushes the created docker image to dockerhub
- adds a [shaking finger](https://github.com/jessfraz/shaking-finger-action#usage) to a pull request in case an [action](https://developer.github.com/actions/creating-github-actions/creating-a-new-action/) fails


![build, test, benchmark, docker build/push & shaking finger](build_test_benchmark_docker_build_push_and_shaking_finger.png) 

All that is mainly defined in _[main.workflow](github/main.workflow) file_.

## make file targets

### build
```
make build
```

### test
```
make test
make benchmark
```

### run
```
make run
```

### build docker image
```
make build.docker
```

### clean
```
make clean
```

some changes +23