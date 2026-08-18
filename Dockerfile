FROM node:18-alpine

RUN npm install -g 9router

ENV PORT=20128
EXPOSE 20128

# 9Router paketinin ana JavaScript dosyasını tespit edip doğrudan Node ile ön planda çalıştırır
CMD ["sh", "-c", "MAIN_FILE=$(node -e \"console.log(require.resolve('9router'))\") && exec node $MAIN_FILE --host 0.0.0.0 --port ${PORT:-20128}"]
