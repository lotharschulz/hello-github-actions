workflow "shell commands & shaking finger" {
  on = "pull_request"
  resolves = [
    "test",
    "benchmark",
    "post gif on fail",
    "build.docker"
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
  uses = "lotharschulz/hello-github-actions/action@master"
  args = ["make build.docker"]
  needs = ["test"]
}