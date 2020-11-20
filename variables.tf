## Variables
variable "project" {}
variable "region" { default = "us-central1" }
variable "cluster_name" {default = ""}
variable "network" { default = "default" }
variable "subnetwork" { default = "" }
variable "ip_range_pods" { default = "" }
variable "ip_range_services" { default = "" }