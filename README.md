# 🌐 AWS Static Website Hosting with Terraform (S3 + CloudFront + Route 53)

## 🚀 Overview

This project demonstrates how to deploy a **secure, scalable, production-ready static website** using AWS and Terraform.

### 🔧 Tech Stack

* **Amazon S3** → stores static website files (HTML, CSS, JS)
* **Amazon CloudFront** → global CDN for fast delivery
* **AWS Route 53** → DNS management for custom domain
* **AWS ACM** → SSL/TLS certificate (HTTPS)
* **Terraform** → Infrastructure as Code (IaC)

---

## 🧱 Architecture Diagram

```
            ┌───────────────┐
            │   User 🌍      │
            └──────┬────────┘
                   │ HTTPS
                   ▼
          ┌───────────────────┐
          │   Route 53 (DNS)  │
          └──────┬────────────┘
                 │
                 ▼
       ┌───────────────────────┐
       │   CloudFront (CDN)    │
       │  + SSL (ACM 🔒)       │
       └──────┬────────────────┘
              │
              ▼
       ┌───────────────────────┐
       │   S3 Bucket (Private) │
       │   Static Files        │
       └───────────────────────┘
```

---

## 📁 Project Structure

```
.
├── main.tf          # Core infrastructure
├── variables.tf     # Input variables
├── provider.tf      # AWS providers (multi-region)
├── www/             # Static website files
│   ├── index.html
│   ├── style.css
│   └── script.js
```

---

## ⚙️ Prerequisites

* AWS Account (Free Tier supported)
* Terraform installed
* AWS CLI configured (`aws configure`)
* A registered domain name (Route 53 or external)

---

## 🧩 Step-by-Step Setup 

### 1️⃣ S3 Bucket (Storage)

Stores your website files securely

---

### 2️⃣ CloudFront (Delivery)

Delivers your website fast across the world.


---

### 3️⃣ Route 53 (DNS)

Maps your domain name to CloudFront.


```
aws-static-website-terraform.com → CloudFront
```

---

### 4️⃣ SSL Certificate (Security)

Adds HTTPS encryption.

⚠️ Must be created in `us-east-1`

---

### 5️⃣ DNS Validation

Proves you own the domain.

👉 AWS gives a code → you place it in DNS → verified ✅

---

### 6️⃣ Route 53 Record (Final Connection)

Connects your domain to CloudFront.

```
User → aws-static-website-terraform.com → CloudFront → S3
```

---

## 🛠️ How to Run

### Initialize Terraform

```bash
terraform init
```

### Preview Changes

```bash
terraform plan
```

### Apply Infrastructure

```bash
terraform apply
```

### Destroy Resources

```bash
terraform destroy
```

---

## 🌐 Access Your Website

```
https://.com
```

---

## 🔐 Security Highlights

* S3 bucket is **private (no public access)**
* CloudFront uses **Origin Access Control (OAC)**
* HTTPS enforced via ACM

---

## 🌿 Git Workflow

This project uses **feature branching (industry practice)**:

* `main` → basic setup (S3 + CloudFront)
* `feature/domain-route53` → custom domain + DNS

Switch between versions:

```bash
git checkout main
git checkout feature/domain-route53
```

---




