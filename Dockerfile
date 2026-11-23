FROM registry.access.redhat.com/ubi8/ubi-minimal:1795197011@sha256:0990c03b74757479e30f381206efa1387ea2d5df037ede48c494f1acb041cf69

LABEL maintainer="Radio Bern RaBe"

# Add RaBe CA trust anchor
COPY rabe/rabe-ca.crt /etc/pki/ca-trust/source/anchors/

RUN    update-ca-trust extract \
       # ensure we have everything available from repos \
    && microdnf update -y \
    && microdnf clean all
