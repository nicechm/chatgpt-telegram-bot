FROM node:18.12.1 as builder

RUN npm install -g pnpm

WORKDIR /app

COPY package.json pnpm-lock.yaml ./

RUN pnpm install 

RUN touch dockerStart.sh

COPY . .

RUN pnpm build

CMD /app/dockerStart.sh