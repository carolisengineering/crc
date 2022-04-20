variable "project_name" {}
variable "billing_account" {}
variable "org_id" {}
variable "region" {}

provider "google" {
  project     = var.project_name
}

resource "crc-engineering" "project" {
  name            = var.project_name
  project_id      = random_id.id.hex
  billing_account = var.billing_account
  org_id          = var.org_id
}

module "bucket" {
  name       = var.project_name
  project_id = crc-engineering.project_id
}