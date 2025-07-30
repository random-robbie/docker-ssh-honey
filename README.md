# Docker SSH Honeypot

A simple SSH honeypot in a Docker container. It logs all IP addresses, usernames, and passwords used to attempt to log in.

This container runs a Python-based honeypot that listens on port `2222`. Any connection attempts to this port will be logged.

## How It Works

The `Dockerfile` sets up an Ubuntu environment with a Python script (`entrypoint.sh`) that acts as a low-interaction SSH honeypot. When someone tries to connect to the honeypot, it captures the credentials they use and logs them to the container's output, then disconnects the client.

## How to Use

### 1. Build the Docker Image
```sh
docker build -t ssh-honeypot .
```

### 2. Run the Container
To run the honeypot and expose it on port `2222` of your host machine:
```sh
docker run -d --name ssh-honeypot -p 2222:2222 ssh-honeypot
```
This command maps the host's port 2222 to the container's port 2222, where the honeypot is listening.

### 3. View Logs
All login attempts are logged to the container's standard output. You can view them using the `docker logs` command:
```sh
# View all logs
docker logs ssh-honeypot

# Follow logs in real-time
docker logs -f ssh-honeypot
```
An example log entry will look like this:
```
Honeypot listening on port 2222...
Connection from: ('127.0.0.1', 54321)
Username: root
Password: password123
```

## Disclaimer

This is a honeypot and is intended to be a target. Do not run this on a production server or a machine with sensitive information. Use it for research and educational purposes only.

## Use a VPS from DO

[![DigitalOcean Referral Badge](https://web-platforms.sfo2.cdn.digitaloceanspaces.com/WWW/Badge%201.svg)](https://www.digitalocean.com/?refcode=e22bbff5f6f1&utm_campaign=Referral_Invite&utm_medium=Referral_Program&utm_source=badge)
