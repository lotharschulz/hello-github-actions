workflow "shell commands & shaking finger" {
  on = "pull_request"
  resolves = [
    "post gif on fail",
    "post gif on fail after test",
    "post gif on fail after benchmark",
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

action "post gif on fail after test" {
  uses = "jessfraz/shaking-finger-action@master"
  secrets = ["GITHUB_TOKEN"]
  needs = ["test"]
}

action "post gif on fail after benchmark" {
  uses = "jessfraz/shaking-finger-action@master"
  secrets = ["GITHUB_TOKEN"]
  needs = ["benchmark"]
}

action "post gif on fail" {
  uses = "lotharschulz/hello-github-actions/action@master"
  args = ["ls -ltr"]
  needs = ["post gif on fail after test", "post gif on fail after benchmark"]
}