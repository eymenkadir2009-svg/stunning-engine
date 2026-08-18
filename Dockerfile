FROM node:18-alpine

WORKDIR /app

# Paketi çalışma dizinine yerel (local) olarak kuruyoruz
RUN npm init -y && npm install 9router

ENV PORT=20128
EXPOSE 20128

# Doğrudan node_modules içindeki CLI binary dosyasını ön planda çalıştırıyoruz
CMD ["sh", "-c", "npx 9router --host 0.0.0.0 --port ${PORT:-20128}"]
