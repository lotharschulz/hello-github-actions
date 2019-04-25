workflow "shell commands & shaking finger" {
  on = "pull_request"
  resolves = [
    "test",
    "benchmark"
  ]
}

action "test" {
  uses = "lotharschulz/hello-github-actions/action@master"
  args = ["ls -ltr", "make test"]
}

action "benchmark" {
  uses = "lotharschulz/hello-github-actions/action@master"
  args = ["ls -ltr", "make benchmark"]
}

action "post gif on fail" {
  uses = "jessfraz/shaking-finger-action@master"
  secrets = ["GITHUB_TOKEN"]
  needs = ["benchmark", "test"]
}