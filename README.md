# Encrypted Password Backup System

This is a simple backup system designed to automatically back up encrypted password files that have been modified in the past 24 hours. It uses a Docker container to execute a backup script daily.

## Features

- Automatic backup of encrypted password files.
- Dockerized setup for easy deployment.
- Logging of backup activities.

## Prerequisites

- Docker installed on your system.
## Installation Method 1
1. Pull the docker image:
      ```bash
      docker pull netkap/backup-system

## Installation Method 2

1. Clone this repository:
   ```bash
   git clone https://github.com/netkap/encrypted-password-backup.git

   
2. Navigate to the project directory:
   ```bash
    cd encrypted-password-backup
   
3. Build the Docker image:
    ```bash
   docker build -t backup-system .
## Usage

1. Run the Docker container:

    ```bash
     docker run -d --name backup-container backup-system
 2. Verify that the container is running:

     ```bash
       docker ps

  3. Check the backup logs:

       
       ```bahs
       docker logs backup-container

## Configuration
 No configuration is required. The backup script will use the directory where it is located as the source directory and   create a subdirectory named "backups" for storing backup files.



