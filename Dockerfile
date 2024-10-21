# Node image
FROM node:20

# Dependencies for puppeteer
RUN apt-get update && apt-get install -y \
  hugo \
  --no-install-recommends && \
  rm -rf /var/lib/apt/lists/*

# Create folder and access
RUN mkdir -p /app

# Set working directory
WORKDIR /app

# Copy files
COPY . .

# Install
RUN npm install

# Launch app
CMD [ "hugo", "serve" ]