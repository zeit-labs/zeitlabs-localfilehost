FROM python:3.11-slim

RUN apt-get update && \
    apt-get install -y wget libnss3-tools && \
    rm -rf /var/lib/apt/lists/*

# Install mkcert
RUN wget -O /usr/local/bin/mkcert https://github.com/FiloSottile/mkcert/releases/download/v1.4.4/mkcert-v1.4.4-linux-amd64 && \
    chmod +x /usr/local/bin/mkcert

WORKDIR /app

COPY scripts /app/scripts

RUN chmod +x /app/scripts/entrypoint.sh

RUN mkdir /.local

EXPOSE 8888

ARG HOST_USER=1000
ARG HOST_GROUP=1000

RUN chown -R ${HOST_USER}:${HOST_GROUP} /app
RUN chown -R ${HOST_USER}:${HOST_GROUP} /.local
USER ${HOST_USER}:${HOST_GROUP}

ENTRYPOINT ["/app/scripts/entrypoint.sh"]
