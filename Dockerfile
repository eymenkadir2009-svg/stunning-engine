FROM node:18-alpine

WORKDIR /app

ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true
ENV NODE_ENV=production
ENV HOSTNAME="0.0.0.0"
ENV PORT=10000

# 9router paketini global veya lokal kuruyoruz
RUN npm init -y && npm install 9router --no-optional --omit=dev

EXPOSE 10000

# npx veya child_process kullanmadan doğrudan node_modules/.bin/9router dosyasını çalıştırıyoruz
CMD ["node", "--max-old-space-size=384", "node_modules/9router/dist/index.js"]
