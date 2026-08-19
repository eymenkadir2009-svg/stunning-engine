FROM node:18-alpine

WORKDIR /app

# Puppeteer vb. gereksiz indirmeleri engelle
ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true
ENV NODE_ENV=production
ENV HOSTNAME="0.0.0.0"

# Bağımlılığı kur
RUN npm init -y && npm install 9router --no-optional --omit=dev

COPY . .

# Render varsayılan portu 10000'dir, dinlemesini sağlıyoruz
EXPOSE 10000

# Node.js bellek limitini 256MB ile sınırlandırıp çalıştırıyoruz
CMD ["node", "--max-old-space-size=256", "entry.js"]
