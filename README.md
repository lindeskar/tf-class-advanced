# Advanced Terraform class

Exercises in Terraform based on course content. Original class repo: [terraform-gcp-adv-code](https://github.com/nishanthkumarpathi/terraform-gcp-adv-code)

## Using Terraform

Initialize Terraform:
```
terraform init
```
Show planned changes:
```
terraform plan
```
Apply changes:
```
terraform apply
```
*(answer yes if changes are OK)*

## Exercises

Exercise contents will be added to `e<n>.tf` files.

### 00 - Setup

Install and enable dependencies:
- [gcloud CLI](https://cloud.google.com/sdk/docs/install)
- [Terraform](https://www.terraform.io/downloads)

Configure gcloud CLI:
```
gcloud config configurations create my-class-project1234
gcloud init
```

Enable ADC credentials:
```
gcloud auth application-default login
```

Create state bucket:
```
gsutil mb -b on -l europe-west4 gs://my-class-project1234-state
```

Add bucket name to backend configuration in a new file `override.tf`. Example content:
```
terraform {
  backend "gcs" {
    bucket = "my-class-project1234-state"
    prefix = "terraform/tfstate"
  }
}
```

Add overrides for your project and organization in a new file `override.auto.tf`. Example content:
```
google_org_id     = "0123456789"
google_billing_id = "012345A-B45678-987654"
google_project    = "my-class-project1234"
```

Initialize Terraform:
```
terraform init
```

Apply config to enable APIs:
```
terraform apply
```
