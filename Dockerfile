FROM alpine:3

# Get Helm version to install
ARG HELM_VERSION="3.12.0"
ARG HELM_PLATFORM="amd64"

# Add needed apk Repositories
RUN cat <<EOF >> /etc/apk/repositories
https://dl-cdn.alpinelinux.org/alpine/edge/main
https://dl-cdn.alpinelinux.org/alpine/edge/community
EOF

# Install Tools
RUN apk add --update --no-cache bash git curl yq jq kubectl gettext libintl

# install Helm
RUN wget https://get.helm.sh/helm-v${HELM_VERSION}-linux-${HELM_PLATFORM}.tar.gz -O - | tar -zx && \
    mv linux-${HELM_PLATFORM}/helm /usr/bin/helm && \
    chmod +x /usr/bin/helm && \
    rm -rf linux-${HELM_PLATFORM}
