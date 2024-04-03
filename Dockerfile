FROM node:16-alpine
WORKDIR /app
COPY package*.json ./
EXPOSE 80
CMD ["npm", "start"]