FROM registry.access.redhat.com/ubi8/ubi-minimal:1785826003@sha256:cb964eb2bf491814a681bc9887c83d32d6d4eac7b491c5c8c7fe641a5c586a09

LABEL maintainer="Radio Bern RaBe"

# Add RaBe CA trust anchor
COPY rabe/rabe-ca.crt /etc/pki/ca-trust/source/anchors/

RUN    update-ca-trust extract \
       # ensure we have everything available from repos \
    && microdnf update -y \
    && microdnf clean all
