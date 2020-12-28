# Jaws

Terraform quickstarter for a Digitalocean Droplet

## Usage

### Prerequisites

- A public key (~/.ssh/id_rsa.pub)
- A Cloud-Config file (init.conf)
- A [Personal Access Token](https://cloud.digitalocean.com/account/api/tokens)

### Set environment variable

In order to access the Digitalocean API you need to set an environement variable in your shell.

```
export DIGITALOCEAN_ACCESS_TOKEN=<personal access token>
```

### Get information from the Digitalocean API

In order to use the module you need to know the names of images and regions. The API provides all information:

```
curl -X GET --silent "https://api.digitalocean.com/v2/images?per_page=999" -H "Authorization: Bearer $DIGITALOCEAN_ACCESS_TOKEN" |jq '.'
```

### Using the module

```
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
```

## Backlog

- [ ] Add optional creation of a DO project
- [ ] Make creation of a firewall optional
- [ ] Use existing SSH key when one is not provided for creation

## Contributing

Contributions are more than welcome! Feel free to submit issues and pull requests for improvements or bug fixes.
