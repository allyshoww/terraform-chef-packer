### TERRAFORM-PACKER-CHEF

The objective of this repo is to deploy an Amazon AMI with OpenVPN installed. This package is installed with Chef and AMI is build with Packer. 

### PRE-REQUISITES

1-) Packer - https://www.packer.io
2-) Terraform - https://www.terraform.io
3-) A AWS Access Keys and Secret Keys credentials (For this repo, you can use an IAM account with full admin access)

### TO-DO

In the first moment, you have to configure your local machine to access a AWS account through the access keys/secret keys. You can input your keys in this command:

```
aws configure
```
After this, clone this repo:
```
git clone 
```

Go to folder Packer and build the image through the command:
```
sudo packer build Image.Base.json
```
When the command is finished, save the AMI code with the image built with OpenVPN in Packer. Now, you need to insert your AWS Secret Key and Access key in terraform.tfvars file.

Now, build an Amazon infrastructure with Terraform. Go to Terraform folder on cloned repo and type
```
terraform init
```

After this, you plan the infrastructure deploy:

```
terraform plan -out="deploy.out"
```
In the end, apply this what was planned in the past step:
```
terraform apply deploy.out
```

To destroy this environment, run this command:
```
terraform destroy
```
