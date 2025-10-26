# Use official Ubuntu as base image
FROM ubuntu:24.04

# Install dependencies (add more if your app needs them)
RUN apt-get update && apt-get install -y \
    ca-certificates \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Copy your app files
COPY . .

# Make binary executable
RUN chmod +x ./o11_v22b1-DRMStuff

# Expose port (not required by Vercel, but good practice)
EXPOSE 10000

# Start the app (Vercel automatically sets PORT)
CMD ["./o11_v22b1-DRMStuff"]
