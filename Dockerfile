# Use a base image, for example, Ubuntu
FROM ubuntu:latest

# Install necessary packages
RUN apt-get update && \
    apt-get install -y rsync

# Copy backup script into the container
COPY backup_script.sh /backup_script.sh

# Set execute permissions for the backup script
RUN chmod +x /backup_script.sh

# Create a log directory
RUN mkdir -p /var/log/backup

# Set up the cron job directly in the Dockerfile
RUN echo "0 0 * * * /backup_script.sh >> /var/log/backup/backup.log 2>&1" > /etc/cron.d/backup_cron

# Give execute permission to the cron job
RUN chmod 0644 /etc/cron.d/backup_cron

# Run the cron service in the foreground
CMD ["cron", "-f"]

