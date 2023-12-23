
FROM node:slim AS builder

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy the package.json and package-lock.json (or yarn.lock) files
COPY package.json package-lock.json ./

# Install any needed packages
RUN npm ci

# Copy the rest of your application's source code
COPY ./apps/nft-bridge .

# Build the application if necessary
#RUN npm run build

COPY --from=builder /usr/src/app/dist ./dist

# Your application's default port
EXPOSE 6969

# Run the app
CMD ["node", "./dist/apps/nft-bridge/src/main.ts"]
