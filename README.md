# 🌐 AWS Static Website Hosting with Terraform (Production-Grade)

## 🚀 Overview

This project demonstrates a **production-ready static website deployment** on AWS using Terraform, incorporating:

* Global content delivery (CloudFront)
* Custom domain with HTTPS (Route 53 + ACM)
* Security hardening (WAF + Security Headers)
* Logging & Monitoring (CloudWatch + S3 logs)
* Infrastructure as Code (Terraform)
* Multi-environment support (dev / staging / prod)

---

## 🧱 Architecture

```
                ┌───────────────┐
                │   User 🌍      │
                └──────┬────────┘
                       │ HTTPS
                       ▼
              ┌───────────────────┐
              │   AWS WAF 🛡️      │
              └──────┬────────────┘
                     ▼
          ┌─────────────────────────┐
          │   CloudFront (CDN)      │
          │   + SSL (ACM 🔒)        │
          │   + Security Headers    │
          │   + Custom Errors       │
          └──────┬──────────────────┘
                 ▼
          ┌─────────────────────────┐
          │   S3 Bucket (Private)   │
          │   Static Website Files  │
          └─────────────────────────┘

Logs & Monitoring:
→ S3 (CloudFront logs)
→ CloudWatch (WAF logs + Metrics + Alarms)
```

---

## ⚙️ Features Implemented

### ✅ 1. Static Website Hosting

* S3 bucket stores website content
* Public access blocked for security
* Access only through CloudFront (OAC)

---

### 🌍 2. Global Content Delivery (CDN)

* AWS CloudFront distribution
* Low latency content delivery worldwide
* HTTPS enforced

---

### 🔐 3. Custom Domain + SSL

* Route 53 for DNS management
* ACM certificate (us-east-1 requirement)
* Secure HTTPS access

---

### 🛡️ 4. Web Application Firewall (WAF)

* AWS Managed Rule Set enabled
* Protection against:

  * SQL Injection
  * XSS attacks
  * Common vulnerabilities

---

### 🔒 5. Security Headers

Implemented via CloudFront Response Headers Policy:

* XSS Protection
* HSTS (Strict Transport Security)
* Frame protection (clickjacking prevention)
* Content type protection

---

### 🚫 6. Custom Error Pages

* Handles 403 / 404 errors
* Redirects to custom `error.html`

---

### 📊 7. Logging

#### CloudFront Logging

* Stored in dedicated S3 bucket
* Tracks:

  * Requests
  * IPs
  * URLs

#### WAF Logging

* Sent to CloudWatch Log Groups
* Tracks:

  * Blocked requests
  * Attack patterns

---

### 🚨 8. Monitoring & Alerts

CloudWatch Alarm configured for:

* High 5xx error rate detection
* Helps identify backend or CDN issues

---

### 🌍 9. Multi-Environment Support

Using Terraform variable files (`tfvars`):

| Environment | Domain Example      |
| ----------- | ------------------- |
| dev         | dev.example.com     |
| staging     | staging.example.com |
| prod        | example.com         |

---

### 🔁 10. CI/CD (GitHub Actions)

* Automatic Terraform deployment on push
* Secure AWS authentication using GitHub Secrets
* Supports environment-based deployment

---

## 📁 Project Structure

```
.
├── main.tf
├── variables.tf
├── provider.tf
├── dev.tfvars
├── staging.tfvars
├── prod.tfvars
├── www/
│   ├── index.html
│   └── error.html
└── .github/workflows/
    └── deploy.yml
```

---

## 🛠️ How to Run

### Initialize Terraform

```
terraform init
```

---

### Deploy (Example: Dev)

```
terraform apply -var-file=dev.tfvars
```

---

### Deploy (Production)

```
terraform apply -var-file=prod.tfvars
```

---

### Destroy

```
terraform destroy -var-file=dev.tfvars
```

---

## 🔐 Security Considerations

* S3 bucket is private (no public access)
* CloudFront enforces HTTPS
* WAF protects against common web attacks
* Security headers improve browser safety

---

## 📊 Monitoring & Observability

* CloudFront access logs → S3
* WAF logs → CloudWatch
* Metrics:

  * Requests
  * Error rates
* Alerts:

  * 5xx error spike detection

---

## 🧠 Key Learnings

Through this project:

* Implemented Infrastructure as Code (Terraform)
* Designed secure cloud architecture
* Configured CDN + DNS + SSL
* Applied real-world security practices
* Built CI/CD pipeline for automation
* Implemented observability (logs + monitoring)

---

## 💼 Why This Project Matters

This project demonstrates **real-world DevOps & Cloud Engineering skills**:

* Scalable architecture design
* Secure cloud deployment
* Automation using CI/CD
* Monitoring & alerting systems

👉 This mirrors production systems used in modern cloud environments


