FROM node:20-alpine

# 9Router yükle
RUN npm install -g 9router

ENV HOST=0.0.0.0
ENV PORT=20128

EXPOSE 20128

WORKDIR /root/.9router

# entrypoint betiğini kopyala ve kopyalama izinlerini ver
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

CMD ["/entrypoint.sh"]
