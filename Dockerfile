FROM registry.access.redhat.com/ubi8/ubi-minimal:1789521657@sha256:128021168edb5b3013258601a2dffe93fddfed91cf996c08c76a24dfdcd6de13

LABEL maintainer="Radio Bern RaBe"

# Add RaBe CA trust anchor
COPY rabe/rabe-ca.crt /etc/pki/ca-trust/source/anchors/

RUN    update-ca-trust extract \
       # ensure we have everything available from repos \
    && microdnf update -y \
    && microdnf clean all
