#!/bin/bash

# Start MinIO server
minio server /data --address ":9000" --console-address ":9001" &

# Start nginx
nginx -g "daemon off;"
