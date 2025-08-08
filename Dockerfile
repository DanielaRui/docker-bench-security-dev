FROM alpine:3.18@sha256:eece025e432126ce23f223450a0326fbebde39cdf496a85d8c016293fc851978

LABEL \
  org.label-schema.name="docker-bench-security" \
  org.label-schema.url="https://dockerbench.com" \
  org.label-schema.vcs-url="https://github.com/docker/docker-bench-security.git"

# Instalar bash y dependencias necesarias
RUN apk add --no-cache bash iproute2 docker-cli dumb-init jq git

# Clonar el repositorio oficial (o podrías copiar tu versión completa local)
RUN git clone https://github.com/docker/docker-bench-security.git /opt/docker-bench-security

WORKDIR /opt/docker-bench-security

HEALTHCHECK CMD exit 0

# Ejecutar con bash para evitar errores de sintaxis
ENTRYPOINT ["/usr/bin/dumb-init", "bash", "docker-bench-security.sh"]
CMD [""]


