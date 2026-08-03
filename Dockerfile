FROM registry.access.redhat.com/ubi8/ubi-minimal:1784730910@sha256:3f0da3cf28b0514a7a52d79f8cd23a2c52f96660015fc0a32024c8732360079a

LABEL maintainer="Radio Bern RaBe"

# Add RaBe CA trust anchor
COPY rabe/rabe-ca.crt /etc/pki/ca-trust/source/anchors/

RUN    update-ca-trust extract \
       # ensure we have everything available from repos \
    && microdnf update -y \
    && microdnf clean all
