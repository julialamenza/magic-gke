# Simple Kubernetes running in GCP and provisioned with terraform


## Installation

[Google Cloud SDK](https://cloud.google.com/sdk/install): these tools are needed to manage Google Cloud

[Terraform 0.12.28](https://www.terraform.io/): provision a new cluster with human readable language HCL.

[Kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl/) is the Kubernetes client cli tool to interact with your newly created cluster.

## Usage

- Clone this repo
- Go to the repo folder
```
- Run - terraform init
export TF_VAR_project=$(gcloud config get-value project)
export TF_VAR_region="us-central1"
export TF_VAR_cluster_name="your-cluster-name"
export GOOGLE_APPLICATION_CREDENTIALS=<you-credential.json>

```
```shell
- Run $terraform plan
- Run $terraform apply
```
**Run this command and watch until there are 3 nodes under the field NUM_NODES.**
```
gcloud container clusters list \
   --filter name=<your-cluster-name>
```
**Add credentials to your KUBECONFIG (~/.kube/config) so that you can interact with this cluster**

```
gcloud container clusters get-credentials <your-cluster-name> \
  --region us-central1
```
**Verify the new context is added and is the primary one with**
```
kubectl config get-contexts

```
**Check your Namespaces**
```
kubectl get namespaces
```
**Check your nodes**
```
kubectl get nodes -n default
```
## Deploying an Application
**The application is inside the "manifest" folder**
```
kubectl apply --filename manifest/hellow-deploy.yml
```
**Check your deployment**
```
kubectl get deployment
```
**Check your service**
```
kubectl get service
```
**You can run this command to view the web application locally - http://localhost:30081
**
```
 kubectl port-forward service/hello-world 30081:80
```

**If you wanna destroy all your infrastructure in GCP**
```
RUN - terraform destroy
```

The docker image belongs to [bhargavshah86](https://cloud.docker.com/repository/docker/bhargavshah86/kube-test)