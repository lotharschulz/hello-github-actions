workflow "shell commands & shaking finger" {
  on = "pull_request"
  resolves = [
    "post gif on fail",
    "benchmark",
    "test",
    "build.docker",
    "docker.login"
  ]
}

action "test" {
  uses = "lotharschulz/hello-github-actions/action@master"
  args = ["make test"]
}

action "benchmark" {
  uses = "lotharschulz/hello-github-actions/action@master"
  args = ["make benchmark"]
}

action "post gif on fail" {
  uses = "jessfraz/shaking-finger-action@master"
  secrets = ["GITHUB_TOKEN"]
}

action "build.docker" {
  uses = "actions/docker/cli@master"
  args = "build --rm -t lotharschulz/hello-github-actions:$GITHUB_SHA ."
  needs = ["test"]
}

action "docker.login" {
  uses = "actions/docker/login@8cdf801b322af5f369e00d85e9cf3a7122f49108"
  secrets = ["DOCKER_USERNAME", "DOCKER_PASSWORD"]
  needs = ["build.docker"]
}