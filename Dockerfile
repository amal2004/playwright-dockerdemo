# Use Node.js official image
FROM mcr.microsoft.com/playwright:v1.56.1-jammy


# Set working directory
WORKDIR /tests

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm ci

# Install Playwright browsers
RUN npx playwright install --with-deps

# Copy the rest of the code
COPY . .

# Run Playwright install just in case (browsers already included in base image)
RUN npx playwright install --with-deps

# Default command to run tests
CMD ["npx", "playwright", "test"]
