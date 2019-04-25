workflow "shell commands" {
  on = "pull_request"
  resolves = ["shell"]
}

action "shell" {
  uses = "lotharschulz/hello-github-actions/action@master"
  args = ["ls -ltr"]
}