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

| Tool / Package | Version | Source |
|----------------|----------|---------|
| **Docker CLI** | `28.5.1` | From base image |
| **AWS CLI** | `2.27.25` | Installed via `pip install awscli` |
| **kubectl** | `v1.34.1` | Downloaded from official Kubernetes releases |
| **kustomize** | `v5.7.1` | Bundled with kubectl |
| **OpenSSH Client** | latest (Alpine repo, `openssh-client-default`) | 


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
