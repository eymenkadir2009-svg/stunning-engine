FROM node:20-alpine

RUN npm install -g 9router

# Railway'in dinamik PORT atamasını ve 0.0.0.0 bağlamını zorunlu kıl
ENV HOST=0.0.0.0
ENV PORT=20128

EXPOSE 20128

WORKDIR /root/.9router

# Ek bayrak vermeden doğrudan başlat (ENV değişkenlerini otomatik okur)
CMD ["9router"]
