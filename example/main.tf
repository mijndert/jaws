module "droplet" {
  source = "git::git@github.com:mijndert/jaws.git"
  droplet_name = "example"
  droplet_image = "ubuntu-20-04-x64"
  droplet_region = "FRA1"
  droplet_size = "s-1vcpu-1gb"
  droplet_backups = false
  droplet_ipv6 = true
  firewall_name = "example"
}
