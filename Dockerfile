FROM node:20-alpine

# 9Router paketini global olarak yükle
RUN npm install -g 9router

# Railway'in atadığı PORT'u veya varsayılan 20128'i kullan
ENV PORT=20128
EXPOSE 20128

# Config verilerinin silinmemesi için çalışma dizini
WORKDIR /root/.9router

# 9Router sunucusunu başlat
CMD ["9router"]
