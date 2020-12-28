output "droplet_ipv4_address" {
  value = digitalocean_droplet.this.ipv4_address
}

output "droplet_ipv6_address" {
  value = digitalocean_droplet.this.ipv6_address
}
