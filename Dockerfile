FROM node:20-alpine

WORKDIR /app

# Install wait-for
RUN apk add --no-cache libc6-compat curl
RUN curl -LJO https://raw.githubusercontent.com/eficode/wait-for/master/wait-for \
    && chmod +x wait-for \
    && mv wait-for /usr/local/bin/wait-for

COPY package*.json ./
RUN npm install

COPY . .

EXPOSE 3002