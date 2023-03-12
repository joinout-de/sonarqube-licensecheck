#!/usr/bin/env bash
set -e
podman cp target/sonarqube-licensecheck-plugin-*-SNAPSHOT.jar sonarqube:/opt/sonarqube/extensions/plugins/
podman stop sonarqube
podman start sonarqube
