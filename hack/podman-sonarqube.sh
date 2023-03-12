#!/usr/bin/env bash

volumes=(sonarqube_extensions sonarqube_data sonarqube_logs)
for volume in "${volumes[@]}"; do
  podman volume inspect "$volume" &>/dev/null || podman volume create "$volume"
done

podman container inspect sonarqube && podman start sonarqube ||
  podman run -d \
  -p 9000:9000 \
  -v sonarqube_extensions:/opt/sonarqube/extensions \
  -v sonarqube_data:/opt/sonarqube/data \
  -v sonarqube_logs:/opt/sonarqube/logs \
  --name sonarqube --user 1000 \
  docker.io/sonarqube:lts-community
