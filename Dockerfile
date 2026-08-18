FROM node:18-alpine

# 9Router kurulumu
RUN npm install -g 9router

ENV PORT=20128
EXPOSE 20128

# 9Router'ı başlatır ve arka planda kapanmasını engellemek için ana süreci canlı tutar
CMD ["sh", "-c", "9router --host 0.0.0.0 --port ${PORT:-20128} & while true; do sleep 1000; done"]
