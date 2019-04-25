workflow "shell commands & shaking finger" {
  on = "pull_request"
  resolves = [
    "ls -ltr",
    "post gif on fail",
    "test",
  ]
}

action "test" {
  uses = "lotharschulz/hello-github-actions/action@master"
  args = ["ls -ltr", "make test"]
}

action "post gif on fail" {
  uses = "jessfraz/shaking-finger-action@master"
  secrets = ["GITHUB_TOKEN"]
}

action "ls -ltr" {
  uses = "lotharschulz/hello-github-actions/action@master"
  args = ["ls -ltr"]
  needs = ["test"]
}