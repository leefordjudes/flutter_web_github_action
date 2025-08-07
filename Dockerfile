FROM ghcr.io/cirruslabs/flutter:3.32.4

# Install zip utility
RUN apt-get update && apt-get install -y zip 

# Add Dart pub global bin to PATH
ENV PATH="/root/.pub-cache/bin:$PATH"

# Set workdir and copy everything
WORKDIR /app

# Copy project files
COPY . .

# Ensure web is enabled
RUN flutter config --enable-web

# Install dependencies
RUN flutter pub get

# Build for web with WASM
RUN flutter build web --wasm

# Zip build output to dist
RUN mkdir -p dist && \
    cd build/web && \
    zip -r ../../dist/web_ui.zip .
