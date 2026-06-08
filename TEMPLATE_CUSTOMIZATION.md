# 🎨 Guía de Personalización de Plantilla

Esta guía explica detalladamente todos los archivos y lugares que debes modificar si utilizas este proyecto como plantilla para crear nuevos proyectos.

---

## 📋 Tabla de Contenidos

1. [Información Básica del Proyecto](#información-básica-del-proyecto)
2. [Archivos de Configuración Principal](#archivos-de-configuración-principal)
3. [Configuración de Docker](#configuración-de-docker)
4. [Configuración de GitHub Actions](#configuración-de-github-actions)
5. [Documentación](#documentación)
6. [Variables de Entorno](#variables-de-entorno)
7. [Archivos de Git](#archivos-de-git)
8. [Configuración de Linting y Formateo](#configuración-de-linting-y-formateo)
9. [Configuración de Testing](#configuración-de-testing)
10. [Código Fuente](#código-fuente)
11. [Checklist Completo](#checklist-completo)
12. [Script de Automatización (Opcional)](#script-de-automatización-opcional)

---

## 🔍 Información Básica del Proyecto

### Nombre del Proyecto Actual

- **Nombre:** `react-starter-pnpm`
- **Descripción:** React + TypeScript + Vite starter with best practices
- **Autor:** (Tu nombre)

### Qué Personalizar

- Nombre del proyecto
- Descripción
- Autor
- Versión inicial
- Licencia
- URLs (repository, homepage, bugs)

---

## 📄 Archivos de Configuración Principal

### 1. package.json

**Ubicación:** `package.json`

**Qué cambiar:**

```json
{
  "name": "react-starter-pnpm", // ❌ CAMBIAR: Nombre de tu proyecto
  "version": "0.0.0", // ✅ MANTENER: Versión inicial
  "description": "React + TypeScript + Vite starter with best practices", // ❌ CAMBIAR: Descripción de tu proyecto
  "author": "", // ❌ CAMBIAR: Tu nombre o email
  "license": "MIT", // ❌ CAMBIAR: Si usas otra licencia
  "private": true, // ✅ MANTENER: Si es proyecto privado
  "type": "module" // ✅ MANTENER: Para ES modules
}
```

**Ejemplo para un nuevo proyecto:**

```json
{
  "name": "mi-app-ecommerce",
  "version": "1.0.0",
  "description": "E-commerce application built with React, TypeScript, and Vite",
  "author": "Juan Pérez <juan@example.com>",
  "license": "MIT",
  "private": true,
  "type": "module"
}
```

**Por qué cambiar:**

- `name`: Se usa para identificar tu proyecto en npm, Docker, y otros lugares
- `description`: Aparece en npm registry y documentación
- `author`: Información de contacto y créditos
- `license`: Define cómo otros pueden usar tu código

---

### 2. index.html

**Ubicación:** `index.html`

**Qué cambiar:**

```html
<title>React + TypeScript + Vite Starter</title>
<!-- ❌ CAMBIAR: Título de tu app -->
```

**Ejemplo:**

```html
<title>Mi E-commerce App</title>
```

**Por qué cambiar:**

- Aparece en la pestaña del navegador
- Se usa en bookmarks y historial
- Afecta SEO

---

### 3. tsconfig.json

**Ubicación:** `tsconfig.json`

**Qué cambiar:**

Generalmente no necesitas cambiar nada, pero si quieres personalizar:

```json
{
  "compilerOptions": {
    // ✅ MANTENER: Configuración base
    "target": "ES2023",
    "lib": ["ES2023", "DOM", "DOM.Iterable"],
    "module": "ESNext",

    // ❌ OPCIONAL: Ajustar según necesidades
    "baseUrl": ".", // ✅ MANTENER para path aliases
    "paths": {
      "@/*": ["./src/*"], // ✅ MANTENER o ajustar prefijo
      "@components/*": ["./src/components/*"],
      "@hooks/*": ["./src/hooks/*"],
      "@utils/*": ["./src/utils/*"],
      "@types/*": ["./src/types/*"],
      "@assets/*": ["./src/assets/*"],
      "@tests/*": ["./tests/*"]
    }
  }
}
```

**Por qué podría cambiar:**

- Si quieres usar diferentes prefijos para aliases (ej: `~` en lugar de `@`)
- Si necesitas ajustar el target de JavaScript para navegadores antiguos

---

### 4. vite.config.ts

**Ubicación:** `vite.config.ts`

**Qué cambiar:**

```typescript
export default defineConfig({
  plugins: [
    react(),
    babel({
      presets: [reactCompilerPreset()],
    }),
  ],
  resolve: {
    alias: {
      // ✅ MANTENER: Deben coincidir con tsconfig.json
      '@': resolve(__dirname, './src'),
      '@components': resolve(__dirname, './src/components'),
      '@hooks': resolve(__dirname, './src/hooks'),
      '@utils': resolve(__dirname, './src/utils'),
      '@types': resolve(__dirname, './src/types'),
      '@assets': resolve(__dirname, './src/assets'),
      '@tests': resolve(__dirname, './tests'),
    },
  },
});
```

**Por qué cambiar:**

- Solo si cambiaste los path aliases en `tsconfig.json`
- Deben mantenerse sincronizados ambos archivos

---

## 🐳 Configuración de Docker

### 1. Dockerfile

**Ubicación:** `Dockerfile`

**Qué cambiar:**

```dockerfile
# ----------------------------------------------------------------------------
# Etapa 1: Base & Deps
# ----------------------------------------------------------------------------
FROM node:20-alpine AS deps
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
```

**Qué NO cambiar:**

- ✅ MANTENER: Estructura multi-stage
- ✅ MANTENER: Comandos de pnpm
- ✅ MANTENER: Configuración de Nginx

**Qué podrías cambiar (opcional):**

- Versión de Node.js si necesitas otra
- Versión de Nginx si necesitas otra

---

### 2. docker-compose.yml

**Ubicación:** `docker-compose.yml`

**Qué cambiar:**

```yaml
version: '3.8'

services:
  web:
    container_name: react-starter-pnpm-web # ❌ CAMBIAR: Nombre del contenedor
    build:
      context: .
      target: deps

    ports:
      - '${PORT:-5173}:5173'

    environment:
      - VITE_API_URL=http://localhost:3000/api # ❌ CAMBIAR: URL de tu API

    volumes:
      - .:/app
      - /app/node_modules

    # Comando para levantar Vite en modo dev
    command: pnpm run dev

    restart: on-failure
```

**Ejemplo para nuevo proyecto:**

```yaml
version: '3.8'

services:
  web:
    container_name: mi-ecommerce-web # ✅ CAMBIADO
    build:
      context: .
      target: deps

    ports:
      - '${PORT:-5173}:5173'

    environment:
      - VITE_API_URL=https://api.mi-ecommerce.com/api # ✅ CAMBIADO

    volumes:
      - .:/app
      - /app/node_modules

    command: pnpm run dev
    restart: on-failure
```

**Por qué cambiar:**

- `container_name`: Para identificar fácilmente tus contenedores
- `VITE_API_URL`: Para apuntar a tu API real en desarrollo

---

### 3. nginx.conf

**Ubicación:** `nginx.conf`

**Qué cambiar:**

```nginx
server {
    listen 80;
    server_name localhost;  # ❌ CAMBIAR: Tu dominio en producción

    root /usr/share/nginx/html;
    index index.html;

    # Para cualquier ruta, intenta servir el archivo.
    # Si no existe, sirve index.html (SPA Routing).
    location / {
        try_files $uri $uri/ /index.html;
    }
}
```

**Ejemplo para producción:**

```nginx
server {
    listen 80;
    server_name mi-ecommerce.com www.mi-ecommerce.com;  # ✅ CAMBIADO

    root /usr/share/nginx/html;
    index index.html;

    location / {
        try_files $uri $uri/ /index.html;
    }
}
```

**Por qué cambiar:**

- `server_name`: Para que Nginx responda correctamente a tu dominio
- Podrías agregar configuración de HTTPS, cache, headers de seguridad, etc.

---

## 🤖 Configuración de GitHub Actions

### 1. .github/workflows/ci-cd.yml

**Ubicación:** `.github/workflows/ci-cd.yml`

**Qué cambiar:**

```yaml
name: CI/CD Pipeline # ✅ MANTENER o cambiar para más contexto

on:
  push:
    branches: [main, develop] # ❌ CAMBIAR: Tus ramas
  pull_request:
    branches: [main, develop] # ❌ CAMBIAR: Tus ramas

env:
  NODE_VERSION: '20' # ❌ CAMBIAR: Si usas otra versión
  PNPM_VERSION: '10' # ❌ CAMBIAR: Si usas otra versión

jobs:
  ci:
    name: CI - Lint, Test & Build
    runs-on: ubuntu-latest

    steps:
      # ... steps ...

      - name: Upload coverage to Codecov
        uses: codecov/codecov-action@v4
        with:
          token: ${{ secrets.CODECOV_TOKEN }}
          files: ./coverage/coverage-final.json
          fail_ci_if_error: false

  docker-build:
    name: Docker - Build & Push
    runs-on: ubuntu-latest
    needs: ci
    if: github.event_name == 'push' && github.ref == 'refs/heads/main'

    steps:
      # ... steps ...

      - name: Extract metadata
        id: meta
        uses: docker/metadata-action@v5
        with:
          images: ${{ secrets.DOCKER_USERNAME }}/react-starter-pnpm # ❌ CAMBIAR: Nombre de imagen
          tags: |
            type=ref,event=branch
            type=ref,event=pr
            type=semver,pattern={{version}}
            type=semver,pattern={{major}}.{{minor}}
            type=sha,prefix={{branch}}-
            type=raw,value=latest,enable={{is_default_branch}}

      - name: Build and push Docker image
        uses: docker/build-push-action@v5
        with:
          context: .
          push: true
          tags: ${{ steps.meta.outputs.tags }}
          labels: ${{ steps.meta.outputs.labels }}
          cache-from: type=gha
          cache-to: type=gha,mode=max
          build-args: |
            VITE_API_URL=${{ secrets.VITE_API_URL }}

  deploy:
    name: Deploy to Production
    runs-on: ubuntu-latest
    needs: docker-build
    if: github.event_name == 'push' && github.ref == 'refs/heads/main'
    environment: production

    steps:
      - name: Checkout code
        uses: actions/checkout@v4

      - name: Deploy to cloud provider
        # ❌ CAMBIAR: Agregar tu lógica de deploy específica
        run: |
          echo "Add your deployment logic here"
```

**Ejemplo para nuevo proyecto:**

```yaml
name: CI/CD Pipeline

on:
  push:
    branches: [main, staging] # ✅ CAMBIADO
  pull_request:
    branches: [main, staging] # ✅ CAMBIADO

env:
  NODE_VERSION: '20'
  PNPM_VERSION: '10'

jobs:
  # ... ci job sin cambios ...

  docker-build:
    # ... steps ...

    - name: Extract metadata
      id: meta
      uses: docker/metadata-action@v5
      with:
        images: ${{ secrets.DOCKER_USERNAME }}/mi-ecommerce # ✅ CAMBIADO
        # ... tags sin cambios ...

    # ... resto sin cambios ...
```

**Por qué cambiar:**

- `branches`: Para adaptarse a tu estrategia de ramas
- `images`: Para que coincida con tu nombre de imagen en Docker Hub
- `deploy`: Para agregar tu lógica específica de despliegue

---

### 2. .github/workflows/pr-check.yml

**Ubicación:** `.github/workflows/pr-check.yml`

**Qué cambiar:**

```yaml
name: PR Check # ✅ MANTENER

on:
  pull_request:
    types: [opened, synchronize, reopened]

env:
  NODE_VERSION: '20' # ❌ CAMBIAR: Si usas otra versión
  PNPM_VERSION: '10' # ❌ CAMBIAR: Si usas otra versión

jobs:
  pr-check:
    name: PR Check - Lint, Test & Type Check
    runs-on: ubuntu-latest

    steps:
      # ... steps sin cambios importantes ...
```

**Por qué cambiar:**

- `NODE_VERSION` y `PNPM_VERSION`: Para coincidir con tu configuración

---

### 3. .github/workflows/README.md

**Ubicación:** `.github/workflows/README.md`

**Qué cambiar:**

```markdown
# GitHub Actions CI/CD Workflows

This repository includes GitHub Actions workflows for continuous integration and continuous deployment.

## Workflows

### 1. CI/CD Pipeline (`.github/workflows/ci-cd.yml`)

Main pipeline that runs on pushes to `main` and `develop` branches, and on pull requests.

**Stages:**

- **Lint**: Runs ESLint to check code quality
- **Type Check**: Runs TypeScript compiler to check type safety
- **Unit Tests**: Runs Vitest unit tests
- **Coverage**: Generates code coverage report
- **Build**: Builds the application with Vite
- **Docker Build**: Builds and pushes Docker image (main branch only)
- **Deploy**: Deploys to production (main branch only, requires configuration)

### 2. PR Check (`.github/workflows/pr-check.yml`)

Lightweight workflow for pull requests that runs quick checks without Docker build.

**Checks:**

- Lint
- Type Check
- Unit Tests
- Build

## Required Secrets

Configure these secrets in your GitHub repository settings (`Settings > Secrets and variables > Actions`):

### Required for Docker:

- `DOCKER_USERNAME`: Your Docker Hub username
- `DOCKER_PASSWORD`: Your Docker Hub password or access token

### Optional:

- `VITE_API_URL`: API URL to be baked into the production build
- `CODECOV_TOKEN`: Token for uploading coverage reports to Codecov
```

**Por qué cambiar:**

- Actualizar descripciones para que coincidan con tu proyecto
- Cambiar nombres de ramas si es diferente
- Agregar o quitar secrets según necesites

---

## 📚 Documentación

### 1. README.md

**Ubicación:** `README.md`

**Qué cambiar:**

````markdown
# 🚀 React + TypeScript + Vite Starter <!-- ❌ CAMBIAR: Título de tu proyecto -->

A modern, production-ready React starter template with TypeScript, Vite, and best-in-class development tools configured for professional development.

## ✨ Features <!-- ❌ CAMBIAR: Adaptar a tu proyecto -->

- ⚡️ **Vite 8** - Ultra-fast build tool with HMR
- ⚛️ **React 19** - Latest React with React Compiler
- 📘 **TypeScript 6** - Strict type checking with modern features
- ... etc ...

## 🚀 Quick Start <!-- ✅ MANTENER pero adaptar comandos si es necesario -->

```bash
# Install dependencies
pnpm install

# Start development server
pnpm dev

# Run tests
pnpm test

# Build for production
pnpm build
```
````

## 📘 Beginner Setup Guide <!-- ✅ MANTENER si usas la guía -->

New to Docker, GitHub Actions, or CI/CD? Check out our detailed step-by-step setup guide:

👉 **[Complete Setup Guide for Beginners](./SETUP_GUIDE.md)**

## 📚 Documentation <!-- ❌ CAMBIAR: Adaptar secciones a tu proyecto -->

For comprehensive documentation, including:

- Detailed configuration explanations
- Complete usage guide
- Workflow examples
- Best practices
- Troubleshooting

👉 **[See Complete Documentation](./DOCUMENTATION.md)**

## 📋 Available Scripts <!-- ❌ CAMBIAR: Adaptar scripts si agregas/quitas -->

| Command    | Description              |
| ---------- | ------------------------ |
| `pnpm dev` | Start development server |

| ... etc ...

## 🛠️ Tech Stack <!-- ❌ CAMBIAR: Adaptar a tus tecnologías -->

- **React 19.2.6** - UI library
- **TypeScript 6.0.2** - Type safety
- ... etc ...

## 📁 Project Structure <!-- ❌ CAMBIAR: Adaptar a tu estructura -->

```
src/
├── components/     # React components
├── hooks/          # Custom hooks
├── utils/          # Utility functions
├── types/          # TypeScript types
├── assets/         # Static assets
└── *.test.tsx      # Component tests
```

## 🐳 Docker <!-- ✅ MANTENER si usas Docker -->

This project includes Docker configuration for both development and production environments.

## 🔄 CI/CD with GitHub Actions <!-- ✅ MANTENER si usas GitHub Actions -->

This project includes automated CI/CD pipelines using GitHub Actions.

## 🤝 Contributing <!-- ❌ CAMBIAR: Tus reglas de contribución -->

1. Create a feature branch
2. Make your changes
3. Write tests
4. Run `pnpm lint` and `pnpm test`
5. Commit with `pnpm commit`
6. Push and create a PR

## 📄 License <!-- ❌ CAMBIAR: Tu licencia -->

MIT

````

**Por qué cambiar:**
- Para que refleje tu proyecto específico
- Para incluir solo las características que realmente usas
- Para dar contexto apropiado a tu proyecto

---

### 2. DOCUMENTATION.md

**Ubicación:** `DOCUMENTATION.md`

**Qué cambiar:**

```markdown
# 🚀 Documentación Completa del Proyecto  <!-- ❌ CAMBIAR: Título -->

## 📋 Índice  <!-- ❌ CAMBIAR: Adaptar secciones a tu contenido -->

1. [Descripción General](#descripción-general)
2. [Stack Tecnológico](#stack-tecnológico)
3. [Estructura del Proyecto](#estructura-del-proyecto)
4. [Configuración Detallada](#configuración-detallada)
5. [Flujos de Trabajo por Entorno](#10-flujos-de-trabajo-por-entorno)
6. [Guía de Uso](#guía-de-uso)
7. [Flujo de Trabajo Completo](#flujo-de-trabajo-completo)
8. [Comandos Disponibles](#comandos-disponibles)
9. [Convenciones y Mejores Prácticas](#convenciones-y-mejores-prácticas)
10. [Troubleshooting](#troubleshooting)
11. [Recursos Adicionales](#recursos-adicionales)

## 📖 Descripción General  <!-- ❌ CAMBIAR: Descripción de tu proyecto -->

Este es un **starter project moderno de React + TypeScript + Vite** configurado con las mejores prácticas y herramientas más actuales del ecosistema JavaScript/TypeScript. El proyecto está optimizado para desarrollo profesional con un enfoque en:

- **Rendimiento**: Build ultra-rápido con Vite y React Compiler
- **Calidad de Código**: TypeScript estricto, ESLint, Prettier
- **Testing**: Vitest para unit testing y Playwright para E2E
- **Git Workflow**: Lefthook, Commitlint, Commitizen, Lint-staged
- **Desarrollador Experience**: Path aliases, HMR, intellisense completo

### 🎯 Objetivo del Proyecto  <!-- ❌ CAMBIAR: Tu objetivo -->

Proporcionar una base sólida y moderna para desarrollar aplicaciones React escalables, mantenibles y con alta calidad de código, permitiendo a los desarrolladores enfocarse en la lógica de negocio en lugar de la configuración.

## 🛠 Stack Tecnológico  <!-- ❌ CAMBIAR: Tu stack -->

### Core Technologies

| Tecnología     | Versión | Propósito                                          |
| -------------- | ------- | -------------------------------------------------- |
| **React**      | 19.2.6  | Biblioteca UI para construir interfaces de usuario |
| **TypeScript** | 6.0.2   | Superset de JavaScript con tipado estático         |
| **Vite**       | 8.0.12  | Build tool y dev server ultrarrápido               |

# ... resto del documento adaptando cada sección ...
````

**Por qué cambiar:**

- Para que sea relevante a tu proyecto
- Para documentar tus tecnologías específicas
- Para incluir solo lo que tu proyecto realmente tiene

---

### 3. SETUP_GUIDE.md

**Ubicación:** `SETUP_GUIDE.md`

**Qué cambiar:**

```markdown
# 📘 Guía Detallada de Configuración - Paso a Paso

Esta guía está diseñada para principiantes y explica cada paso al milímetro para configurar y usar **TU PROYECTO** con Docker y GitHub Actions.

## 🔑 Prerrequisitos <!-- ✅ MANTENER pero adaptar si agregas requisitos -->

Antes de comenzar, asegúrate de tener instalado:

### 1. Docker Desktop

**¿Qué es?** Docker es una plataforma que permite empaquetar aplicaciones en contenedores.

**¿Para qué sirve?** Para que tu aplicación corra igual en tu computadora que en producción.

# ... resto adaptando referencias al nombre del proyecto ...
```

**Por qué cambiar:**

- Para que las referencias sean a tu proyecto
- Para adaptar a tus requisitos específicos

---

### 4. TEMPLATE_CUSTOMIZATION.md (este archivo)

**Ubicación:** `TEMPLATE_CUSTOMIZATION.md`

**Qué hacer con este archivo:**

- **Opción A:** Mantenerlo en el proyecto para referencia futura
- **Opción B:** Eliminarlo si no lo necesitas después de personalizar
- **Opción C:** Renombrarlo a `CUSTOMIZATION_NOTES.md` con tus notas específicas

---

## 🔐 Variables de Entorno

### 1. .env.example

**Ubicación:** `.env.example`

**Qué cambiar:**

```bash
# API URL para Vite (se quema en el build)
VITE_API_URL=http://localhost:3000/api  # ❌ CAMBIAR: Tu URL de API

# Puerto para el servidor de desarrollo
PORT=5173  # ✅ MANTENER o cambiar si usas otro puerto

# Agrega tus variables específicas
# VITE_ANALYTICS_ID=your-analytics-id
# VITE_SENTRY_DSN=your-sentry-dsn
```

**Por qué cambiar:**

- Para reflejar las variables que tu proyecto realmente necesita
- Para dar ejemplos apropiados a tu caso

---

### 2. .github/workflows/ci-cd.yml (build args)

**Ubicación:** `.github/workflows/ci-cd.yml`

**Qué cambiar:**

```yaml
- name: Build and push Docker image
  uses: docker/build-push-action@v5
  with:
    context: .
    push: true
    tags: ${{ steps.meta.outputs.tags }}
    labels: ${{ steps.meta.outputs.labels }}
    cache-from: type=gha
    cache-to: type=gha,mode=max
    build-args: |
      VITE_API_URL=${{ secrets.VITE_API_URL }}  # ❌ CAMBIAR: Agrega tus args
      # VITE_ANALYTICS_ID=${{ secrets.ANALYTICS_ID }}
      # VITE_SENTRY_DSN=${{ secrets.SENTRY_DSN }}
```

**Por qué cambiar:**

- Para pasar las variables de entorno que tu proyecto necesita en el build

---

## 🗂️ Archivos de Git

### 1. .gitignore

**Ubicación:** `.gitignore`

**Qué cambiar:**

```gitignore
# Logs
logs
*.log
npm-debug.log*
yarn-debug.log*
yarn-error.log*
pnpm-debug.log*
lerna-debug.log*

node_modules
dist
dist-ssr
*.local

# Editor directories and files
.vscode/*
!.vscode/extensions.json
.idea
.DS_Store
*.suo
*.ntvs*
*.njsproj
*.sln
*.sw?

# Agrega tus ignorados específicos
# .env.local
# .env.production.local
```

**Por qué podría cambiar:**

- Para agregar archivos específicos de tu proyecto
- Para agregar archivos de herramientas que uses

---

### 2. .dockerignore

**Ubicación:** `.dockerignore`

**Qué cambiar:**

```
node_modules
npm-debug.log
dist
.git
.gitignore
.env
.env.local
.env.production
coverage
.vscode
.idea
*.log
.DS_Store

# Agrega tus ignorados específicos
# tests
# docs
# *.md
```

**Por qué podría cambiar:**

- Para optimizar el build de Docker excluyendo archivos innecesarios
- Para adaptar a la estructura de tu proyecto

---

## 🎨 Configuración de Linting y Formateo

### 1. eslint.config.js

**Ubicación:** `eslint.config.js`

**Qué cambiar:**

```javascript
export default defineConfig([
  globalIgnores(['dist', 'node_modules', 'build', 'coverage']), // ❌ CAMBIAR: Agrega tus ignorados
  {
    files: ['**/*.{ts,tsx}'], // ❌ CAMBIAR: Agrega extensiones que uses
    extends: [
      js.configs.recommended,
      tseslint.configs.recommended,
      reactHooks.configs.flat.recommended,
      reactRefresh.configs.vite,
      react.configs.flat.recommended,
      jsxA11y.flatConfigs.recommended,
    ],
    // ... resto de configuración ...
    rules: {
      // ❌ CAMBIAR: Ajusta reglas según preferencias
      'react-refresh/only-export-components': [
        'warn',
        { allowConstantExport: true },
      ],
      // Agrega o modifica reglas según necesites
    },
  },
  eslintConfigPrettier,
]);
```

**Por qué cambiar:**

- Para adaptar las reglas a las preferencias de tu equipo
- Para agregar reglas específicas de tu proyecto

---

### 2. .prettierrc.json

**Ubicación:** `.prettierrc.json`

**Qué cambiar:**

```json
{
  "trailingComma": "all",
  "tabWidth": 2, // ❌ CAMBIAR: Si prefieres otro tamaño
  "printWidth": 80, // ❌ CAMBIAR: Si prefieres otro ancho
  "semi": true,
  "jsxSingleQuote": false,
  "singleQuote": true, // ❌ CAMBIAR: Si prefieres comillas dobles
  "useTabs": false, // ❌ CAMBIAR: Si prefieres tabs
  "endOfLine": "lf",
  "bracketSpacing": true,
  "arrowParens": "always",
  "bracketSameLine": false,
  "proseWrap": "preserve",
  "quoteProps": "as-needed",
  "htmlWhitespaceSensitivity": "css",
  "embeddedLanguageFormatting": "auto"
}
```

**Por qué cambiar:**

- Para adaptar al estilo de código de tu equipo
- Para cumplir con guías de estilo específicas

---

### 3. .lintstagedrc.json

**Ubicación:** `.lintstagedrc.json`

**Qué cambiar:**

```json
{
  "*.{ts,tsx,js,jsx}": ["eslint --fix", "prettier --write"],
  "*.{json,md,yml,yaml}": ["prettier --write"]
  // Agrega tus patrones específicos
  // "*.css": ["stylelint --fix"]
}
```

**Por qué cambiar:**

- Para agregar linters para otros tipos de archivos
- Para adaptar a los archivos que tu proyecto usa

---

## 🧪 Configuración de Testing

### 1. vitest.config.ts

**Ubicación:** `vitest.config.ts`

**Qué cambiar:**

```typescript
export default defineConfig({
  plugins: [react()],
  test: {
    globals: true,
    environment: 'jsdom',
    setupFiles: ['./src/setupTests.ts'], // ❌ CAMBIAR: Si cambias la ubicación
    css: true,
    coverage: {
      provider: 'v8',
      reporter: ['text', 'json', 'html'], // ❌ CAMBIAR: Agrega/quita reporteros
      exclude: [
        'node_modules/',
        'src/setupTests.ts',
        '**/*.d.ts',
        '**/*.config.*',
        '**/mockData',
        'dist/',
        'build/',
        'coverage/',
        // Agrega tus exclusiones específicas
      ],
    },
  },
  resolve: {
    alias: {
      // Deben coincidir con vite.config.ts
      '@': resolve(__dirname, './src'),
      '@components': resolve(__dirname, './src/components'),
      '@hooks': resolve(__dirname, './src/hooks'),
      '@utils': resolve(__dirname, './src/utils'),
      '@types': resolve(__dirname, './src/types'),
      '@assets': resolve(__dirname, './src/assets'),
      '@tests': resolve(__dirname, './tests'),
    },
  },
});
```

**Por qué cambiar:**

- Para ajustar la configuración de coverage
- Para agregar exclusiones específicas
- Para cambiar el setup de tests

---

### 2. src/setupTests.ts

**Ubicación:** `src/setupTests.ts`

**Qué cambiar:**

```typescript
import '@testing-library/jest-dom';

// Agrega tus configuraciones globales de tests
// import { server } from './mocks/server';
// beforeAll(() => server.listen());
// afterEach(() => server.resetHandlers());
// afterAll(() => server.close());
```

**Por qué cambiar:**

- Para agregar configuración global de tests
- Para configurar mocks, servidores MSW, etc.

---

## 💻 Código Fuente

### 1. src/main.tsx

**Ubicación:** `src/main.tsx`

**Qué cambiar:**

```typescript
import React from 'react';
import ReactDOM from 'react-dom/client';
import App from './App';
import './index.css';  // ❌ CAMBIAR: Si renombras o mueves estilos

ReactDOM.createRoot(document.getElementById('root')!).render(
  <React.StrictMode>
    <App />
  </React.StrictMode>,
);
```

**Por qué cambiar:**

- Para agregar providers (Context, Redux, etc.)
- Para agregar configuración global (error boundaries, etc.)

---

### 2. src/App.tsx

**Ubicación:** `src/App.tsx`

**Qué cambiar:**

```typescript
import { useState } from 'react';

function App() {
  const [count, setCount] = useState(0);

  return (
    <div className="app">
      {/* ❌ CAMBIAR: Tu código de aplicación */}
      <h1>Mi Aplicación</h1>
      {/* ... */}
    </div>
  );
}

export default App;
```

**Por qué cambiar:**

- Este es el punto de partida de tu aplicación
- Reemplaza todo el contenido con tu código

---

### 3. src/index.css

**Ubicación:** `src/index.css`

**Qué cambiar:**

```css
/* ❌ CAMBIAR: Tus estilos globales */
:root {
  font-family: Inter, system-ui, Avenir, Helvetica, Arial, sans-serif;
  line-height: 1.5;
  font-weight: 400;

  color-scheme: light dark;
  color: rgba(255, 255, 255, 0.87);
  background-color: #242424;

  font-synthesis: none;
  text-rendering: optimizeLegibility;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}

/* Agrega tus estilos específicos */
```

**Por qué cambiar:**

- Para definir los estilos base de tu aplicación
- Para agregar tus variables CSS, resets, etc.

---

## ✅ Checklist Completo

Usa este checklist para asegurarte de que has personalizado todo lo necesario:

### Información del Proyecto

- [ ] `package.json` - name, description, author, license
- [ ] `index.html` - title
- [ ] README.md - Título, descripción, características
- [ ] DOCUMENTATION.md - Título, descripción, stack

### Configuración

- [ ] `tsconfig.json` - Ajustar paths aliases si es necesario
- [ ] `vite.config.ts` - Ajustar aliases para que coincidan con tsconfig
- [ ] `.env.example` - Variables de entorno específicas

### Docker

- [ ] `docker-compose.yml` - container_name, VITE_API_URL
- [ ] `nginx.conf` - server_name (para producción)

### GitHub Actions

- [ ] `.github/workflows/ci-cd.yml` - branches, images, deploy logic
- [ ] `.github/workflows/pr-check.yml` - NODE_VERSION, PNPM_VERSION
- [ ] `.github/workflows/README.md` - Descripciones actualizadas

### Linting y Formateo

- [ ] `eslint.config.js` - Reglas ajustadas a preferencias
- [ ] `.prettierrc.json` - Estilo de código ajustado
- [ ] `.lintstagedrc.json` - Patrones de archivos agregados

### Testing

- [ ] `vitest.config.ts` - Configuración de coverage ajustada
- [ ] `src/setupTests.ts` - Configuración global de tests

### Git

- [ ] `.gitignore` - Ignorados específicos agregados
- [ ] `.dockerignore` - Ignorados específicos agregados

### Código Fuente

- [ ] `src/main.tsx` - Providers y configuración global agregados
- [ ] `src/App.tsx` - Código de aplicación reemplazado
- [ ] `src/index.css` - Estilos globales reemplazados

### Documentación Adicional

- [ ] `SETUP_GUIDE.md` - Referencias al nombre del proyecto actualizadas
- [ ] `TEMPLATE_CUSTOMIZATION.md` - Decidir si mantener, eliminar o renombrar

---

## 🤖 Script de Automatización (Opcional)

Si quieres automatizar parte de este proceso, puedes crear un script:

```bash
#!/bin/bash
# customize-template.sh

echo "🎨 Personalizando plantilla para nuevo proyecto..."

# Pedir información
read -p "Nombre del proyecto (kebab-case): " PROJECT_NAME
read -p "Descripción corta: " DESCRIPTION
read -p "Autor: " AUTHOR
read -p "URL de API (dev): " API_URL

# Reemplazar en package.json
sed -i "s/react-starter-pnpm/$PROJECT_NAME/g" package.json
sed -i "s/React + TypeScript + Vite starter with best practices/$DESCRIPTION/g" package.json
sed -i "s/\"author\": \"\"/\"author\": \"$AUTHOR\"/g" package.json

# Reemplazar en docker-compose.yml
sed -i "s/react-starter-pnpm-web/$PROJECT_NAME-web/g" docker-compose.yml
sed -i "s|VITE_API_URL=http://localhost:3000/api|VITE_API_URL=$API_URL|g" docker-compose.yml

# Reemplazar en GitHub Actions
sed -i "s/react-starter-pnpm/$PROJECT_NAME/g" .github/workflows/ci-cd.yml

echo "✅ Personalización completada!"
echo "📝 Recuerda revisar manualmente los archivos de documentación."
```

**Uso:**

```bash
chmod +x customize-template.sh
./customize-template.sh
```

---

## 📝 Notas Adicionales

### Cosas a Considerar

1. **Dependencias:** Revisa `package.json` y elimina dependencias que no uses
2. **Scripts:** Agrega scripts específicos que tu proyecto necesite
3. **Estructura:** Ajusta la estructura de carpetas según tus necesidades
4. **Features:** Elimina configuración de features que no usarás (ej: Playwright si no harás E2E)

### Cosas que Generalmente NO Necesitas Cambiar

- ✅ Configuración de TypeScript (tsconfig.json) - está bien para la mayoría de proyectos
- ✅ Configuración de Vite (vite.config.ts) - está bien para la mayoría de proyectos
- ✅ Configuración de Git hooks (lefthook.yml) - está bien para la mayoría de proyectos
- ✅ Configuración de commits (commitlint.config.js, .czrc) - está bien para la mayoría de proyectos

### Buenas Prácticas

1. **Haz cambios incrementales:** No intentes cambiar todo de golpe
2. **Prueba después de cada cambio:** Verifica que todo siga funcionando
3. **Mantén la documentación actualizada:** Si cambias algo, actualiza la docs
4. **Versiona tus cambios:** Haz commits frecuentes mientras personalizas
5. **Elimina lo que no uses:** Menos configuración = menos mantenimiento

---

## 🎯 Resumen

Los archivos más importantes que DEBES cambiar:

1. **package.json** - Información básica del proyecto
2. **README.md** - Documentación principal
3. **docker-compose.yml** - Nombre del contenedor y variables de entorno
4. **.github/workflows/ci-cd.yml** - Nombre de imagen Docker
5. **src/App.tsx** - Tu código de aplicación
6. **.env.example** - Variables de entorno específicas

Los archivos que PROBABLEMENTE debas cambiar:

1. **DOCUMENTATION.md** - Para que refleje tu proyecto
2. **nginx.conf** - Para tu dominio de producción
3. **.prettierrc.json** - Para estilo de código de tu equipo
4. **eslint.config.js** - Para reglas de tu equipo

Los archivos que OPCIONALMENTE podrías cambiar:

1. **tsconfig.json** - Si necesitas diferentes paths aliases
2. **vite.config.ts** - Si cambias tsconfig.json
3. **.gitignore** - Si agregas herramientas específicas
4. **.dockerignore** - Para optimizar builds

---

## 🚀 Siguientes Pasos

Después de personalizar la plantilla:

1. **Eliminar este archivo** (TEMPLATE_CUSTOMIZATION.md) si no lo necesitas
2. **Hacer commit inicial** con tu proyecto personalizado
3. **Configurar GitHub Secrets** según SETUP_GUIDE.md
4. **Probar localmente** que todo funciona
5. **Hacer push y probar CI/CD**

¡Felicidades! Ahora tienes un proyecto personalizado basado en esta plantilla. 🎉
