workflow "shell commands & shaking finger" {
  on = "pull_request"
  resolves = [
    "post gif on fail",
    "benchmark",
    "test",
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
  uses = "actions/docker/cli@master"
  args = "build --rm -t lotharschulz/hello-github-actions:{GITHUB_SHA} ."
  needs = ["test"]
}