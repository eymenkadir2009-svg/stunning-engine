FROM node:18-alpine

RUN npm install -g 9router

# Render'ın dinamik PORT değişkenine uyum sağlama
ENV PORT=20128
EXPOSE 20128

# 9Router daemon/server komutunu doğrudan ön planda çalıştırır
CMD ["sh", "-c", "exec 9router start --port ${PORT:-20128} --host 0.0.0.0"]
