## Development with Podman

* you need to fix the volume permissions, `podman unshare`,
  `chown 1000:1000 ~/.local/share/containers/storage/volumes/sonarqube_*/_data`
* you need to start the container with explict uid, otherwise `podman cp` does not work
