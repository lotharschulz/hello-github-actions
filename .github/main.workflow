#workflow "shaking finger action" {
workflow "shell commands" {
  on = "pull_request"
  resolves = ["shell"]
}

action "shell" {
  uses = "lotharschulz/hello-github-actions/action@master"
  args = ["ls -ltr"]
}

# action "post gif on fail" {
#  uses = "jessfraz/shaking-finger-action@master"
#  secrets = ["GITHUB_TOKEN"]
#}