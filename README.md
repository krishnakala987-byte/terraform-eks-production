# Terraform AWS EKS Production Cluster

## Project Overview

This project provisions a **production-style Kubernetes infrastructure** on AWS using Terraform.

The infrastructure includes:

* Custom VPC network
* Public and private subnets
* Security Groups and Network ACLs
* Amazon EKS cluster
* Managed worker node groups with autoscaling
* Infrastructure as Code using Terraform

The goal of this project is to simulate how **DevOps engineers deploy Kubernetes clusters in real production environments**.

---

## Architecture

```
Local Machine / Management Node
        │
Terraform (Infrastructure as Code)
        │
        ▼
AWS Cloud
 ├── VPC
 │   ├── Public Subnets
 │   ├── Private Subnets
 │   ├── Security Groups
 │   └── Network ACLs
 │
 └── EKS Cluster
     ├── Managed Control Plane
     └── Worker Nodes (Auto Scaling)
```

---

## Technologies Used

* Terraform
* AWS CLI
* Amazon EKS
* Amazon VPC
* Kubernetes
* GitHub

---

## Prerequisites

Before running this project install:

1. Terraform
2. AWS CLI
3. kubectl
4. AWS account

Configure AWS credentials:

```
aws configure
```

---

## Project Structure

```
terraform-aws-eks-cluster
│
├── eks-cluster.tf
├── vpc.tf
├── security-groups.tf
├── variables.tf
├── outputs.tf
├── versions.tf
│
├── README.md
└── LICENSE
```

---

## Deployment Steps

### 1 Initialize Terraform

```
terraform init
```

This downloads required providers and modules.

---

### 2 Review Infrastructure Plan

```
terraform plan
```

This shows the resources that will be created.

---

### 3 Deploy Infrastructure

```
terraform apply -auto-approve
```

Terraform will create:

* VPC
* Subnets
* Security Groups
* EKS Cluster
* Worker Nodes

Deployment usually takes **10-15 minutes**.

---

## Access the Kubernetes Cluster

Update kubeconfig:

```
aws eks update-kubeconfig --region ap-south-1 --name terraform-eks-cluster
```

Verify nodes:

```
kubectl get nodes
```

---

## Cleanup Resources

To avoid AWS charges destroy the infrastructure:

```
terraform destroy
```

---

## Learning Goals

This project demonstrates:

* Infrastructure as Code
* Kubernetes cluster provisioning
* AWS networking architecture
* Terraform module usage
* DevOps automation practices

---

## Credits

This project was inspired by the EKS Terraform project by
Abhishek Veeramalla.

Original Repository:
https://github.com/iam-veeramalla/terraform-eks

The original project is licensed under the Apache License 2.0.

This repository contains modifications and improvements for learning purposes.

---

## Author

Krishna Kala
DevOps & Cloud Enthusiast
