# terraform-aws-infra

```bash
$ aws --version
```

```bash
$ sudo -i
```

```bash
# wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
# echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
# apt-get update && apt-get install terraform -y
# terraform -version
# exit
```

```bash
$ terraform init
$ terraform plan
$ terraform apply -auto-approve
```
