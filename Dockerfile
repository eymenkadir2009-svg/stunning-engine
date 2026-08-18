FROM node:18-alpine

RUN npm install -g 9router

ENV PORT=20128
EXPOSE 20128

# Bellek limitini sınırlayarak 9Router'ı ön planda tutma
CMD ["sh", "-c", "NODE_OPTIONS='--max-old-space-size=256' 9router --host 0.0.0.0 --port ${PORT:-20128} & tail -f /dev/null"]
