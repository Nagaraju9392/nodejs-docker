FROM node:16 AS frst
WORKDIR /app
COPY package*.json ./
RUN npm install  -- production
RUN npm run
COPY . .
EXPOSE 80
FROM frst AS final 
RUN npm install
RUN npm run 
COPY . .
CMD ["node", "index.js"]
