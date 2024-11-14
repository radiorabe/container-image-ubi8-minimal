FROM registry.access.redhat.com/ubi8/ubi-minimal:8.10-1130

LABEL maintainer="Radio Bern RaBe"

# Add RaBe CA trust anchor
COPY rabe/rabe-ca.crt /etc/pki/ca-trust/source/anchors/

RUN    update-ca-trust extract \
       # ensure we have everything available from repos \
    && microdnf update -y \
    && microdnf clean all \
       # CIS-DI-0006: no unnecessary files in /tmp \
    && rm /tmp/ks-script-*
