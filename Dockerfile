FROM node:18-alpine

WORKDIR /app

# Puppeteer vb. bağımlılıkların indirilmesini engelleyerek hafif kurulum sağlama
ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true
ENV PORT=20128

RUN npm init -y && npm install 9router --no-optional --omit=dev

COPY . .

EXPOSE 20128

CMD ["node", "--max-old-space-size=128", "entry.js"]
