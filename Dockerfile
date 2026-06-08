# ----------------------------------------------------------------------------
# Etapa 1: Base & Deps
# ----------------------------------------------------------------------------
FROM node:24-alpine AS deps
WORKDIR /app

# Instalar pnpm
RUN npm install -g pnpm

COPY package.json pnpm-lock.yaml ./
RUN pnpm install

# ----------------------------------------------------------------------------
# Etapa 2: Build (Producción)
# ----------------------------------------------------------------------------
FROM deps AS build
COPY . .

# Argumentos para quemar variables de entorno en el build (Vite las necesita aquí)
ARG VITE_API_URL
ENV VITE_API_URL=${VITE_API_URL}

RUN pnpm run build

# ----------------------------------------------------------------------------
# Etapa 3: Run (Nginx)
# ----------------------------------------------------------------------------
FROM nginx:alpine AS prod

# Copiamos la configuración de Nginx
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Copiamos los archivos estáticos generados
COPY --from=build /app/dist /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]