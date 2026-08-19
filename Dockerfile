FROM node:20-alpine

# 9Router paketini yükle
RUN npm install -g 9router

ENV HOST=0.0.0.0
ENV PORT=20128

EXPOSE 20128

WORKDIR /root/.9router

# 9Router'ı arka planda başlatıp container'ın kapanmasını (Exiting...) engelliyoruz
CMD sh -c "9router & tail -f /dev/null"
