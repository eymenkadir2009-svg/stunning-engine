FROM node:20-alpine

# 9Router paketini yükle
RUN npm install -g 9router

ENV PORT=20128
EXPOSE 20128

WORKDIR /root/.9router

# 0.0.0.0 ile tüm dış ağ isteklerine açıyoruz
CMD ["9router", "--host", "0.0.0.0", "--port", "20128"]
