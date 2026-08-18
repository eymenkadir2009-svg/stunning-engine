FROM node:18-alpine

# 9Router kurulumu
RUN npm install -g 9router

# Port tanımı
EXPOSE 20128

# Render'ın dinamik portunu alıp servisi ön planda (foreground) açık tutan komut
CMD ["sh", "-c", "9router --port ${PORT:-20128} & tail -f /dev/null"]
