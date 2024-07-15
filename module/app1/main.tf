module "key1" {
  source = "../keypair"
  region_name = "us-east-1"
  key_name = "dev-key"
}

module "key2" {
  source = "../keypair"
  region_name = "us-east-1"
  key_name = "linux-key"
}

