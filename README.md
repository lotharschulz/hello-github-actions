# GitHub Actions

![CI/CD Docker & Dockerhub with actions v2](https://github.com/lotharschulz/hello-github-actions/workflows/CI/CD%20Docker%20&%20Dockerhub%20with%20actions%20v2/badge.svg)

A repository exploring GitHub Actions that serves 2 explorations:

- [Customize Docker Image Tags for GitHub Docker Packages](https://www.lotharschulz.info/2020/07/23/github-packages-docker-image-tags-customization-with-github-actions)
- [CI/CD with Github actions](https://www.lotharschulz.info/2019/08/26/ci-cd-with-github-actions-v2/)

## Publish Docker Image to GitHub Packages

Publishing docker images using a step as above enables you to use all options of the docker cli – within the ubuntu shell in my case [link zu meinem Repo einfügen].
This is more flexible compared with the initial approach and thus my favorite.
However, it also comes with a price: you also need to login and push via docker cli.

Docker image build and publish to [GitHub Package](https://docs.github.com/packages) registry can be done twofold:

- Following [Publishing images to GitHub Packages](https://docs.github.com/actions/language-and-framework-guides/publishing-docker-images#publishing-images-to-github-packages): https://github.com/lotharschulz/hello-github-actions/blob/master/.github/workflows/cicd.yml#L181-L189

- Publish using the docker cli: https://github.com/lotharschulz/hello-github-actions/blob/master/.github/workflows/cicd.yml#L196-L206


See also [Publishing Docker images](https://docs.github.com/en/actions/language-and-framework-guides/publishing-docker-images) for more details.


## CI/CD with Github actions

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

- **Open Source CI/CD components for GitHub Actions** - [Fossasia Summit 2020](https://www.lotharschulz.info/wp-content/uploads/Screenshot_2020-03-14_08-35-27_.png) (remote). Find the slides here: [ls.info Open-Source-CI_CD-components-for-GitHub-Actions-Fossasia-Summit-2020.pdf](https://www.lotharschulz.info/wp-content/uploads/Open-Source-CI_CD-components-for-GitHub-Actions-Fossasia-Summit-2020.pdf)
- **Continuous Integration & Delivery with GitHub Actions** - [Auto Code EU](https://www.auto-code.eu/sessions/solution-keynote-ci-cd-with-github-actions/). Find the slides here: [ls.info CI_CD-with-GitHub-Actions-Auto-Code-Nov-28th-2019.pdf](https://www.lotharschulz.info/wp-content/uploads/CI_CD-with-GitHub-Actions-Auto-Code-Nov-28th-2019.pdf)

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



