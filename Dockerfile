# Use a modern, stable Docker-in-Docker base image
FROM docker:28.5-dind

# Install core tools: Python, pip, Git, SSH client, curl, jq
RUN apk add --no-cache --update \
    #   bash \
      git \
      curl \
      jq \
      python3 \
      py3-pip \
    #   ca-certificates \
      openssh-client-default \
      gcc \
      musl-dev \
      python3-dev \
      libffi-dev \
      openssl-dev \
      cargo \
      make

# Install Azure CLI
RUN python3 -m venv /opt/venv \
    && . /opt/venv/bin/activate \
    && pip install --upgrade pip \
    && pip install --no-cache-dir azure-cli \
    && deactivate

# Clean up unnecessary build tools
RUN apk del \
    gcc \
    musl-dev \
    python3-dev \
    libffi-dev \
    openssl-dev \
    cargo \
    make \
    && rm -rf /var/cache/apk/*

# Disable SSH host key checking for automation (CI/CD safe)
RUN mkdir -p /root/.ssh && \
    chmod 700 /root/.ssh && \
    echo -e "Host *\n\tStrictHostKeyChecking no\n\n" > /root/.ssh/config

# Install latest stable kubectl
RUN curl -L "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" \
      -o /usr/local/bin/kubectl && \
    chmod +x /usr/local/bin/kubectl


# Update PATH to include the virtual environment
ENV PATH="/opt/venv/bin:$PATH"

# Verify everything
RUN docker --version && \
    az version && \
    kubectl version --client 

# Default to ash shell
CMD ["ash"]
