FROM registry.access.redhat.com/ubi8/ubi-minimal:8.5-243.1651231653

LABEL maintainer="Radio Bern RaBe"

# Add RaBe CA trust anchor
COPY rabe/rabe-ca.crt /etc/pki/ca-trust/source/anchors/

RUN    update-ca-trust extract \
       # CIS-DI-0006: no unnecessary files in /tmp \
    && rm /tmp/ks-script-*
