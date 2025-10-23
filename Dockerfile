# Use a modern, stable Docker-in-Docker base image
FROM docker:28.5-dind

# Install core tools: Python, pip, Git, SSH client, curl, jq
RUN apk add --no-cache \
      git \
      curl \
      jq \
      openssh-client-default

# Install AWS CLI V2
RUN apk add --no-cache  aws-cli

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
    kubectl version --client 

# Default to ash shell
CMD ["ash"]
