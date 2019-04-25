workflow "shell commands & shaking finger" {
  on = "pull_request"
  resolves = ["shell"]
}

action "shell" {
  uses = "lotharschulz/hello-github-actions/action@master"
  args = ["ls -ltr"]
}

action "alpine shell for GitHub Actions" {
  uses = "jessfraz/shaking-finger-action@master"
  needs = ["shell"]
  secrets = ["GITHUB_TOKEN"]
}
