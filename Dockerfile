# Build from Ubuntu stable
FROM ubuntu:16.04

# Fetch Node and install it, along with the other system tools
RUN apt-get update && apt-get -y install \
    curl \
    bzip2 \
    libfreetype6 \
    libfontconfig \
    bash
RUN curl -sL https://deb.nodesource.com/setup_7.x | bash -
RUN apt-get update && apt-get -y install \
    nodejs \
    git

# Install dev tools with npm
RUN npm install -g \
    angular-cli@latest \
    protractor \
    bower

# Create the development environment
RUN mkdir /dev-env
RUN chmod 777 /dev-env

# Expose default angular-cli port
EXPOSE 4200

# Run with bash
WORKDIR /dev-env
CMD ["/bin/bash"]