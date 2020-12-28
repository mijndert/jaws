resource "digitalocean_ssh_key" "this" {
  name               = "Terraform Example"
  public_key         = file("~/.ssh/id_rsa.pub")
}

resource "digitalocean_droplet" "this" {
  name               = var.droplet_name
  image              = var.droplet_image
  region             = var.droplet_region
  size               = var.droplet_size
  backups            = var.droplet_backups
  ipv6               = var.droplet_ipv6
  ssh_keys           = [digitalocean_ssh_key.this.fingerprint]
  user_data          = file("init.conf")
}

resource "digitalocean_firewall" "this" {
  name               = var.firewall_name
  droplet_ids        = [digitalocean_droplet.this.id]

  inbound_rule {
    protocol         = "tcp"
    port_range       = "22"
    source_addresses = ["0.0.0.0/0", "::/0"]
  }

  outbound_rule {
    protocol         = "tcp"
    port_range       = "80"
    destination_addresses = ["0.0.0.0/0", "::/0"]
  }

  outbound_rule {
    protocol         = "tcp"
    port_range       = "443"
    destination_addresses = ["0.0.0.0/0", "::/0"]
  }

  outbound_rule {
    protocol         = "udp"
    port_range       = "53"
    destination_addresses = ["0.0.0.0/0", "::/0"]
  }
}
