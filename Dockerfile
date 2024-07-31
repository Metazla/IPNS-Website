# Use the official nginx image as the base image
FROM openresty/openresty:latest

RUN apt-get update && \
    apt-get install -y gettext-base openssl curl wget && \
    rm -rf /var/lib/apt/lists/*

# Install Node.js (LTS version)
RUN curl -fsSL https://deb.nodesource.com/setup_lts.x | bash - && \
    apt-get install -y nodejs && \
    rm -rf /var/lib/apt/lists/*

# Set up Yarn Modern (Yarn 2/Berry)
RUN npm install -g corepack pm2 && \
    corepack enable

# Install lua-resty-http
COPY ./nginx/lua-resty-http/* /usr/local/openresty/lualib/resty/

WORKDIR /app

COPY ./package.json ./
COPY ./.yarnrc.yml ./
RUN yarn install

COPY ./src ./src
COPY ./tsconfig.json ./
RUN yarn build

# Copy the default Nginx configuration file and the HTML file to the container
COPY nginx/nginx.conf /etc/nginx/nginx.conf
COPY nginx/default.conf /etc/nginx/conf.d/default.conf
COPY nginx/index.html /usr/share/nginx/html/index.html


# Environment variable for the domain
ENV TARGET_FOLDER=/usr/share/nginx/html/
ENV IPNS=k51qzi5uqu5di6mtyetmj34yhcb7x17thj14kgyhqb79dzt06eh6o86e0hzk0q

# Entrypoint script to run Certbot and start Nginx
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
