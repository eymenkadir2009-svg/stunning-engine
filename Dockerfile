FROM node:18-alpine

WORKDIR /app

RUN npm init -y && npm install 9router

ENV PORT=20128
EXPOSE 20128

# 9router paketinin package.json dosyasından ana çalıştırılabilir JavaScript dosyasını bulup doğrudan node ile başlatır
CMD ["sh", "-c", "ENTRY=$(node -e \"const pkg = require('./node_modules/9router/package.json'); console.log(typeof pkg.bin === 'string' ? pkg.bin : (pkg.bin ? Object.values(pkg.bin)[0] : pkg.main))\") && exec node --max-old-space-size=256 ./node_modules/9router/$ENTRY --host 0.0.0.0 --port ${PORT:-20128}"]
