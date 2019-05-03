workflow "Build" {
  on = "push"
  resolves = ["build:release", "build:debug"]
}

action "settings" {
  uses = "grisumbras/store-env@master"
  env = {
    CC = "/opt/bin/cc""
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