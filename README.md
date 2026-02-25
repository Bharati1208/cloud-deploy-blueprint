Cloud Deploy Blueprint – End-to-End DevOps Project

Project Overview
This project demonstrates a complete end-to-end DevOps pipeline using Docker, Kubernetes, AWS EKS, GitHub Actions, Prometheus, and Grafana. The application is containerized using Docker, deployed on AWS EKS using Kubernetes, automated using GitHub Actions CI/CD, and monitored using Prometheus and Grafana.

Project Goals

Containerize application using Docker

Deploy application on Kubernetes (AWS EKS)

Automate deployment using GitHub Actions (CI/CD)

Expose application using AWS LoadBalancer

Monitor application using Prometheus and Grafana

Tools and Technologies Used

Docker

Kubernetes

AWS EKS

AWS EC2

AWS Elastic Load Balancer

GitHub Actions

Helm

Prometheus

Grafana

kubectl

eksctl

Project Structure

cloud-deploy-blueprint/
│
├── docker/
│ └── Dockerfile
│
├── k8s/
│ ├── deployment.yaml
│ └── service.yaml
│
├── .github/workflows/
│ └── cicd.yml
│
└── README.md

Step 1: Build Docker Image

Build Docker image:
docker build -t dockerhub-username/hello-app .

Push Docker image:
docker push dockerhub-username/hello-app

Step 2: Create AWS EKS Cluster

Create cluster:
eksctl create cluster --name bharati-cluster --region us-east-1

Create node group:
eksctl create nodegroup --cluster bharati-cluster --name bharati-nodes --nodes 2

Step 3: Connect kubectl to EKS

aws eks update-kubeconfig --region us-east-1 --name bharati-cluster

Verify cluster:
kubectl get nodes

Step 4: Deploy Application to Kubernetes

kubectl apply -f k8s/deployment.yaml
kubectl apply -f k8s/service.yaml

Verify deployment:
kubectl get pods
kubectl get svc

Step 5: CI/CD using GitHub Actions

CI/CD pipeline automatically performs the following steps:

Builds Docker image

Pushes image to Docker Hub

Deploys application to AWS EKS cluster

This process is triggered automatically when code is pushed to GitHub.

Step 6: Setup Monitoring using Prometheus and Grafana

Install monitoring stack:
helm install monitoring prometheus-community/kube-prometheus-stack

Access Grafana dashboard:
kubectl port-forward svc/monitoring-grafana 3000:80

Open in browser:
http://localhost:3000

Application Access

Application is exposed using AWS LoadBalancer. You can access it using:
http://LoadBalancer-URL

Monitoring

Grafana dashboards provide:

CPU usage

Memory usage

Pod performance

Node performance

Cluster health

CI/CD Pipeline Flow

Developer pushes code → GitHub → GitHub Actions builds Docker image → Pushes image to Docker Hub → Deploys to AWS EKS → Kubernetes runs application → LoadBalancer exposes application → User accesses application

Key Features

Automated deployment using CI/CD

Containerized application using Docker

Cloud deployment using AWS EKS

Kubernetes orchestration

LoadBalancer for external access

Monitoring using Prometheus and Grafana

Production-ready DevOps pipeline

Project Outcome

Successfully built and deployed a complete cloud-native DevOps pipeline with automated deployment and monitoring using industry-standard tools.
