FROM archlinux:base-devel-20260308.0.497099 AS builder

ARG KITE_VERSION
ARG KITE_RELEASE=https://github.com/kite-org/kite/releases/download/v${KITE_VERSION}/kite-amd64-v${KITE_VERSION}.tar.gz

WORKDIR /extract/kite
RUN curl --silent --show-error --location --output kite.tar.gz \
  "${KITE_RELEASE}" \
  && tar xf kite.tar.gz

FROM ghcr.io/simons-containers/distroless-glibc:2.43
ARG KITE_VERSION

COPY --from=builder /extract/kite/bin/kite-amd64 /usr/bin/kite

WORKDIR /var/lib/kite
ENV HOME=/var/lib/kite

ENTRYPOINT ["/usr/bin/kite"]

LABEL org.opencontainers.image.title="distroless kite"
LABEL org.opencontainers.image.description="distroless kite"
LABEL org.opencontainers.image.version="${KITE_VERSION}"
LABEL org.opencontainers.image.source="https://github.com/simons-containers/distroless-kite"
