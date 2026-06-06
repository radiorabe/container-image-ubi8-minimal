FROM registry.access.redhat.com/ubi8/ubi-minimal:1780550603@sha256:5d76d0cedabd7d7893b28bec684d7a3412dd8d95d186e7d4b6eeed4ea28c327b

LABEL maintainer="Radio Bern RaBe"

# Add RaBe CA trust anchor
COPY rabe/rabe-ca.crt /etc/pki/ca-trust/source/anchors/

RUN    update-ca-trust extract \
       # ensure we have everything available from repos \
    && microdnf update -y \
    && microdnf clean all
