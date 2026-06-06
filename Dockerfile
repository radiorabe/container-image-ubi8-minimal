FROM registry.access.redhat.com/ubi8/ubi-minimal:8.10-1779772676@sha256:f2e5ee35da5f4dc16770d4319f1753c9b20fc859a98240d804197f1818332a89

LABEL maintainer="Radio Bern RaBe"

# Add RaBe CA trust anchor
COPY rabe/rabe-ca.crt /etc/pki/ca-trust/source/anchors/

RUN    update-ca-trust extract \
       # ensure we have everything available from repos \
    && microdnf update -y \
    && microdnf clean all
