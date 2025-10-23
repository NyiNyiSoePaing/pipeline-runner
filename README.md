# 🐳 Docker-in-Docker Build Image 

## 🧩 Prebuilt Image

- **Docker Hub Repository:** [nnsp/pipeline-runner](https://hub.docker.com/r/nnsp/pipeline-runner)
- **Image Tag:** `nnsp/pipeline-runner:<tagname>`
- **Base Layer:** `docker:24.0-dind`

## 🧩 Base Image
- **Image:** `docker:24.0-dind`
- **Purpose:** Enables Docker-in-Docker (DinD) builds for CI/CD pipelines (e.g., Bitbucket, GitLab, GitHub Actions)
- **Docker Daemon:** Included and preconfigured

---

## 🧠 Installed Packages & CLI Tools

| Tool / Package | Version | Source | Purpose |
|----------------|----------|---------|----------|
| **Docker CLI** | `24.0.9` | From base image | Core Docker engine & CLI for building and pushing container images |
| **AWS CLI** | `1.42.57` | Installed via `pip install awscli` | For AWS operations such as S3, ECR, ECS, CloudFormation, etc. |
| **kubectl** | `v1.34.1` | Downloaded from official Kubernetes releases | For Kubernetes cluster management and deployments |
| **kustomize** | `v5.7.1` | Bundled with kubectl | For declarative K8s configuration customization |
| **OpenSSH Client** | latest (Alpine repo, `openssh-client-default`) | SSH connectivity for Git and deployment tasks |
| **bash** | latest (Alpine repo) | From `apk add bash` | For script compatibility (e.g., `bash` shell in pipelines) 

---

## ⚙️ Image Characteristics
- **OS Base:** Alpine Linux (lightweight, ~250 MB total)
- **Container Type:** Docker-in-Docker (`dind`)
- **Default Shell:** `/bin/bash`
- **SSH Strict Host Key Checking:** Disabled for automation

---

## 🧪 Validation Commands
To verify the installation inside a running container:

```bash
docker --version        # Docker version 24.0.9
python3 --version       # Python 3.12.12
pip --version           # pip 24.0
aws --version           # aws-cli/1.42.57
kubectl version --client # Client Version: v1.34.1 , Kustomize Version: v5.7.1
