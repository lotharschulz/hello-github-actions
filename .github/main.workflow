workflow "build, test, benchmark, docker build/push & shaking finger" {
  on = "pull_request"
  resolves = [
    "test",
    "benchmark",
    "post gif on fail",
    "globalsettings",
#    "list",
    "docker.build",
    "docker.push",
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

# action "globalsettings" {
#   uses = "grisumbras/store-env@master"
#   env = {
#     IMAGE="lotharschulz/hello-github-actions:$GITHUB_SHA"
#   }
#   needs = ["test"]
# }

# action "list" {
#   uses = "lotharschulz/hello-github-actions/action@master"
#   args = ["ls -aR"]
#   needs = ["globalsettings"]
# }

action "docker.build" {
#  uses = "actions/docker/cli@master"
  uses = "lotharschulz/hello-github-actions/docker/cli@master"
  args = "build -t lotharschulz/hello-github-actions:$GITHUB_SHA ."
#  needs = ["globalsettings"]
  needs = ["test"]
#  needs = ["list"]
}

action "docker.login" {
  uses = "actions/docker/login@master"
  secrets = ["DOCKER_USERNAME", "DOCKER_PASSWORD"]
  needs = ["docker.build"]
}

action "docker.push" {
  uses = "actions/docker/cli@master"
  needs = ["docker.login"]
  secrets = ["GITHUB_TOKEN", "DOCKER_PASSWORD", "DOCKER_USERNAME"]
  args = "push lotharschulz/hello-github-actions:$GITHUB_SHA"
}