FROM ubuntu:24.04

# Install dependencies including ffmpeg
RUN apt-get update && apt-get install -y \
    ca-certificates \
    curl \
    ffmpeg \
    && rm -rf /var/lib/apt/lists/*

# Copy app files into container
WORKDIR /app
COPY . .

# Make binary executable
RUN chmod +x ./o11_streamer

# Render requires apps to bind to $PORT
ENV PORT=10000
EXPOSE 10000

# Start app and bind to Render's dynamic $PORT
CMD ["./o11_streamer", "--port", "10000"]
