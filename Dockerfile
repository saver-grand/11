FROM ubuntu:24.04

# Install dependencies
RUN apt-get update && apt-get install -y \
    ca-certificates \
    curl \
    gnupg \
    && rm -rf /var/lib/apt/lists/*

# Install Node.js (for Firebase CLI)
RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash - \
    && apt-get install -y nodejs

# Install Firebase CLI globally
RUN npm install -g firebase-tools

# Copy app files
WORKDIR /app
COPY . .

# Firebase credentials (if needed)
ENV GOOGLE_APPLICATION_CREDENTIALS="/app/serviceAccountKey.json"

# Make binary executable
RUN chmod +x ./o11_v22b1-DRMStuff

# Expose port
ENV PORT=123
EXPOSE 123

# Start app
CMD ["./o11_v22b1-DRMStuff"]
