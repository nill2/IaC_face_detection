# Oracle Cloud Infrastructure - Terraform VM Setup with Dockerized Face Detection App

This repository contains a Terraform configuration to deploy a free-tier virtual machine (VM) on Oracle Cloud Infrastructure (OCI). The VM is configured to run a Dockerized face detection application using the Docker image `nill2/face_detection:latest`.

---

## Features

- Provisions a free-tier VM instance (`VM.Standard.E2.1.Micro`) in OCI.
- Configures networking (VCN, Subnet, Internet Gateway, Route Table).
- Installs Docker using a cloud-init script.
- Pulls and runs the face detection Docker image.
- Outputs the public IP of the VM for accessing the application.

---

## Prerequisites

1. **Terraform**: Install [Terraform CLI](https://developer.hashicorp.com/terraform/downloads).
2. **OCI CLI**: Set up the [OCI CLI](https://docs.oracle.com/en-us/iaas/Content/API/SDKDocs/cliinstall.htm) (optional for troubleshooting).
3. **Oracle Cloud Account**: Ensure you have:
   - Tenancy OCID
   - User OCID
   - Compartment OCID
   - API Key with its Fingerprint
   - Private Key file for API Key
4. **Public/Private SSH Key Pair**: For SSH access to the VM.

---

## Configuration

Replace the placeholders in `main.tf` with your Oracle Cloud details:

| Parameter                       | Description                                                                                   |
|---------------------------------|-----------------------------------------------------------------------------------------------|
| `tenancy_ocid`                  | Your Tenancy OCID (found in **Tenancy Details**).                                             |
| `user_ocid`                     | Your User OCID (found in **Identity > Users**).                                               |
| `compartment_id`                | Your Compartment OCID (found in **Identity > Compartments**).                                 |
| `fingerprint`                   | Fingerprint of the API key (displayed when uploading the public key).                         |
| `private_key_path`              | Path to your private API key file.                                                           |
| `region`                        | Region for deployment (e.g., `eu-frankfurt-1`).                                              |
| `availability_domain`           | Availability Domain for the instance (e.g., `AD-1`).                                         |
| `oci_image_ocid_for_ubuntu_22_04` | OCID for Ubuntu 22.04 image (found using the CLI or Console).                                |

---

## Deployment

### Steps to Deploy

1. Clone this repository:

   ```bash
   git clone <repository-url>
   cd <repository-name>
   ```

2. Initialize Terraform:

   ```bash
   terraform init
   ```

3. Review the plan:

    ```bash
   terraform plan
   ```

4. Apply the configuration:

    ```bash
   terraform apply
   ```
