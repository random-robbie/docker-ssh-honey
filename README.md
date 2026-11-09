# Docker SSH Honeypot

A low-interaction SSH honeypot running in a Docker container. It captures the usernames and passwords used in connection attempts, along with the source IP address.

The container builds [droberson/ssh-honeypot](https://github.com/droberson/ssh-honeypot) from source on Alpine Linux and listens on port `22`.

## How It Works

The `Dockerfile` uses an Alpine base image, compiles the `ssh-honeypot` binary, generates an RSA host key (`ssh-honeypot.rsa`), and installs the binary. `entrypoint.sh` then launches the honeypot on port `22`, running as the unprivileged `nobody` user:

```sh
ssh-honeypot -r /ssh-honeypot/ssh-honeypot.rsa -p 22 -u nobody
```

When someone tries to connect, the honeypot records the connection details and any credentials they supply, then disconnects the client. It never provides a real shell.

## How to Use

### 1. Build the Docker Image

```sh
docker build -t ssh-honeypot .
```

### 2. Run the Container

To run the honeypot and expose it on port `22` of your host machine:

```sh
docker run -d --name ssh-honeypot -p 22:22 ssh-honeypot
```

This maps the host's port `22` to the container's port `22`, where the honeypot is listening.

### 3. View Logs

Login attempts are logged to the container's standard output. You can view them using the `docker logs` command:

```sh
# View all logs
docker logs ssh-honeypot

# Follow logs in real-time
docker logs -f ssh-honeypot
```

On startup, the container prints:

```
SSH Honeypot is Running...
```

Each connection attempt is then logged with the source IP address and the username and password that were used. If you redirect authentication attempts against the exposed port to this container, you will see the attacker's IP address and their tried credentials in the log output.

## Disclaimer

This is a honeypot and is intended to be a target. Do not run this on a production server or a machine with sensitive information. Use it for research and educational purposes only.

## Use a VPS from DO

[![DigitalOcean Referral Badge](https://web-platforms.sfo2.cdn.digitaloceanspaces.com/WWW/Badge%201.svg)](https://www.digitalocean.com/?refcode=e22bbff5f6f1&utm_campaign=Referral_Invite&utm_medium=Referral_Program&utm_source=badge)

## Author

Robbie Wiggins — [What-Security](https://www.what-security.co.uk) · [GitHub](https://github.com/random-robbie)
