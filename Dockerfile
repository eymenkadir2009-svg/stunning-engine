FROM node:18-alpine

RUN npm install -g 9router

ENV PORT=20128
EXPOSE 20128

# 9Router'ı başlatır ve Docker sürecini sürekli canlı tutar
CMD ["sh", "-c", "9router --host 0.0.0.0 --port ${PORT:-20128} & tail -f /dev/null"]
