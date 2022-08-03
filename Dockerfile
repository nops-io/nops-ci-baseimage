FROM linuxserver/docker-compose:1.29.2
# FROM docker/compose:debian-1.29.2

# RUN apk add wget bash curl make sudo git openssl py3-pip rsync
RUN apt-get update && \
    apt-get install -y wget ca-certificates bash curl make sudo git python3-pip rsync openssl && \
    pip3 install --no-cache-dir awscli boto3 pyyaml requests flake8 && \
    echo "Installing kubectl" && \
    wget https://storage.googleapis.com/kubernetes-release/release/v1.23.5/bin/linux/amd64/kubectl && \
    chmod +x ./kubectl && \
    mv ./kubectl /usr/local/bin/kubectl && \
    echo "Installing helm" && \
    curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash && \
    echo "Installing tilt" && \
    curl -fsSL https://raw.githubusercontent.com/tilt-dev/tilt/master/scripts/install.sh | bash && \
    echo "Installing k3d" && \
    wget -q -O - https://raw.githubusercontent.com/rancher/k3d/main/install.sh | bash && \
    rm -rf /var/lib/apt/lists/*
