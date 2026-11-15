FROM registry.access.redhat.com/ubi8/ubi-minimal:1794443019@sha256:b3314c5f8d009ee6df04ead732bca6d3eaf011750185e348f55fce2678fb30d0

LABEL maintainer="Radio Bern RaBe"

# Add RaBe CA trust anchor
COPY rabe/rabe-ca.crt /etc/pki/ca-trust/source/anchors/

RUN    update-ca-trust extract \
       # ensure we have everything available from repos \
    && microdnf update -y \
    && microdnf clean all
