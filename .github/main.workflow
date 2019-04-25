workflow "shell commands and shaking finger" {
  on = "pull_request"
  resolves = [
    "shell",
    "alpine shell for GitHub Actions",
  ]
}

action "shell" {
  uses = "lotharschulz/hello-github-actions/action@master"
  args = ["ls -ltr"]
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
