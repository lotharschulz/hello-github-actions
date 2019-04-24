workflow "do it" {
  on = "issues"
  resolves = ["my action"]
}

action "my action" {
  uses = "my"
  runs = "echo \"my\""
}
