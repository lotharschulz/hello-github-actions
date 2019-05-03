workflow "Build" {
  on = "push"
  resolves = [
    "build:release",
    "file listings",
  ]
}

action "settings" {
  uses = "grisumbras/store-env@master"
  env = {
    CC = "/opt/bin/cc"
  }
}

action "build:release" {
  needs = "settings"
  uses = "./ci/build"
  env = {
    BUILD_TYPE = "Release"
  }
}

action "build:debug" {
  needs = "settings"
  uses = "./ci/build"
  env = {
    BUILD_TYPE = "Debug"
  }
}

action "file listings" {
  uses = "./action"
  needs = ["build:debug", "build:release"]
  runs = "ls -lisa"
}