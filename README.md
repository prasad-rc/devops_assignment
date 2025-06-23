# 🚀 Laravel on AWS EKS with Terraform and Kubernetes

This project showcases the deployment of a Laravel application containerized with Docker, provisioned using Terraform, and deployed to AWS EKS via Kubernetes manifests.



## 📁 Project Structure



├── Dockerfile
├── terraform/
│   ├── main.tf
│   ├── variables.tf
│   └── outputs.tf
├── k8s/
│   ├── laravel-deployment.yaml
│   └── laravel-service.yaml
├── .gitignore
└── README.md





## ⚙️ Prerequisites

- AWS CLI configured (`aws configure`)
- Terraform installed
- kubectl installed
- Docker installed
- AWS IAM user with EKS permissions
- Basic understanding of Terraform & Kubernetes



## 🛠️ Step-by-Step Setup

### 1. Clone the Repository


git clone https://github.com/prasad-rc/laravel-eks-deploy.git
cd laravel-eks-deploy




### 2. Build Docker Image (Optional if using public image)


docker build -t laravel-app .


> 🔁 Optionally, push it to Docker Hub or ECR:


docker tag laravel-app your-dockerhub-username/laravel-app
docker push your-dockerhub-username/laravel-app




### 3. Provision AWS EKS Cluster with Terraform

Navigate to the Terraform directory:


cd terraform
terraform init
terraform apply -auto-approve


> 📌 This creates VPC, Subnets, Internet Gateway, EKS Cluster, and Node Group.



### 4. Configure `kubectl` Access


aws eks --region us-east-1 update-kubeconfig --name laravel-eks-cluster




### 5. Deploy Laravel App to Kubernetes

Navigate to the `k8s` directory:


cd ../k8s
kubectl apply -f laravel-deployment.yaml
kubectl apply -f laravel-service.yaml




## 🌐 Access the Laravel App

Find the LoadBalancer URL:


kubectl get services


Example output:


laravel-service   LoadBalancer   ...   a1d579e5032f04f59855767df73332e5-63732887.us-east-1.elb.amazonaws.com


> 🎉 Visit: [http://a1d579e5032f04f59855767df73332e5-63732887.us-east-1.elb.amazonaws.com](http://a1d579e5032f04f59855767df73332e5-63732887.us-east-1.elb.amazonaws.com)


## ✅ Features Implemented

* ✅ Dockerized Laravel app
* ✅ Terraform provisioning (VPC, Subnets, EKS)
* ✅ Kubernetes manifests for deployment and service
* ✅ AWS EKS cluster setup
* ✅ Application exposed via LoadBalancer



## 🚧 To Do / Future Enhancements

* [ ] Setup CI/CD using GitHub Actions / Jenkins
* [ ] Add Ansible automation for post-deployment configs
* [ ] Enable Prometheus/Grafana for monitoring

## Screen Shots



![image](https://github.com/user-attachments/assets/c36ee044-e6e1-44cc-9dc3-16824095620e)


## 🙌 Author

**Durga Prasad**
DevOps Assignment – Laravel + Docker + Terraform + AWS EKS
