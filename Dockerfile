FROM node:18.0 as build-stage

RUN apt-get update

<<<<<<< HEAD
WORKDIR /home/app/
=======
COPY package.json ./
COPY package-lock.json ./

# Set NODE_ENV to development to install dev dependencies
ENV NODE_ENV=development

RUN npm install
>>>>>>> be943ea15f623e4d1a3eee19127d50423af63b74

COPY . .

# RUN npm config set proxy http://10.50.225.222:3128

# RUN npm config set https-proxy http://10.50.225.222:3128

# RUN npm config set https-proxy http://10.50.225.222:3128

<<<<<<< HEAD
RUN npm i

EXPOSE 8083

# Install dumb-init for signal handling
# RUN apt-get -o Acquire::http::proxy="http://10.50.225.222:3128/" install -y dumb-init
RUN apt-get install -y dumb-init

# Use dumb-init to handle signals gracefully
CMD ["dumb-init", "npm", "run", "dev"]

# RUN npm run dev
=======
# Copy built React app from previous stage to NGINX default public folder
COPY --from=build /mart-frontend/build /usr/share/nginx/html

# Expose port 80
EXPOSE 80

# Start NGINX server
CMD ["nginx", "-g", "daemon off;"]
>>>>>>> be943ea15f623e4d1a3eee19127d50423af63b74
