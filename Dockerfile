# Use the official Node.js image with slim tag as the base image
FROM node:slim

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy the package.json and package-lock.json files
COPY package.json package-lock.json ./

# Install dependencies using npm
RUN npm install

# Copy the rest of your application's source code
COPY ./apps/nft-bridge .

RUN npm run build .apps/nft-bridge

RUN npm run build

# Your application's default port
EXPOSE 6969

# Run the app
CMD ["node", "./dist/apps/nft-bridge/src/main.ts"]
