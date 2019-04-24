workflow "workflow1" {
  on = "push"
}

action "Lint" {
  uses = "actions/action-builder/shell@master"
  runs = "go test -v --bench . --benchmem"
  args = "bench"
}

action "Test" {
  uses = "actions/action-builder/shell@master"
  runs = "go test"
  args = "test"
}

action "Build" {
  needs = ["Bench", "Test"]
  uses = "actions/action-builder/docker@master"
  runs = "make"
  args = "build"
}