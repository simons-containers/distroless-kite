# Distroless Kite container

Bare-bones distroless Kite container image.

## Running

Configure with environment variables from documentation.

Example:

```bash
docker run -it --rm \
  -e ANONYMOUS_USER_ENABLED=true \
  ghcr.io/simons-containers/distroless-kite:latest
```

## Building

| Arg | Description |
|---|---|
| `KITE_VERSION` | Version of Kite to use

Build container using build-args from versions.yaml:

```bash
docker build -t \
  distroless-kite:$(yq -r .kite versions.yaml) \
  $(yq -r 'to_entries | .[] | "--build-arg \(.key | ascii_upcase)_VERSION=\(.value)"' versions.yaml) -f Containerfile .
```

## License

Repository contents (e.g., `Containerfile`, build scripts, and configuration) are licensed under the **MIT License**.

Software included in built container images (such as **Kite**) are provided under their respective upstream licenses and are not covered by the MIT license for this repository.

## Acknowledgements

This project depends on a number of upstream components and data sources:

- **Kite** - A lightweight, modern Kubernetes dashboard that unifies multi-cluster and resource management, enterprise-grade user governance (OAuth, RBAC, and audit logs), and AI agents in one workspace.  
  https://github.com/kite-org/kite
