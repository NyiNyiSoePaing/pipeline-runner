# Use a modern, stable Docker-in-Docker base image
FROM docker:24.0-dind

# Set environment variables to reduce noise and avoid Python warnings
ENV PYTHONUNBUFFERED=1 \
    PIP_DISABLE_PIP_VERSION_CHECK=1 \
    PIP_NO_CACHE_DIR=1

# Install core tools: Python, pip, Git, SSH client, curl, jq
RUN apk add --no-cache \
      bash \
      git \
      curl \
      jq \
      python3 \
      py3-pip \
      ca-certificates \
      openssh-client-default

# Install AWS CLI (v1 for compatibility; use awscli==2.x for v2 via pip)
RUN pip install --break-system-packages awscli

# Disable SSH host key checking for automation (CI/CD safe)
RUN mkdir -p /root/.ssh && \
    chmod 700 /root/.ssh && \
    echo -e "Host *\n\tStrictHostKeyChecking no\n\n" > /root/.ssh/config

# Install latest stable kubectl
RUN curl -L "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" \
      -o /usr/local/bin/kubectl && \
    chmod +x /usr/local/bin/kubectl

# Verify everything
RUN docker --version && \
    aws --version && \
    kubectl version --client --output=yaml

# Default to ash shell
CMD ["ash"]
