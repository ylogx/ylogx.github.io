workflow "Page Build" {
  resolves = ["HTTP client"]
  on = "page_build"
}

action "HTTP client" {
  uses = "swinton/httpie.action@8ab0a0e926d091e0444fcacd5eb679d2e2d4ab3d"
  args = ["GET", "shubham.chaudhary.xyz", "title=Checking-Homepage"]
}

workflow "Http Caller Workflow" {
  resolves = ["HTTP client"]
  on = "push"
}

workflow "Http Caller on issues" {
  on = "issues"
  resolves = ["HTTP client"]
}

workflow "On Deploy Status Change" {
  resolves = ["HTTP client"]
  on = "deployment_status"
}

workflow "On Deploy" {
  on = "deployment"
  resolves = ["HTTP client"]
}
