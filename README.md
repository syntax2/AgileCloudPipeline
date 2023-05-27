# AgileCloudPipeline
The project aims to deploy a scalable application infrastructure on AWS using Terraform, eksctl, Ansible, and Jenkins, Docker.

**Project Description**
The project creates the necessary infrastructure using Terraform and sets up an EKS cluster using eksctl. To run the command kubectl top nodes, the Metric Server needs to be installed. Additionally, a cluster autoscaler has been configured, redis deployment file is used to make the pods data persistent. furthermore Ansible is used to install Docker on the target group.
Push the application image to Docker Hub using the Dockerfile, which is then used in the Jenkins pipeline.

*The following steps outline the project's execution:*

## Instructions

To run this project, please follow the steps below:

1. Install Terraform on your ec2 instance.

2. Create the infrastructure using Terraform by executing the following commands:


  
cd terraform
   ```
terraform init
   terraform apply
```


Install eksctl .

Create the EKS cluster using eksctl by executing the following command:

`eksctl create cluster -f eksctl-config/my-eks-conf.yaml`
then ,Install the Metric Server for Kubernetes.

Configure Cluster Autoscaler by applying the configuration file:

`kubectl apply -f cluster-autoscaler-autodiscover.yaml`
Install Prometheus for monitoring by executing the necessary steps specified in the documentation.

Add another node group to the EKS cluster with taints using eksctl:

`eksctl create nodegroup --config-file=eksctl-config/my-eks-conf.yaml`

Deploy the Redis CLI using the YAML file:

`kubectl apply -f redis-cli-deployment.yaml`

Push the app image to Docker Hub using the provided Dockerfile.

Set up Jenkins and configure the Jenkins pipeline to use the app image.

Install Ansible.

Run the Ansible playbook to install Docker on the target group:

```
cd Ansible
ansible-playbook playbook.yaml
```
Deploy the application using the deployment YAML file:

`kubectl apply -f node-manifests/deployment.yaml`
Access your application using the appropriate URL or ingress specified in the deployment.

Note: Please refer to the code files for more details and customization options.



`Make sure to replace any placeholder values, such as file paths or URLs, with the actual values specific to you.`
