FROM node:18-alpine

# 9Router kurulumu
RUN npm install -g 9router

# Port tanımı
EXPOSE 20128

# Servisi başlatma komutu
CMD ["9router", "--port", "20128"]
