FROM node:20-alpine

# Install wait-for
RUN apk add libc6-compat curl
RUN curl -LJO https://raw.githubusercontent.com/eficode/wait-for/master/wait-for \
    && chmod +x ./wait-for \
    && mv ./wait-for /usr/local/bin/wait-for

WORKDIR /app

COPY package*.json ./
RUN npm install

COPY . .

EXPOSE 3002