DevOps Assignment – Automated Web Application Deployment on AWS
==============================================================

Objective
------------
Assignment in automation, cloud infrastructure, CI/CD, containerization, monitoring, and security using AWS & domain management.

--------------------------------------------------------------
Implemented Solution
-----------------------

**1. Infrastructure – Terraform**
- Provisioned Resources:
  - EC2 instance (Ubuntu)
  - S3 bucket
  - Security Group (HTTP 80, HTTPS 443, SSH 22 only from whitelisted GitHub Runner IP)

--------------------------------------------------------------

**2. Configuration Management – Shell Script**
- Wrote a bootstrap script to configure EC2:
  - Install Docker, Git, Nginx.
  - Clone the sample application repository.
  - Run the application inside a Docker container.

--------------------------------------------------------------

**3. CI/CD Pipeline – GitHub Actions**
- Workflow (.github/workflows/deploy.yml) configured to:
  - Trigger on push to main branch.
  - Build a Docker image using a multi-stage Dockerfile.
  - Push image to AWS ECR (private repo).
  - Deploy the updated container on EC2 via SSH & Docker run.
- Security:
  - No hardcoded secrets --> used GitHub Encrypted Secrets
  - Dynamic SG rule: CI/CD job temporarily allows GitHub Runner IP for SSH --> auto-removed after deploy.
<img width="1588" height="322" alt="image" src="https://github.com/user-attachments/assets/b3e22d17-d3cc-4c4f-ad20-73fba4d30938" />

--------------------------------------------------------------

**4. Containerization – Docker**
- Built optimized Dockerfile:
  - Multi-stage build 
  - Lightweight base image 
  - .dockerignore to minimize build context.
  - Exposed port 3000 for application.
  <img width="1532" height="119" alt="image" src="https://github.com/user-attachments/assets/69a860b1-6d69-48be-97ee-897adfbf15eb" />

--------------------------------------------------------------

**5. Monitoring & Logging**
- Installed CloudWatch Agent on EC2.
- Metrics monitored:
  - CPU Utilization
  - Memory Usage
- Centralized Logging:
  - Application & Nginx logs forwarded to CloudWatch Logs.
<img width="1587" height="762" alt="image" src="https://github.com/user-attachments/assets/562415c3-d47d-4007-aa6c-017579be98fa" />

--------------------------------------------------------------

**6. Security & Best Practices**
- Secrets Management: Environment variables + AWS Parameter Store.
- Firewall Rules:
  - Only ports 80 and 443 open to public.
  - SSH (22) restricted to GitHub Runner IP (during deployment only).
- Additional Hardening:
  - IAM roles with least privilege (ECR push, CloudWatch write).
  - Containers do not run as root.
  - Nginx configured with basic security headers.
<img width="1588" height="622" alt="image" src="https://github.com/user-attachments/assets/a8ca22dc-5d80-4cf9-95b5-b4847566e487" />

--------------------------------------------------------------

**7. Domain & Traffic Management – Nginx & Cloudflare**
- Nginx configured as a reverse proxy to serve the web application on the domain.
- Enabled HTTP --> HTTPS redirection and applied basic security headers.
- Cloudflare used as DNS provider:
  - Domain A-record updated to point to EC2 public IP.
  - Traffic routed through Cloudflare CDN for performance & DDoS protection.
  - SSL/TLS handled via Cloudflare.
  <img width="1554" height="678" alt="image" src="https://github.com/user-attachments/assets/0580243c-1f3b-441d-8b72-af3d3f0c9843" />

------------------------------------------------------------------
