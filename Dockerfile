FROM node:18-slim

# Debian-ভিত্তিক সিস্টেমে ghostscript ইনস্টল (মেমোরি লিক কম হয়)
RUN apt-get update && apt-get install -y \
    ghostscript \
    fonts-dejavu \
    fontconfig \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY package*.json ./
RUN npm install --omit=dev

COPY . .

EXPOSE 8080

CMD ["node", "server.js"]
