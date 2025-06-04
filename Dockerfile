FROM node:20-slim

RUN apt-get update && \
  apt-get install -y \
  ffmpeg \
  imagemagick \
  webp \
  git && \
  apt-get upgrade -y && \
  rm -rf /var/lib/apt/lists/*

WORKDIR /root/zokou

COPY package.json .
RUN npm install

COPY . .

EXPOSE 8000

CMD ["npm","start"]