FROM node:latest as tools
WORKDIR /app
COPY package.json package-lock.json ./

RUN npm ci --prod

FROM node:slim

WORKDIR /app
COPY --from=tools /app .
COPY . .
CMD ["node", "server.js"]
