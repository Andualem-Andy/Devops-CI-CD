# Use the official Node.js image as the base image
FROM node:20

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json into the working directory
COPY package*.json ./

# Debugging: List the contents of /app
RUN ls -l /app

# Install dependencies
RUN npm install

# Copy the rest of your application code into the working directory
COPY . .

# Expose the application port
EXPOSE 3000

# Command to run the application
CMD ["npm", "start"]
