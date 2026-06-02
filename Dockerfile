# Step 1: Build stage
FROM node:18-alpine AS builder
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

# Step 2: Production stage
FROM node:18-alpine
WORKDIR /app
COPY package*.json ./
# Install only production dependencies (excludes nest CLI, keeping image small)
RUN npm install --production
# Copy the compiled JS files from the builder stage
COPY --from=builder /app/dist ./dist

EXPOSE 3000
# Run the compiled plain JavaScript file directly without needing the 'nest' command
CMD ["node", "dist/main.js"]
