# Use a base Linux image
FROM ubuntu:24.04

# Install necessary packages (adjust if you know what is needed)
RUN apt-get update && apt-get install -y \
    ca-certificates \
    libssl-dev \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Copy the binary
COPY o11_streamer /usr/local/bin/o11_streamer

# Make executable
RUN chmod +x /usr/local/bin/o11_streamer

# Expose default port
EXPOSE 123

# Set environment variable to allow override
ENV PORT 123

# Start command
CMD ["/usr/local/bin/o11_streamer", "--port", "123"]
