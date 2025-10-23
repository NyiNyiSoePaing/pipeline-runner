# 🐳 Docker-in-Docker Build Image — Installed Tools Documentation

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
| **Python** | `3.12.12` | From Alpine package (`python3`) | Used for scripting, automation, and AWS CLI dependency |
| **pip** | `24.0` | From Alpine package (`py3-pip`) | Python package manager (used to install AWS CLI v1) |
| **AWS CLI** | `1.42.57` | Installed via `pip install awscli` | For AWS operations such as S3, ECR, ECS, CloudFormation, etc. |
| **botocore** | `1.40.57` | Dependency of AWS CLI v1 | AWS SDK core for command functionality |
| **kubectl** | `v1.34.1` | Downloaded from official Kubernetes releases | For Kubernetes cluster management and deployments |
| **kustomize** | `v5.7.1` | Bundled with kubectl | For declarative K8s configuration customization |
| **Git** | latest (Alpine repo) | From `apk add git` | For cloning repositories and managing submodules |
| **curl** | latest (Alpine repo) | From `apk add curl` | For API requests and file downloads |
| **jq** | latest (Alpine repo) | From `apk add jq` | For processing JSON in shell scripts |
| **OpenSSH Client** | latest (Alpine repo, `openssh-client-default`) | SSH connectivity for Git and deployment tasks |
| **bash** | latest (Alpine repo) | From `apk add bash` | For script compatibility (e.g., `bash` shell in pipelines) |
| **groff**, **less** | latest (Alpine repo) | Required by AWS CLI for help documentation and output formatting |
| **ca-certificates** | latest | Enables SSL/TLS communication for AWS, Git, and API calls |

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
