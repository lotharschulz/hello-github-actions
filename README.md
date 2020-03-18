# GitHub Actions

A repository exploring GitHub Actions that consists of two versions
- **[CI/CD with Github actions (August 2019 - version 2) ](https://www.lotharschulz.info/2019/08/26/ci-cd-with-github-actions-v2/)**
- **[outdated Version 1: CI/CD with Github actions (May 2019 - version 1)](https://www.lotharschulz.info/2019/05/09/ci-cd-with-github-actions/)**

## CI/CD with Github actions (August 2019 - version 2)

[Since August 8th 2019 _GitHub Actions includes built-in CI/CD_](https://twitter.com/github/status/1159511691480260608). Version 2 of this repository is executing the same CI/CD workflow as the first version <sup>[1](https://www.lotharschulz.info/2019/05/09/ci-cd-with-github-actions/), [2](https://twitter.com/lothar_schulz/status/1159513737142898689), [3](https://www.linkedin.com/posts/lotharschulz_github-actions-now-with-built-in-cicd-happily-activity-6565279455458152448-ECh1) </sup>.

This repository contains one version2 workflow to
- test the go code
- benchmark the go code
- builds a docker image & uploads it to dockerhub
All that is defined in _[cicd.yml](.github/workflows/cicd.yml) file_.

![test, benchmark, docker build/push](screenshot2019-08-23--12.17.35.png) 

### Blog Post

**[CI/CD with GitHub Actions v2](https://www.lotharschulz.info/2019/08/26/ci-cd-with-github-actions-v2/)**

### Presentation

I presented about **Continuous Integration & Delivery with GitHub Actions** at [Auto Code EU](https://www.auto-code.eu/sessions/solution-keynote-ci-cd-with-github-actions/). Find the slides here: [ls.info CI_CD-with-GitHub-Actions-Auto-Code-Nov-28th-2019.pdf](https://www.lotharschulz.info/wp-content/uploads/CI_CD-with-GitHub-Actions-Auto-Code-Nov-28th-2019.pdf)

---
---

## outdated: CI/CD with Github actions (May 2019 - version 1)

[GitHub actions](https://github.com/features/actions) Playground. 

This repository contains one version1 action that
- builds a go binary
- tests the go code
- benchmarks the go code
- builds a docker image
- logs in to docker hub
- pushes the created docker image to dockerhub
- adds a [shaking finger](https://github.com/jessfraz/shaking-finger-action#usage) to a pull request in case an [action](https://developer.github.com/actions/creating-github-actions/creating-a-new-action/) fails


![build, test, benchmark, docker build/push & shaking finger](build_test_benchmark_docker_build_push_and_shaking_finger.png) 

All that is mainly defined in _[main.workflow](.github/main.workflow) file_.

### Blog Post

**[CI/CD with GitHub Actions](https://www.lotharschulz.info/2019/05/09/ci-cd-with-github-actions/)**

### make file targets

#### build
```
make build
```

#### test
```
make test
make benchmark
```

#### run
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

some changes 1
