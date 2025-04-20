FROM ubuntu:22.04

# Install dependencies
RUN apt update && \
    apt install -y wget nginx curl && \
    wget https://dl.min.io/server/minio/release/linux-amd64/minio && \
    chmod +x minio && \
    mv minio /usr/local/bin/minio && \
    mkdir -p /data

# Copy configs and entrypoint
COPY nginx.conf /etc/nginx/sites-enabled/default
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENV MINIO_ROOT_USER=minioadmin
ENV MINIO_ROOT_PASSWORD=minioadmin

EXPOSE 8080

CMD ["/entrypoint.sh"]

