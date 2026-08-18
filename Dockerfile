FROM node:18-alpine

WORKDIR /app

# Bağımlılığı yükle
RUN npm init -y && npm install 9router

# Proje dosyalarını (entry.js) içeri kopyala
COPY . .

ENV PORT=20128
EXPOSE 20128

# Doğrudan hazırladığımız entry.js dosyasını çalıştır
CMD ["node", "entry.js"]
