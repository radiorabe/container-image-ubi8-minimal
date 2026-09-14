FROM registry.access.redhat.com/ubi8/ubi-minimal:1789361842@sha256:e2e7f267999e366c768ff36ff69e8c1cf591375f0f27109535570029d1020784

LABEL maintainer="Radio Bern RaBe"

# Add RaBe CA trust anchor
COPY rabe/rabe-ca.crt /etc/pki/ca-trust/source/anchors/

RUN    update-ca-trust extract \
       # ensure we have everything available from repos \
    && microdnf update -y \
    && microdnf clean all
