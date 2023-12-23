FROM node:slim

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy the package.json and package-lock.json (or yarn.lock) files
COPY ./package.json ./

# Install any needed packages
RUN npm ci

# Copy the rest of your application's source code
COPY ./apps/nft-bridge .

# Build the application if necessary
# RUN npm run build

# Your application's default port
EXPOSE 3000

# Run the app
CMD ["node", "./dist/apps/nft-bridge/src/main.js"]

