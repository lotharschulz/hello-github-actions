workflow "shell commands & shaking finger" {
  on = "pull_request"
  resolves = [
    "shell",
    "shell 2",
  ]
}

action "shell" {
  uses = "lotharschulz/hello-github-actions/action@master"
  args = ["ls -ltr", "make -help"]
}

action "post gif on fail" {
  uses = "jessfraz/shaking-finger-action@master"
  secrets = ["GITHUB_TOKEN"]
}

action "shell 2" {
  uses = "lotharschulz/hello-github-actions/action@master"
  args = ["ls -ltr"]
  needs = ["post gif on fail", "shell"]
}
