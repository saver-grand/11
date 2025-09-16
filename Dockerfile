FROM ubuntu:24.04

# Install dependencies (add more if needed)
RUN apt-get update && apt-get install -y \
    ca-certificates \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Copy app files into container
WORKDIR /app
COPY . .

# Make binary executable
RUN chmod +x ./o11_v22b1-DRMStuff

# Render requires apps to bind to $PORT
ENV PORT=123
EXPOSE 123

# Start app
CMD ["./o11_streamer"]
