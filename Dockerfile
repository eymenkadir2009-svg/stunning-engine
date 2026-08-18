FROM node:18-alpine

WORKDIR /app

# Sadece paketi yerel olarak yüklüyoruz
RUN npm init -y && npm install 9router

ENV PORT=20128
EXPOSE 20128

# npx/npm kullanmadan doğrudan oluşturulan CLI JS dosyasını Node ile başlatıyoruz
CMD ["node", "--max-old-space-size=256", "./node_modules/9router/bin/index.js", "--host", "0.0.0.0", "--port", "20128"]
