# Use an official Node.js runtime as a base image
FROM node:14

# Set the working directory inside the container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install application dependencies
RUN npm install

# Copy the rest of the application code to the working directory
COPY . .

# Install PM2 globally
RUN npm install -g pm2

# Expose the port on which your application will run
EXPOSE 3000

# Start the application using PM2
CMD ["pm2-runtime", "start", "index.js"]
