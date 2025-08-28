FROM php:8.3-fpm

# Cài extension cần thiết
RUN apt-get update && apt-get install -y \
    git unzip libzip-dev libicu-dev libonig-dev libxml2-dev \
 && docker-php-ext-install pdo pdo_mysql intl zip \
 && rm -rf /var/lib/apt/lists/*

# Composer
COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

# Build args truyền từ docker-compose.yml
ARG HOST_USER=anh
ARG HOST_UID=1000
ARG HOST_GID=1000

# Tạo user `anh` trong container với UID/GID khớp host
RUN set -eux; \
    if ! getent group "${HOST_GID}" >/dev/null; then \
        groupadd -g "${HOST_GID}" "${HOST_USER}"; \
    fi; \
    if ! id -u "${HOST_USER}" >/dev/null 2>&1; then \
        useradd -m -u "${HOST_UID}" -g "${HOST_GID}" -s /bin/bash "${HOST_USER}"; \
    fi

RUN mkdir -p /home/${HOST_USER}/.composer \
    && chown -R ${HOST_UID}:${HOST_GID} /home/${HOST_USER}
    
RUN mkdir -p /var/www/html/node_modules && \
    chown -R ${HOST_UID}:${HOST_GID} /var/www/html/node_modules

WORKDIR /var/www/html

# Chạy mặc định bằng user `anh`
USER ${HOST_USER}
