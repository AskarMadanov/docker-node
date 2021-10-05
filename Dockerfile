# Node.js 
FROM node

# Copy files 
WORKDIR /app
COPY . .

# run npm install
RUN npm install

# Expose port 8080
EXPOSE 8080

# npm start
CMD ["npm","start"]