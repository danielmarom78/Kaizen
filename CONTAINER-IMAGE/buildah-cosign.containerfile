FROM quay.io/redhat-appstudio/buildah:v1.31.0@sha256:34f12c7b72ec2c28f1ded0c494b428df4791c909f1f174dd21b8ed6a57cf5ddb

# Install wget
RUN yum update -y && yum install -y wget && yum clean all

# Download and install cosign
RUN wget https://github.com/sigstore/cosign/releases/download/v1.13.1/cosign-linux-amd64 -O /usr/local/bin/cosign \
    && chmod +x /usr/local/bin/cosign