# 🚀 Documentación Completa del Proyecto

## 📋 Índice

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

---

## 📖 Descripción General

Este es un **starter project moderno de React + TypeScript + Vite** configurado con las mejores prácticas y herramientas más actuales del ecosistema JavaScript/TypeScript. El proyecto está optimizado para desarrollo profesional con un enfoque en:

- **Rendimiento**: Build ultra-rápido con Vite y React Compiler
- **Calidad de Código**: TypeScript estricto, ESLint, Prettier
- **Testing**: Vitest para unit testing y Playwright para E2E
- **Git Workflow**: Lefthook, Commitlint, Commitizen, Lint-staged
- **Desarrollador Experience**: Path aliases, HMR, intellisense completo

### 🎯 Objetivo del Proyecto

Proporcionar una base sólida y moderna para desarrollar aplicaciones React escalables, mantenibles y con alta calidad de código, permitiendo a los desarrolladores enfocarse en la lógica de negocio en lugar de la configuración.

---

## 🛠 Stack Tecnológico

### Core Technologies

| Tecnología     | Versión | Propósito                                          |
| -------------- | ------- | -------------------------------------------------- |
| **React**      | 19.2.6  | Biblioteca UI para construir interfaces de usuario |
| **TypeScript** | 6.0.2   | Superset de JavaScript con tipado estático         |
| **Vite**       | 8.0.12  | Build tool y dev server ultrarrápido               |

### Development Tools

| Herramienta           | Versión | Propósito                                 |
| --------------------- | ------- | ----------------------------------------- |
| **ESLint**            | 10.4.1  | Linting de código JavaScript/TypeScript   |
| **Prettier**          | 3.8.3   | Formateo de código consistente            |
| **TypeScript ESLint** | 8.59.2  | Reglas ESLint específicas para TypeScript |

### Testing Frameworks

| Herramienta         | Versión | Propósito                                    |
| ------------------- | ------- | -------------------------------------------- |
| **Vitest**          | 4.1.8   | Framework de testing unitario                |
| **Playwright**      | 1.60.0  | Framework de testing E2E                     |
| **Testing Library** | 16.3.2  | Utilidades para testing de componentes React |

### Git & Quality Tools

| Herramienta     | Versión | Propósito                               |
| --------------- | ------- | --------------------------------------- |
| **Lefthook**    | 2.1.9   | Git hooks manager                       |
| **Commitlint**  | 21.0.2  | Linting de mensajes de commit           |
| **Commitizen**  | 4.3.1   | Interactivo para commits convencionales |
| **Lint-staged** | 17.0.7  | Ejecuta linters solo en archivos staged |

### Performance Tools

| Herramienta                | Versión | Propósito                                      |
| -------------------------- | ------- | ---------------------------------------------- |
| **React Compiler**         | 1.0.0   | Compilador automático de optimización de React |
| **@rolldown/plugin-babel** | 0.2.3   | Plugin Babel para Vite                         |

---

## 📁 Estructura del Proyecto

```
react-starter-pnpm/
├── .devin/                    # Configuración de Devin CLI
├── .git/                      # Repositorio Git
├── .idea/                     # Configuración de IntelliJ/WebStorm
├── .qodo/                     # Configuración de Qodo AI
├── node_modules/              # Dependencias instaladas
├── src/                       # Código fuente de la aplicación
│   ├── App.tsx               # Componente principal de la aplicación
│   ├── App.test.tsx          # Tests del componente App
│   ├── main.tsx              # Punto de entrada de la aplicación
│   └── setupTests.ts         # Configuración global de tests
├── dist/                      # Build de producción (generado)
├── .czrc                      # Configuración de Commitizen
├── .gitignore                 # Archivos ignorados por Git
├── .lintstagedrc.json         # Configuración de Lint-staged
├── .prettierrc.json           # Configuración de Prettier
├── .prettierignore            # Archivos ignorados por Prettier
|── commitlint.config.js       # Configuración de Commitlint
├── docker-compose.yml         # Configuración Docker Compose
├── Dockerfile                 # Configuración Docker
├── DOCUMENTATION.md           # Esta documentación
├── eslint.config.js           # Configuración de ESLint
├── index.html                 # HTML entry point
├── lefthook.yml               # Configuración de Lefthook
├── nginx.conf                 # Configuración Nginx
├── package.json               # Dependencias y scripts
├── pnpm-lock.yaml             # Lockfile de dependencias
├── README.md                  # Documentación básica
├── tsconfig.json              # Configuración principal de TypeScript
├── vite.config.ts             # Configuración de Vite
└── vitest.config.ts           # Configuración de Vitest
```

### Descripción de Directorios Principales

#### `/src` - Código Fuente

Contiene todo el código fuente de la aplicación React:

- **Componentes**: Componentes React (.tsx)
- **Hooks**: Custom hooks de React
- **Utils**: Funciones utilitarias
- **Types**: Definiciones de tipos TypeScript
- **Assets**: Imágenes, fuentes, estilos
- **Tests**: Archivos de testing

#### Archivos de Configuración Principales

- **`package.json`**: Define dependencias, scripts y metadatos del proyecto
- **`tsconfig.json`**: Configuración del compilador TypeScript
- **`vite.config.ts`**: Configuración del build tool Vite
- **`eslint.config.js`**: Reglas de linting de código
- **`vitest.config.ts`**: Configuración del framework de testing

---

## ⚙️ Configuración Detallada

### 1. TypeScript Configuration

#### `tsconfig.json` - Configuración Principal

```json
{
  "compilerOptions": {
    // Target y Module
    "target": "ES2023", // Versión de ECMAScript objetivo
    "lib": ["ES2023", "DOM", "DOM.Iterable"], // Librerías disponibles
    "module": "ESNext", // Sistema de módulos

    // Resolution
    "moduleResolution": "bundler", // Resolución de módulos para bundlers
    "resolveJsonModule": true, // Permite importar JSON
    "allowImportingTsExtensions": true, // Permite imports con extensión .ts

    // Output
    "noEmit": true, // No genera archivos de salida
    "isolatedModules": true, // Cada archivo es un módulo aislado
    "jsx": "react-jsx", // Transformación JSX automática

    // Type Checking - Modo Estricto
    "strict": true, // Habilita todas las verificaciones estrictas
    "noUnusedLocals": true, // Error en variables no usadas
    "noUnusedParameters": true, // Error en parámetros no usados
    "noImplicitReturns": true, // Error en retornos implícitos
    "noImplicitOverride": true, // Requiere override explícito
    "noUncheckedIndexedAccess": true, // Verificación de acceso a índices
    "noFallthroughCasesInSwitch": true, // Error en fallthrough de switch
    "noUncheckedSideEffectImports": true, // Verifica imports con side effects

    // Quality
    "skipLibCheck": true, // Omite verificación de librerías
    "allowUnusedLabels": false, // Prohíbe labels no usados
    "allowUnreachableCode": false, // Prohíbe código inalcanzable

    // Modern TypeScript
    "ignoreDeprecations": "6.0", // Ignora advertencias de deprecación

    // Path Aliases
    "baseUrl": ".", // Directorio base para paths relativos
    "paths": {
      "@/*": ["./src/*"], // Alias para directorio src
      "@components/*": ["./src/components/*"],
      "@hooks/*": ["./src/hooks/*"],
      "@utils/*": ["./src/utils/*"],
      "@types/*": ["./src/types/*"],
      "@assets/*": ["./src/assets/*"],
      "@tests/*": ["./tests/*"]
    }
  },
  "include": ["src", "vitest.config.ts", "vite.config.ts"],
  "exclude": ["node_modules", "dist", "**/*.test.ts", "**/*.test.tsx"]
}
```

#### ¿Para qué sirven estas opciones?

**Opciones de Target y Module:**

- `target: "ES2023"`: Compila a JavaScript moderno ES2023
- `module: "ESNext"`: Usa el sistema de módulos más reciente
- `lib`: Define qué APIs globales están disponibles

**Opciones de Resolución:**

- `moduleResolution: "bundler"`: Optimizado para herramientas como Vite
- `allowImportingTsExtensions`: Permite `import { x } from './file.ts'` sin renombrar

**Opciones de Type Checking (Modo Estricto):**

- `strict: true`: Activa todas las verificaciones de tipo estrictas
- `noUnusedLocals/Parameters`: Evita código muerto
- `noUncheckedIndexedAccess`: Previene errores de undefined en arrays
- `noImplicitReturns`: Asegura que todas las funciones retornen algo

**Path Aliases:**

```typescript
// Sin alias
import { Button } from '../../../components/Button';

// Con alias
import { Button } from '@components/Button';
```

### 2. Vite Configuration

#### `vite.config.ts` - Configuración del Build Tool

```typescript
import { defineConfig } from 'vite';
import react, { reactCompilerPreset } from '@vitejs/plugin-react';
import babel from '@rolldown/plugin-babel';
import { resolve } from 'path';

export default defineConfig({
  plugins: [
    react(), // Plugin oficial de React para Vite
    babel({
      presets: [reactCompilerPreset()], // React Compiler
    }),
  ],
  resolve: {
    alias: {
      // Path aliases (deben coincidir con tsconfig.json)
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

#### Plugins de Vite

**`@vitejs/plugin-react`:**

- Proporciona soporte para React en Vite
- Incluye HMR (Hot Module Replacement) para React
- Optimiza imports de React
- Soporta JSX y TSX

**`@rolldown/plugin-babel` con React Compiler:**

- React Compiler optimiza automáticamente componentes React
- Elimina la necesidad de `useMemo`, `useCallback` en muchos casos
- Mejora el rendimiento mediante análisis estático

#### ¿Qué hace Vite?

1. **Dev Server**: Servidor de desarrollo con HMR ultra-rápido
2. **Build Optimizado**: Genera bundles optimizados para producción
3. **Transformación**: Convierte TypeScript/JSX a JavaScript
4. **Code Splitting**: Divide el código automáticamente
5. **Asset Handling**: Procesa imágenes, fuentes, CSS automáticamente

### 3. ESLint Configuration

#### `eslint.config.js` - Configuración de Linting

```javascript
import js from '@eslint/js';
import globals from 'globals';
import reactHooks from 'eslint-plugin-react-hooks';
import reactRefresh from 'eslint-plugin-react-refresh';
import tseslint from 'typescript-eslint';
import react from 'eslint-plugin-react';
import jsxA11y from 'eslint-plugin-jsx-a11y';
import eslintConfigPrettier from 'eslint-config-prettier';
import { defineConfig, globalIgnores } from 'eslint/config';

export default defineConfig([
  globalIgnores(['dist', 'node_modules', 'build', 'coverage']),
  {
    files: ['**/*.{ts,tsx}'],
    extends: [
      js.configs.recommended, // Reglas básicas de JS
      tseslint.configs.recommended, // Reglas de TypeScript
      reactHooks.configs.flat.recommended, // Reglas de React Hooks
      reactRefresh.configs.vite, // Optimización HMR
      react.configs.flat.recommended, // Reglas de React
      jsxA11y.flatConfigs.recommended, // Reglas de accesibilidad
    ],
    languageOptions: {
      globals: globals.browser, // Variables globales del browser
      parserOptions: {
        ecmaVersion: 'latest',
        sourceType: 'module',
        ecmaFeatures: {
          jsx: true, // Soporte JSX
        },
      },
    },
    settings: {
      react: {
        version: '19.2.6', // Versión de React
      },
    },
    rules: {
      // React Refresh
      'react-refresh/only-export-components': [
        'warn',
        { allowConstantExport: true },
      ],

      // React
      'react/prop-types': 'off', // No requerir PropTypes
      'react/react-in-jsx-scope': 'off', // React 19 no requiere import
      'react/jsx-uses-react': 'off', // React 19 no requiere import
      'react/jsx-no-target-blank': 'error', // Seguridad en links
      'react/no-array-index-key': 'warn', // Evitar keys de índice
      'react/jsx-key': 'error', // Requerir keys en listas
      'react/no-unescaped-entities': 'warn', // Entidades HTML escapadas

      // React Hooks
      'react-hooks/rules-of-hooks': 'error', // Reglas de Hooks
      'react-hooks/exhaustive-deps': 'warn', // Dependencias de useEffect

      // TypeScript
      '@typescript-eslint/no-unused-vars': [
        'error',
        {
          argsIgnorePattern: '^_', // Ignorar args que empiezan con _
          varsIgnorePattern: '^_', // Ignorar vars que empiezan con _
          caughtErrorsIgnorePattern: '^_', // Ignorar errores catch
        },
      ],
      '@typescript-eslint/no-explicit-any': 'warn', // Advertir sobre any
      '@typescript-eslint/explicit-function-return-type': 'off', // No requerir tipos de retorno
      '@typescript-eslint/explicit-module-boundary-types': 'off', // No requerir tipos en exports
      '@typescript-eslint/no-non-null-assertion': 'warn', // Advertir sobre !
    },
  },
  eslintConfigPrettier, // Desactiva reglas que conflictúan con Prettier
]);
```

#### Reglas Importantes Explicadas

**Reglas de React:**

- `react/jsx-key`: Requiere keys en listas para evitar errores de rendering
- `react/jsx-no-target-blank`: Previene vulnerabilidades de seguridad en links externos
- `react/no-array-index-key`: Advierte sobre usar índices como keys (anti-pattern)

**Reglas de React Hooks:**

- `react-hooks/rules-of-hooks`: Asegura que los Hooks se usen correctamente
- `react-hooks/exhaustive-deps`: Verifica dependencias en useEffect, useCallback, etc.

**Reglas de TypeScript:**

- `@typescript-eslint/no-unused-vars`: Detecta variables no usadas
- `@typescript-eslint/no-explicit-any`: Advierte sobre el uso de `any`

### 4. Prettier Configuration

#### `.prettierrc.json` - Configuración de Formateo

```json
{
  "trailingComma": "all", // Comas al final en objetos/arrays
  "tabWidth": 2, // Tamaño de indentación
  "printWidth": 80, // Ancho máximo de línea
  "semi": true, // Punto y coma al final
  "jsxSingleQuote": false, // Comillas dobles en JSX
  "singleQuote": true, // Comillas simples en strings
  "useTabs": false, // Usar espacios en lugar de tabs
  "endOfLine": "lf", // Saltos de línea LF (Unix)
  "bracketSpacing": true, // Espacios en objetos: { a: 1 }
  "arrowParens": "always", // Paréntesis en arrow functions: (x) => x
  "bracketSameLine": false, // } en nueva línea
  "proseWrap": "preserve", // Preservar saltos en markdown
  "quoteProps": "as-needed", // Comillas en props solo cuando es necesario
  "htmlWhitespaceSensitivity": "css", // Sensibilidad a whitespace en HTML
  "embeddedLanguageFormatting": "auto" // Formatear código embebido
}
```

#### ¿Qué hace Prettier?

- **Formateo automático**: Mantiene el estilo consistente
- **Sin configuración de estilo**: No requiere discusiones sobre estilo
- **Integración**: Funciona con ESLint, editores, pre-commit hooks

### 5. Vitest Configuration

#### `vitest.config.ts` - Configuración de Testing

```typescript
import { defineConfig } from 'vitest/config';
import react from '@vitejs/plugin-react';
import { resolve } from 'path';

export default defineConfig({
  plugins: [react()],
  test: {
    globals: true, // APIs globales (describe, it, expect)
    environment: 'jsdom', // Environment de navegador simulado
    setupFiles: ['./src/setupTests.ts'], // Archivo de configuración
    css: true, // Soporte para CSS
    coverage: {
      provider: 'v8', // Proveedor de coverage
      reporter: ['text', 'json', 'html'], // Formatos de reporte
      exclude: [
        'node_modules/',
        'src/setupTests.ts',
        '**/*.d.ts',
        '**/*.config.*',
        '**/mockData',
        'dist/',
        'build/',
        'coverage/',
      ],
    },
  },
  resolve: {
    alias: {
      // Path aliases (deben coincidir con vite.config.ts)
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

#### `src/setupTests.ts` - Configuración Global de Tests

```typescript
import '@testing-library/jest-dom';
```

Este archivo importa `@testing-library/jest-dom` que proporciona matchers personalizados como:

- `toBeInTheDocument()`
- `toHaveTextContent()`
- `toBeDisabled()`
- etc.

### 6. Git Hooks Configuration

#### `lefthook.yml` - Git Hooks Manager

```yaml
pre-commit:
  parallel: true # Ejecutar comandos en paralelo
  commands:
    lint-staged:
      run: npx lint-staged # Ejecutar linters en archivos staged

commit-msg:
  commands:
    commitlint:
      run: npx commitlint --edit {1} # Validar mensaje de commit
```

#### ¿Qué hacen estos hooks?

**Pre-commit:**

- Se ejecuta antes de crear un commit
- Ejecuta lint-staged que aplica ESLint y Prettier a los archivos modificados
- Si hay errores, previene el commit

**Commit-msg:**

- Valida el formato del mensaje de commit
- Asegura que sigue el formato convencional
- Si el formato es incorrecto, previene el commit

#### `.lintstagedrc.json` - Configuración de Lint-staged

```json
{
  "*.{ts,tsx,js,jsx}": [
    "eslint --fix",      # Corregir errores de ESLint automáticamente
    "prettier --write"   # Formatear con Prettier
  ],
  "*.{json,md,yml,yaml}": [
    "prettier --write"   # Formatear archivos de configuración
  ]
}
```

#### `commitlint.config.js` - Validación de Commits

```javascript
export default {
  extends: ['@commitlint/config-conventional'],
};
```

#### Formato Convencional de Commits

```
<tipo>(<alcance>): <descripción>

[opcional cuerpo]

[opcional footer]
```

**Tipos permitidos:**

- `feat`: Nueva funcionalidad
- `fix`: Corrección de bug
- `docs`: Cambios en documentación
- `style`: Cambios de estilo (formatting, whitespace)
- `refactor`: Refactorización de código
- `perf`: Mejoras de performance
- `test`: Agregar o actualizar tests
- `chore`: Cambios en build process o herramientas

**Ejemplos:**

```
feat(auth): add login form
fix(button): resolve click handler issue
docs(readme): update installation guide
```

#### `.czrc` - Configuración de Commitizen

```json
{
  "path": "cz-conventional-changelog"
}
```

Commitizen proporciona una interfaz interactiva para crear commits que siguen el formato convencional.

### 7. Playwright Configuration (E2E Testing)

Playwright está configurado pero requiere inicialización. Para configurarlo:

```bash
pnpm exec playwright install
```

Playwright permite:

- Testing E2E en múltiples navegadores (Chrome, Firefox, Safari)
- Testing de APIs
- Generación automática de tests
- Visual regression testing

### 8. Docker Configuration

El proyecto incluye configuración completa de Docker para desarrollo y producción.

#### `Dockerfile` - Multi-stage Build

El Dockerfile utiliza un enfoque multi-stage para optimizar el tamaño de la imagen final:

```dockerfile
# Etapa 1: Base & Deps
FROM node:20-alpine AS deps
WORKDIR /app

# Instalar pnpm
RUN npm install -g pnpm

COPY package.json pnpm-lock.yaml ./
RUN pnpm install

# Etapa 2: Build (Producción)
FROM deps AS build
COPY . .

# Argumentos para quemar variables de entorno en el build
ARG VITE_API_URL
ENV VITE_API_URL=${VITE_API_URL}

RUN pnpm run build

# Etapa 3: Run (Nginx)
FROM nginx:alpine AS prod

# Copiamos la configuración de Nginx
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Copiamos los archivos estáticos generados
COPY --from=build /app/dist /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
```

**Etapas del Build:**

1. **deps**: Instala dependencias con pnpm
2. **build**: Compila la aplicación React con Vite
3. **prod**: Sirve los archivos estáticos con Nginx

#### `docker-compose.yml` - Desarrollo

Configuración para desarrollo con hot reload:

```yaml
version: '3.8'

services:
  web:
    container_name: react-starter-pnpm-web
    build:
      context: .
      target: deps # Usa la etapa 'deps' que tiene Node

    ports:
      - '${PORT:-5173}:5173'

    environment:
      - VITE_API_URL=http://localhost:3000/api

    volumes:
      - .:/app
      - /app/node_modules # Evita sobrescribir node_modules

    command: pnpm run dev
    restart: on-failure
```

#### `nginx.conf` - Configuración de Nginx

Configuración optimizada para SPAs:

```nginx
server {
    listen 80;
    server_name localhost;

    root /usr/share/nginx/html;
    index index.html;

    # SPA Routing: sirve index.html para cualquier ruta
    location / {
        try_files $uri $uri/ /index.html;
    }
}
```

#### `.dockerignore` - Optimización del Build

Excluye archivos innecesarios del contexto de build:

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
```

#### Scripts de Docker en package.json

```json
{
  "scripts": {
    "docker:build": "docker build -t react-starter-pnpm .",
    "docker:dev": "docker-compose up",
    "docker:prod": "docker build --target prod -t react-starter-pnpm:prod . && docker run -p 80:80 react-starter-pnpm:prod",
    "docker:down": "docker-compose down"
  }
}
```

#### Uso de Docker

**Desarrollo:**

```bash
# Iniciar entorno de desarrollo
pnpm docker:dev

# Detener contenedores
pnpm docker:down
```

**Producción:**

```bash
# Construir imagen de producción
pnpm docker:build

# Construir y ejecutar producción
pnpm docker:prod

# O con argumentos de build
docker build --target prod \
  -t react-starter-pnpm:prod \
  --build-arg VITE_API_URL=https://api.example.com \
  .
docker run -p 80:80 react-starter-pnpm:prod
```

**Ventajas de Docker:**

- **Consistencia**: Mismo entorno en desarrollo y producción
- **Aislamiento**: Dependencias aisladas del sistema host
- **Portabilidad**: Ejecutable en cualquier sistema con Docker
- **Optimización**: Multi-stage build reduce tamaño de imagen
- **Escalabilidad**: Fácil de desplegar en orquestadores (Kubernetes, Docker Swarm)

### 9. GitHub Actions CI/CD

El proyecto incluye pipelines automatizados de CI/CD usando GitHub Actions.

#### Workflows Configurados

**CI/CD Pipeline** (`.github/workflows/ci-cd.yml`):

Pipeline principal que se ejecuta en pushes a las ramas `main` y `develop`, y en pull requests.

**Etapas:**

- **Lint**: Ejecuta ESLint para verificar la calidad del código
- **Type Check**: Ejecuta el compilador de TypeScript para verificar seguridad de tipos
- **Unit Tests**: Ejecuta tests unitarios con Vitest
- **Coverage**: Genera reporte de cobertura de código
- **Build**: Construye la aplicación con Vite
- **Docker Build**: Construye y push de imagen Docker (solo rama main)
- **Deploy**: Despliega a producción (solo rama main, requiere configuración)

**PR Check** (`.github/workflows/pr-check.yml`):

Workflow ligero para pull requests que ejecuta verificaciones rápidas sin build de Docker.

**Verificaciones:**

- Lint
- Type Check
- Unit Tests
- Build

#### Configuración de Secrets

Configura estos secrets en los ajustes de tu repositorio de GitHub (`Settings > Secrets and variables > Actions`):

**Requeridos para Docker:**

- `DOCKER_USERNAME`: Tu usuario de Docker Hub
- `DOCKER_PASSWORD`: Tu password o token de acceso de Docker Hub

**Opcionales:**

- `VITE_API_URL`: URL de API para incluir en el build de producción
- `CODECOV_TOKEN`: Token para subir reportes de cobertura a Codecov

#### Configuración de Secrets

1. Ve a tu repositorio de GitHub
2. Navega a `Settings` > `Secrets and variables` > `Actions`
3. Haz clic en `New repository secret`
4. Agrega cada secret con su valor correspondiente

**Token de Acceso de Docker Hub (Recomendado):**

En lugar de usar tu password de Docker, crea un token de acceso:

1. Inicia sesión en [Docker Hub](https://hub.docker.com/)
2. Ve a `Account Settings` > `Security`
3. Haz clic en `New Access Token`
4. Dale un nombre descriptivo (ej: `github-actions`)
5. Copia el token generado
6. Usa este token como el secret `DOCKER_PASSWORD`

#### Triggers de Workflow

**CI/CD Pipeline:**

- **Push a main/develop**: Ejecuta el pipeline completo incluyendo build de Docker y deploy
- **Pull requests a main/develop**: Ejecuta solo checks de CI (sin build de Docker ni deploy)

**PR Check:**

- **Pull requests**: Ejecuta checks rápidos para feedback rápido

#### Personalización

**Cambiar Versión de Node:**

Edita la variable de entorno `NODE_VERSION` en los archivos de workflow:

```yaml
env:
  NODE_VERSION: '20' # Cambia a tu versión deseada
```

**Cambiar Versión de pnpm:**

Edita la variable de entorno `PNPM_VERSION`:

```yaml
env:
  PNPM_VERSION: '10' # Cambia a tu versión deseada
```

**Modificar Deployment:**

Edita el job `deploy` en `ci-cd.yml` para agregar tu lógica específica de deployment:

```yaml
- name: Deploy to cloud provider
  run: |
    # Agrega tus comandos de deployment
    # Ejemplo para Kubernetes:
    kubectl apply -f k8s/
    # Ejemplo para Google Cloud Run:
    gcloud run deploy --image gcr.io/PROJECT-ID/IMAGE-NAME
```

**Deshabilitar Deployment:**

Para deshabilitar el deployment automático, comenta o elimina el job `deploy` de `ci-cd.yml`.

#### Pruebas Locales

Para probar los workflows localmente antes de hacer push:

1. Instala [act](https://github.com/nektos/act):

```bash
brew install act  # macOS
# o
choco install act  # Windows
# o
curl https://raw.githubusercontent.com/nektos/act/master/install.sh | sudo bash
```

2. Ejecuta el workflow localmente:

```bash
act -j pr-check  # Ejecutar workflow PR check
act -j ci        # Ejecutar job CI
```

#### Monitoreo

Ve las ejecuciones del workflow en la pestaña `Actions` de tu repositorio de GitHub. Cada ejecución muestra:

- Estado del job (éxito/fallo)
- Logs para cada paso
- Artefactos (outputs de build, reportes de cobertura)
- Tiempo de ejecución

#### Troubleshooting

**El Build de Docker Falla:**

- Verifica que los secrets `DOCKER_USERNAME` y `DOCKER_PASSWORD` estén configurados correctamente
- Asegúrate de que tu repositorio de Docker Hub exista
- Verifica que el nombre de la imagen en el workflow coincida con tu repositorio de Docker Hub

**Los Tests Fallan:**

- Ejecuta tests localmente: `pnpm test --run`
- Revisa los logs de tests en la pestaña Actions
- Asegúrate de que todas las dependencias estén instaladas correctamente

**El Type Check Falla:**

- Ejecuta type check localmente: `pnpm tsc --noEmit`
- Corrige cualquier error de TypeScript antes de hacer push

**Fall la Subida de Coverage:**

- Asegúrate de que `CODECOV_TOKEN` esté configurado si tu repositorio es privado
- Verifica que los archivos de coverage se generen correctamente

#### Mejores Prácticas

1. **Ejecuta siempre PR checks** antes de mergear para asegurar calidad de código
2. **Mantén los workflows rápidos** dividiendo operaciones pesadas en jobs separados
3. **Usa caching** para acelerar la instalación de dependencias y builds de Docker
4. **Monitorea el tiempo de ejecución** de los workflows y optimiza pasos lentos
5. **Mantén los secrets seguros** y nunca los commits al repositorio
6. **Prueba localmente** con `act` antes de hacer push de cambios a los workflows

### 10. Flujos de Trabajo por Entorno

El proyecto soporta múltiples entornos de trabajo, cada uno optimizado para diferentes propósitos. A continuación se detallan los flujos completos para cada entorno.

---

## 🔧 Entorno de Desarrollo Local (Development)

### Propósito

Desarrollo rápido de nuevas características con feedback inmediato.

### Características

- ✅ Hot Module Replacement (HMR) para cambios instantáneos
- ✅ Source maps para debugging fácil
- ✅ TypeScript compilation al vuelo
- ✅ Tests en modo watch
- ✅ Sin optimización de producción (build más rápido)

### Flujo de Trabajo

#### Paso 1: Inicialización del Entorno

```bash
# 1. Clonar el repositorio (si no lo tienes)
git clone https://github.com/TU_USUARIO/react-starter-pnpm.git
cd react-starter-pnpm

# 2. Instalar dependencias
pnpm install

# 3. Copiar variables de entorno (opcional)
cp .env.example .env
# Editar .env según necesites
```

#### Paso 2: Iniciar Servidor de Desarrollo

**Opción A: Sin Docker (Más rápido)**

```bash
pnpm dev
```

**Qué sucede:**

- Vite inicia servidor en `http://localhost:5173`
- TypeScript se compila al vuelo
- Los cambios se reflejan automáticamente en el navegador
- Los errores de TypeScript se muestran en la terminal y navegador

**Opción B: Con Docker (Simula entorno de producción)**

```bash
pnpm docker:dev
```

**Qué sucede:**

- Se crea un contenedor Docker con Node.js
- Se instalan dependencias dentro del contenedor
- Se inicia Vite en modo desarrollo
- Tu código local se monta en el contenedor
- Los cambios se reflejan automáticamente

**Para detener:**

```bash
# Opción A
Ctrl + C

# Opción B
pnpm docker:down
```

#### Paso 3: Desarrollo Iterativo

**Ciclo típico de desarrollo:**

1. **Crear/Modificar componente**

```typescript
// src/components/Button.tsx
interface ButtonProps {
  children: React.ReactNode;
  onClick?: () => void;
}

export function Button({ children, onClick }: ButtonProps) {
  return <button onClick={onClick}>{children}</button>;
}
```

2. **Ver cambios en el navegador** (automático con HMR)

3. **Ejecutar tests específicos**

```bash
# Tests en modo watch
pnpm test

# Tests específicos de un archivo
pnpm test Button
```

4. **Verificar tipos**

```bash
pnpm tsc --noEmit
```

5. **Verificar estilo**

```bash
pnpm lint
```

#### Paso 4: Preparar para Commit

```bash
# 1. Verificar que todo pasa
pnpm lint
pnpm tsc --noEmit
pnpm test --run
pnpm build

# 2. Agregar cambios
git add .

# 3. Commit con wizard interactivo
pnpm commit
```

#### Paso 5: Crear Pull Request

```bash
# 1. Crear rama de feature
git checkout -b feature/nueva-funcionalidad

# 2. Hacer cambios y commits
# ... (desarrollo iterativo) ...

# 3. Push al remoto
git push origin feature/nueva-funcionalidad
```

**En GitHub:**

1. Crear Pull Request desde `feature/nueva-funcionalidad` hacia `main`
2. GitHub Actions ejecuta automáticamente:
   - Lint
   - Type Check
   - Unit Tests
   - Build
3. Revisar resultados en la pestaña "Checks"
4. Si todo pasa ✅, solicitar review
5. Después de aprobación, hacer merge

---

## 🧪 Entorno de Testing (Testing)

### Propósito

Verificar que el código funciona correctamente antes de desplegar.

### Características

- ✅ Tests unitarios con Vitest
- ✅ Tests E2E con Playwright
- ✅ Coverage de código
- ✅ Tests en modo watch para desarrollo
- ✅ Tests en CI para verificación automática

### Flujo de Trabajo

#### Testing Local

**Unit Tests (Vitest)**

```bash
# Modo watch (desarrollo)
pnpm test

# Ejecutar una vez
pnpm test --run

# Con UI visual
pnpm test:ui

# Coverage
pnpm coverage
pnpm coverage:open  # Abre reporte HTML
```

**E2E Tests (Playwright)**

```bash
# Instalar navegadores (primera vez)
pnpm exec playwright install

# Ejecutar tests E2E
pnpm test:e2e

# Con UI visual
pnpm test:e2e:ui
```

#### Testing en CI

Los tests se ejecutan automáticamente en:

- **Pull Requests:** Workflow `PR Check`
- **Push a main/develop:** Workflow `CI/CD Pipeline`

**Qué se ejecuta:**

1. Lint (ESLint)
2. Type Check (TypeScript)
3. Unit Tests (Vitest)
4. Build (Vite)
5. (Opcional) E2E Tests (Playwright)
6. Coverage report

---

## 🐳 Entorno de Desarrollo con Docker (Docker Dev)

### Propósito

Desarrollo en un entorno idéntico a producción.

### Características

- ✅ Entorno consistente (mismo OS, mismas dependencias)
- ✅ Aislamiento del sistema host
- ✅ Fácil de compartir con el equipo
- ✅ Hot Module Replacement funcionando
- ✅ Simulación exacta del entorno de producción

### Flujo de Trabajo

#### Paso 1: Iniciar Entorno Docker

```bash
pnpm docker:dev
```

**Qué sucede internamente:**

1. Docker Compose lee `docker-compose.yml`
2. Construye la imagen usando la etapa `deps` del Dockerfile
3. Instala pnpm en el contenedor
4. Instala dependencias
5. Monta tu código local en `/app`
6. Inicia `pnpm run dev`
7. Expone el puerto 5173

#### Paso 2: Desarrollo Normal

Desarrollas normalmente:

- Editas archivos en tu editor
- Los cambios se reflejan automáticamente (volumes)
- El navegador se actualiza (HMR)
- Los errors aparecen en la terminal

#### Paso 3: Debugging

```bash
# Ver logs del contenedor
docker logs react-starter-pnpm-web

# Entrar al contenedor
docker exec -it react-starter-pnpm-web sh

# Ejecutar comandos dentro del contenedor
cd /app
pnpm test
pnpm lint
```

#### Paso 4: Detener Entorno

```bash
pnpm docker:down
```

**Esto detiene y elimina:**

- El contenedor
- La red Docker
- Los volumes (si no son nombrados)

---

## 🚀 Entorno de Producción (Production)

### Propósito

Despliegue de la aplicación para usuarios finales.

### Características

- ✅ Código optimizado y minificado
- ✅ Servido con Nginx (alto rendimiento)
- ✅ Multi-stage build (imagen pequeña)
- ✅ Variables de entorno quemadas en build
- ✅ SPA routing configurado
- ✅ Listo para orquestadores (Kubernetes, Docker Swarm)

### Flujo de Trabajo

#### Opción A: Build Manual Local

**Paso 1: Construir Imagen**

```bash
# Build básico
docker build -t react-starter-pnpm .

# Build con argumentos
docker build \
  --target prod \
  -t react-starter-pnpm:prod \
  --build-arg VITE_API_URL=https://api.tu-dominio.com \
  .
```

**Qué sucede:**

1. **Etapa deps:** Instala dependencias con pnpm
2. **Etapa build:** Compila React con Vite
   - TypeScript → JavaScript
   - JSX → JS
   - Minificación
   - Code splitting
3. **Etapa prod:** Copia archivos a Nginx
   - Solo archivos estáticos
   - Sin Node.js, sin dependencias
   - Imagen pequeña (~25MB)

**Paso 2: Ejecutar Contenedor**

```bash
docker run -d \
  -p 80:80 \
  --name react-app \
  react-starter-pnpm:prod
```

**Paso 3: Verificar**

```bash
# Ver contenedor corriendo
docker ps

# Ver logs
docker logs react-app

# Probar
curl http://localhost/
```

#### Opción B: Build Automatizado con CI/CD

**Paso 1: Hacer Push a Main**

```bash
git checkout main
git pull origin main
# ... hacer cambios ...
git add .
git commit -m "feat: nueva funcionalidad"
git push origin main
```

**Paso 2: GitHub Actions se Ejecuta Automáticamente**

**Job CI:**

```yaml
- Checkout código
- Setup pnpm y Node.js
- Install dependencias
- Run lint
- Run type check
- Run tests
- Generate coverage
- Build aplicación
- Upload artefactos
```

**Job Docker Build (solo si CI pasa):**

```yaml
- Setup Docker Buildx
- Login a Docker Hub
- Extraer metadata (tags, labels)
- Build imagen Docker
- Push imagen a Docker Hub
- Configurar cache
```

**Job Deploy (solo si Docker Build pasa):**

```yaml
- (Placeholder) Agregar tu lógica de deploy
```

**Paso 3: Verificar en Docker Hub**

1. Ve a [hub.docker.com](https://hub.docker.com/)
2. Busca tu repositorio `react-starter-pnpm`
3. Verifica que la imagen con tag `latest` existe

**Paso 4: Desplegar Imagen**

```bash
# Descargar y ejecutar
docker run -d -p 80:80 TU_USUARIO/react-starter-pnpm:latest
```

**O con docker-compose:**

```yaml
# docker-compose.prod.yml
version: '3.8'

services:
  web:
    image: TU_USUARIO/react-starter-pnpm:latest
    container_name: react-app-prod
    ports:
      - '80:80'
    restart: always
```

```bash
docker-compose -f docker-compose.prod.yml up -d
```

#### Opción C: Deploy Automatizado a Cloud

**Configurar el Job Deploy en `.github/workflows/ci-cd.yml`:**

**Ejemplo para AWS ECS:**

```yaml
- name: Deploy to ECS
  uses: aws-actions/amazon-ecs-deploy-task-definition@v1
  with:
    task-definition: my-task-definition
    service: my-service
    cluster: my-cluster
    wait-for-service-stability: true
```

**Ejemplo para Google Cloud Run:**

```yaml
- name: Deploy to Cloud Run
  uses: google-github-actions/deploy-cloudrun@v0
  with:
    service: react-app
    region: us-central1
    image: gcr.io/TU_PROJECT_ID/react-starter-pnpm:${{ github.sha }}
    credentials: ${{ secrets.GCP_SA_KEY }}
```

**Ejemplo para Kubernetes:**

```yaml
- name: Deploy to Kubernetes
  uses: azure/k8s-deploy@v4
  with:
    manifests: |
      k8s/deployment.yaml
      k8s/service.yaml
    images: |
      TU_USUARIO/react-starter-pnpm:${{ github.sha }}
```

---

## 📊 Comparación de Entornos

| Característica      | Desarrollo Local  | Docker Dev              | Producción       |
| ------------------- | ----------------- | ----------------------- | ---------------- |
| **Velocidad**       | ⚡⚡⚡ Muy rápida | ⚡⚡ Rápida             | ⚡ Lenta (build) |
| **HMR**             | ✅ Sí             | ✅ Sí                   | ❌ No            |
| **Debugging**       | ✅ Fácil          | ⚠️ Requiere pasos extra | ❌ Difícil       |
| **Consistencia**    | ⚠️ Depende del OS | ✅ Total                | ✅ Total         |
| **Optimización**    | ❌ No             | ❌ No                   | ✅ Sí            |
| **Tamaño Imagen**   | N/A               | ~500MB                  | ~25MB            |
| **Servidor**        | Vite Dev Server   | Vite Dev Server         | Nginx            |
| **Hot Reload**      | ✅ Sí             | ✅ Sí                   | ❌ No            |
| **Source Maps**     | ✅ Sí             | ✅ Sí                   | ❌ No            |
| **Uso Recomendado** | Desarrollo diario | Testing integración     | Usuarios finales |

---

## 🔄 Flujo de Trabajo Completo (End-to-End)

### Escenario: Desde Idea hasta Producción

#### Fase 1: Planificación

1. **Definir la funcionalidad**
   - Qué se va a construir
   - Qué APIs se necesitan
   - Qué componentes se requieren

2. **Crear rama de feature**

```bash
git checkout -b feature/nueva-funcionalidad
```

#### Fase 2: Desarrollo

1. **Desarrollo local**

```bash
pnpm dev
```

- Crear componentes
- Implementar lógica
- Escribir tests

2. **Testing continuo**

```bash
pnpm test          # Tests en modo watch
pnpm lint          # Verificar estilo
pnpm tsc --noEmit  # Verificar tipos
```

3. **Commits frecuentes**

```bash
git add .
pnpm commit
```

#### Fase 3: Verificación

1. **Build local**

```bash
pnpm build
```

2. **Testing con Docker (opcional)**

```bash
pnpm docker:dev
# Verificar que funciona en entorno Docker
pnpm docker:down
```

3. **Push y crear PR**

```bash
git push origin feature/nueva-funcionalidad
```

4. **GitHub Actions PR Check**
   - Esperar a que pasen todos los checks
   - Revisar logs si hay errores
   - Corregir si es necesario

#### Fase 4: Integración

1. **Code Review**
   - Solicitar review al equipo
   - Address comentarios
   - Hacer cambios si es necesario

2. **Merge a main**
   - Después de aprobación
   - Squash merge (opcional)
   - Delete branch después de merge

#### Fase 5: Despliegue Automático

1. **GitHub Actions CI/CD**
   - CI job se ejecuta automáticamente
   - Docker build se ejecuta automáticamente
   - Deploy job se ejecuta automáticamente (si está configurado)

2. **Verificar despliegue**
   - Chequear que la imagen esté en Docker Hub
   - Verificar que la aplicación esté funcionando
   - Monitorear logs y errores

#### Fase 6: Monitoreo

1. **Verificar en producción**
   - Navegar a la URL de producción
   - Probar la nueva funcionalidad
   - Verificar console errors

2. **Monitorear errores**
   - Revisar logs del servidor
   - Verificar métricas de rendimiento
   - Chequear errores reportados

---

## 🎯 Buenas Prácticas por Entorno

### Desarrollo Local

✅ **Hacer:**

- Usar HMR para feedback rápido
- Escribir tests mientras desarrollas
- Hacer commits pequeños y frecuentes
- Usar ramas de feature
- Ejecutar lint y type check localmente

❌ **No hacer:**

- Commits grandes con muchos cambios
- Ignorar warnings de TypeScript
- Hacer commits sin tests
- Trabajar directamente en main

### Docker Dev

✅ **Hacer:**

- Usar volúmenes para hot reload
- Verificar logs del contenedor
- Limpiar contenedores e imágenes regularmente
- Usar .dockerignore para builds más rápidos

❌ **No hacer:**

- Incluir node_modules en la imagen
- Usar la etapa `prod` para desarrollo
- Dejar contenedores corriendo sin usar
- Ignorar errores de build

### Producción

✅ **Hacer:**

- Usar siempre multi-stage builds
- Especificar versiones exactas de dependencias
- Incluir variables de entorno en build
- Monitorear logs y métricas
- Tener rollback plan

❌ **No hacer:**

- Usar la etapa `deps` o `build` para producción
- Incluir secrets en la imagen
- Desplegar sin testing
- Ignorar errores de runtime

---

## 📚 Guía de Uso

### Instalación y Setup Inicial

#### 1. Instalar Dependencias

```bash
pnpm install
```

Este comando:

- Lee `package.json`
- Instala todas las dependencias listadas
- Crea/actualiza `pnpm-lock.yaml`
- Instala dependencias en `node_modules/`

#### 2. Iniciar Servidor de Desarrollo

```bash
pnpm dev
```

Esto iniciará:

- Servidor de desarrollo Vite en `http://localhost:5173`
- Hot Module Replacement (HMR) activo
- Compilación de TypeScript al vuelo
- Source maps para debugging

#### 3. Abrir en el Navegador

Visita `http://localhost:5173` para ver tu aplicación.

---

### Desarrollo Diario

#### Crear un Nuevo Componente

```typescript
// src/components/Button.tsx
interface ButtonProps {
  children: React.ReactNode
  onClick?: () => void
  variant?: 'primary' | 'secondary'
}

export function Button({ children, onClick, variant = 'primary' }: ButtonProps) {
  return (
    <button
      onClick={onClick}
      className={`button button-${variant}`}
    >
      {children}
    </button>
  )
}
```

#### Crear Test para el Componente

```typescript
// src/components/Button.test.tsx
import { describe, it, expect } from 'vitest'
import { render, screen, fireEvent } from '@testing-library/react'
import { Button } from './Button'

describe('Button', () => {
  it('renders children correctly', () => {
    render(<Button>Click me</Button>)
    expect(screen.getByText('Click me')).toBeInTheDocument()
  })

  it('calls onClick when clicked', () => {
    const handleClick = vi.fn()
    render(<Button onClick={handleClick}>Click me</Button>)

    fireEvent.click(screen.getByText('Click me'))
    expect(handleClick).toHaveBeenCalledTimes(1)
  })
})
```

#### Usar Path Aliases

```typescript
// Sin alias (no recomendado)
import { Button } from '../../../components/Button';
import { useAuth } from '../../../hooks/useAuth';

// Con alias (recomendado)
import { Button } from '@components/Button';
import { useAuth } from '@hooks/useAuth';
```

#### Crear un Custom Hook

```typescript
// src/hooks/useCounter.ts
import { useState, useCallback } from 'react';

export function useCounter(initialValue: number = 0) {
  const [count, setCount] = useState(initialValue);

  const increment = useCallback(() => {
    setCount((prev) => prev + 1);
  }, []);

  const decrement = useCallback(() => {
    setCount((prev) => prev - 1);
  }, []);

  const reset = useCallback(() => {
    setCount(initialValue);
  }, [initialValue]);

  return { count, increment, decrement, reset };
}
```

#### Crear Utilidades

```typescript
// src/utils/formatDate.ts
export function formatDate(date: Date): string {
  return new Intl.DateTimeFormat('es-ES', {
    year: 'numeric',
    month: 'long',
    day: 'numeric',
  }).format(date);
}

export function formatCurrency(amount: number): string {
  return new Intl.NumberFormat('es-ES', {
    style: 'currency',
    currency: 'EUR',
  }).format(amount);
}
```

#### Crear Tipos

```typescript
// src/types/user.ts
export interface User {
  id: string;
  name: string;
  email: string;
  role: 'admin' | 'user' | 'guest';
  createdAt: Date;
}

export interface UserResponse {
  data: User[];
  total: number;
  page: number;
}

export type UserRole = User['role'];
```

---

### Testing

#### Ejecutar Tests en Modo Watch

```bash
pnpm test
```

Esto iniciará Vitest en modo watch:

- Ejecuta tests automáticamente cuando cambian los archivos
- Muestra resultados en tiempo real
- Permite filtrar tests por patrón

#### Ejecutar Tests una vez

```bash
pnpm test --run
```

#### Ejecutar Tests con UI

```bash
pnpm test:ui
```

Abre una interfaz visual para:

- Ver resultados de tests
- Filtrar y ejecutar tests específicos
- Ver coverage de código

#### Ejecutar Coverage

```bash
pnpm coverage
```

Genera un reporte de coverage:

- Líneas de código cubiertas
- Branches cubiertas
- Funciones cubiertas
- Statements cubiertos

```bash
pnpm coverage:report
```

Genera reportes en múltiples formatos (text, json, html).

```bash
pnpm coverage:open
```

Abre el reporte HTML en el navegador.

#### Ejemplo de Test Complejo

```typescript
// src/components/UserList.test.tsx
import { describe, it, expect, beforeEach } from 'vitest'
import { render, screen, waitFor } from '@testing-library/react'
import { UserList } from './UserList'
import { fetchUsers } from '@utils/api'

// Mock de la API
vi.mock('@utils/api', () => ({
  fetchUsers: vi.fn(),
}))

describe('UserList', () => {
  const mockUsers = [
    { id: '1', name: 'John', email: 'john@example.com' },
    { id: '2', name: 'Jane', email: 'jane@example.com' },
  ]

  beforeEach(() => {
    vi.clearAllMocks()
  })

  it('shows loading state initially', () => {
    vi.mocked(fetchUsers).mockImplementation(() => new Promise(() => {}))

    render(<UserList />)
    expect(screen.getByText('Loading...')).toBeInTheDocument()
  })

  it('displays users after loading', async () => {
    vi.mocked(fetchUsers).mockResolvedValue(mockUsers)

    render(<UserList />)

    await waitFor(() => {
      expect(screen.getByText('John')).toBeInTheDocument()
      expect(screen.getByText('Jane')).toBeInTheDocument()
    })
  })

  it('shows error message on failure', async () => {
    vi.mocked(fetchUsers).mockRejectedValue(new Error('API Error'))

    render(<UserList />)

    await waitFor(() => {
      expect(screen.getByText('Error loading users')).toBeInTheDocument()
    })
  })
})
```

---

### E2E Testing con Playwright

#### Inicializar Playwright

```bash
pnpm exec playwright install
```

#### Crear Test E2E

```typescript
// tests/e2e/example.spec.ts
import { test, expect } from '@playwright/test';

test('homepage loads correctly', async ({ page }) => {
  await page.goto('http://localhost:5173');

  await expect(page).toHaveTitle(/React Starter/);
  await expect(page.locator('h1')).toContainText('React Starter');
});

test('navigation works', async ({ page }) => {
  await page.goto('http://localhost:5173');

  await page.click('text=About');
  await expect(page).toHaveURL(/.*about/);
});
```

#### Ejecutar Tests E2E

```bash
pnpm test:e2e
```

#### Ejecutar Tests E2E con UI

```bash
pnpm test:e2e:ui
```

---

### Git Workflow

#### Hacer Changes

```bash
# Editar archivos
git add .
```

#### Pre-commit Hook Automático

Cuando ejecutas `git commit`, los hooks se ejecutan automáticamente:

1. **Lint-staged** ejecuta ESLint y Prettier en los archivos modificados
2. Si hay errores de ESLint que no se pueden corregir automáticamente, el commit se rechaza
3. Si todo está correcto, el commit procede

#### Crear Commit con Commitizen

```bash
pnpm commit
```

Esto abrirá una interfaz interactiva:

```
? Select the type of change that you're committing:
  feat:     A new feature
  fix:      A bug fix
  docs:     Documentation only changes
  style:    Changes that do not affect the meaning of the code
  refactor: A code change that neither fixes a bug nor adds a feature
  perf:     A code change that improves performance
  test:     Adding missing tests or correcting existing tests
  chore:    Changes to the build process or auxiliary tools
```

Luego te pedirá:

- Scope (alcance del cambio)
- Description (descripción breve)
- Body (descripción detallada, opcional)
- Footer (issues relacionados, opcional)

#### Ejemplo de Commit Exitoso

```bash
$ pnpm commit

? Select the type of change that you're committing: feat
? What is the scope of this change? (e.g. component or file name): auth
? Write a short, imperative tense description of the change: add login form
? Provide a longer description of the change: (press enter to skip)

? Are there any breaking changes? No
? Does this change affect any open issues? No

[main abc1234] feat(auth): add login form
 1 file changed, 25 insertions(+)
```

#### Commit con Mensaje Directo

```bash
git commit -m "feat(auth): add login form"
```

Commitlint validará que el formato sea correcto.

---

### Linting y Formateo

#### Lintear Manualmente

```bash
pnpm lint
```

Ejecuta ESLint en todos los archivos y muestra errores y advertencias.

#### Lintear y Corregir Automáticamente

```bash
pnpm lint --fix
```

ESLint corregirá automáticamente los errores que pueda.

#### Formatear con Prettier

```bash
npx prettier --write .
```

Formatea todos los archivos con Prettier.

#### Verificar Formateo

```bash
npx prettier --check .
```

Verifica si los archivos están formateados correctamente (sin modificarlos).

---

### Build para Producción

#### Crear Build de Producción

```bash
pnpm build
```

Este comando:

1. Ejecuta TypeScript para verificar tipos
2. Ejecuta Vite para crear el build optimizado
3. Genera archivos en `dist/`
4. Optimiza y minifica el código
5. Genera source maps

#### Estructura del Build

```
dist/
├── index.html                  # HTML entry point
└── assets/
    ├── index-[hash].js        # JavaScript bundle
    └── index-[hash].css       # CSS (si existe)
```

#### Previsualizar Build de Producción

```bash
pnpm preview
```

Inicia un servidor local para previsualizar el build de producción.

---

## 🔄 Flujo de Trabajo Completo

### Escenario 1: Desarrollar Nueva Funcionalidad

#### 1. Crear Rama de Feature

```bash
git checkout -b feat/user-authentication
```

#### 2. Desarrollar Componentes

```bash
# Crear componente de autenticación
touch src/components/AuthForm.tsx

# Editar el archivo con tu código
```

#### 3. Crear Tests

```bash
# Crear archivo de tests
touch src/components/AuthForm.test.tsx

# Escribir tests
```

#### 4. Ejecutar Tests en Desarrollo

```bash
# Terminal 1: Servidor de desarrollo
pnpm dev

# Terminal 2: Tests en modo watch
pnpm test
```

#### 5. Verificar Linting

```bash
pnpm lint
```

#### 6. Hacer Commit

```bash
git add .
pnpm commit
```

Commitizen te guiará para crear un commit con formato correcto:

```
feat(auth): add user authentication form
```

#### 7. Hacer Push y Crear Pull Request

```bash
git push origin feat/user-authentication
```

Luego crea un Pull Request en GitHub/GitLab.

### Escenario 2: Corregir un Bug

#### 1. Crear Rama de Fix

```bash
git checkout -b fix/login-button-error
```

#### 2. Reproducir el Bug

```bash
pnpm dev
# Navegar a la página y reproducir el bug
```

#### 3. Escribir Test que Falla

```typescript
// src/components/LoginButton.test.tsx
it('should handle click correctly', () => {
  // Test que reproduce el bug
});
```

```bash
pnpm test  # Debe fallar
```

#### 4. Corregir el Bug

```typescript
// src/components/LoginButton.tsx
// Corregir el código
```

#### 5. Verificar que el Test Pase

```bash
pnpm test  # Debe pasar
```

#### 6. Verificar Linting y Build

```bash
pnpm lint
pnpm build
```

#### 7. Commit con Tipo fix

```bash
git add .
pnpm commit
# Seleccionar tipo: fix
# Scope: button
# Descripción: resolve click handler issue
```

### Escenario 3: Refactorización

#### 1. Crear Rama de Refactor

```bash
git checkout -b refactor/optimize-user-service
```

#### 2. Escribir Tests Primero (si no existen)

```typescript
// src/services/user.service.test.ts
describe('UserService', () => {
  // Tests existentes para asegurar comportamiento
});
```

#### 3. Refactorizar Código

```typescript
// src/services/user.service.ts
// Mejorar estructura, performance, etc.
```

#### 4. Verificar que Tests Pase

```bash
pnpm test
```

#### 5. Verificar Linting

```bash
pnpm lint
```

#### 6. Commit con Tipo refactor

```bash
git add .
pnpm commit
# Tipo: refactor
# Scope: service
# Descripción: optimize user service performance
```

### Escenario 4: Actualizar Dependencias

#### 1. Verificar Dependencias Desactualizadas

```bash
pnpm outdated
```

#### 2. Actualizar Dependencia Específica

```bash
pnpm update react
```

#### 3. Actualizar Todas las Dependencias

```bash
pnpm update
```

#### 4. Verificar que Todo Funcione

```bash
pnpm lint
pnpm test
pnpm build
```

#### 5. Commit con Tipo chore

```bash
git add .
pnpm commit
# Tipo: chore
# Descripción: update dependencies
```

---

## 🎯 Comandos Disponibles

### Desarrollo

| Comando        | Descripción                           |
| -------------- | ------------------------------------- |
| `pnpm dev`     | Inicia servidor de desarrollo con HMR |
| `pnpm build`   | Crea build de producción              |
| `pnpm preview` | Previsualiza build de producción      |

### Calidad de Código

| Comando           | Descripción                               |
| ----------------- | ----------------------------------------- |
| `pnpm lint`       | Ejecuta ESLint para verificar código      |
| `pnpm lint --fix` | Corrige automáticamente errores de ESLint |

### Testing

| Comando                | Descripción                                       |
| ---------------------- | ------------------------------------------------- |
| `pnpm test`            | Ejecuta tests en modo watch                       |
| `pnpm test --run`      | Ejecuta tests una vez                             |
| `pnpm test:ui`         | Ejecuta tests con interfaz visual                 |
| `pnpm test:e2e`        | Ejecuta tests E2E con Playwright                  |
| `pnpm test:e2e:ui`     | Ejecuta tests E2E con interfaz visual             |
| `pnpm coverage`        | Genera reporte de coverage                        |
| `pnpm coverage:report` | Genera reportes de coverage en múltiples formatos |
| `pnpm coverage:open`   | Abre reporte de coverage HTML                     |

### Git

| Comando       | Descripción                              |
| ------------- | ---------------------------------------- |
| `pnpm commit` | Crea commit con Commitizen (interactivo) |

### pnpm

| Comando                 | Descripción                            |
| ----------------------- | -------------------------------------- |
| `pnpm install`          | Instala dependencias                   |
| `pnpm update`           | Actualiza dependencias                 |
| `pnpm outdated`         | Muestra dependencias desactualizadas   |
| `pnpm add <package>`    | Agrega nueva dependencia               |
| `pnpm add -D <package>` | Agrega nueva dependencia de desarrollo |

---

## 📋 Convenciones y Mejores Prácticas

### Convenciones de Nomenclatura

#### Archivos

- **Componentes**: PascalCase (`Button.tsx`, `UserProfile.tsx`)
- **Hooks**: camelCase con prefijo `use` (`useCounter.ts`, `useAuth.ts`)
- **Utilidades**: camelCase (`formatDate.ts`, `apiClient.ts`)
- **Tipos**: camelCase (`userTypes.ts`, `apiTypes.ts`)
- **Tests**: Mismo nombre que el archivo con `.test.tsx` (`Button.test.tsx`)

#### Variables y Funciones

```typescript
// Variables: camelCase
const userName = 'John';
const isLoggedIn = true;

// Funciones: camelCase
function getUserData() {}
function handleSubmit() {}

// Constantes: UPPER_SNAKE_CASE
const API_BASE_URL = 'https://api.example.com';
const MAX_RETRIES = 3;

// Interfaces y Types: PascalCase
interface User {}
type UserRole = 'admin' | 'user';

// Enumeraciones: PascalCase
enum UserRole {
  Admin = 'admin',
  User = 'user',
}
```

### Estructura de Componentes

```typescript
// 1. Imports
import React from 'react'
import { useAuth } from '@hooks/useAuth'
import { Button } from '@components/Button'
import type { UserProps } from '@types/user'

// 2. Types/Interfaces
interface MyComponentProps {
  title: string
  onClick: () => void
}

// 3. Componente
export function MyComponent({ title, onClick }: MyComponentProps) {
  // 4. Hooks
  const { user } = useAuth()

  // 5. Handlers
  const handleClick = () => {
    onClick()
  }

  // 6. Effects
  React.useEffect(() => {
    // Lógica de efecto
  }, [])

  // 7. Render
  return (
    <div>
      <h1>{title}</h1>
      <Button onClick={handleClick}>Click me</Button>
    </div>
  )
}
```

### Mejores Prácticas de React

#### 1. Usar Componentes Funcionales

```typescript
// ✅ Bueno
export function Button({ children }: { children: React.ReactNode }) {
  return <button>{children}</button>
}

// ❌ Evitar (class components)
export class Button extends React.Component {
  // ...
}
```

#### 2. Usar TypeScript para Props

```typescript
// ✅ Bueno
interface ButtonProps {
  children: React.ReactNode
  onClick?: () => void
  disabled?: boolean
}

export function Button({ children, onClick, disabled }: ButtonProps) {
  return (
    <button onClick={onClick} disabled={disabled}>
      {children}
    </button>
  )
}

// ❌ Evitar
export function Button(props: any) {
  // ...
}
```

#### 3. Evitar any Type

```typescript
// ✅ Bueno
interface User {
  id: string;
  name: string;
  email: string;
}

function processUser(user: User) {
  // ...
}

// ❌ Evitar
function processUser(user: any) {
  // ...
}
```

#### 4. Usar React Compiler

Con React Compiler habilitado, no necesitas:

- `useMemo` para memoización de valores
- `useCallback` para memoización de funciones
- `React.memo` para memoización de componentes

```typescript
// ✅ Bueno (con React Compiler)
export function ExpensiveComponent({ data }: { data: Data[] }) {
  const processed = data.map(item => expensiveCalculation(item))
  return <div>{/* ... */}</div>
}

// ❌ No necesario (con React Compiler)
export function ExpensiveComponent({ data }: { data: Data[] }) {
  const processed = useMemo(
    () => data.map(item => expensiveCalculation(item)),
    [data]
  )
  return <div>{/* ... */}</div>
}
```

#### 5. Manejo de Errores

```typescript
// ✅ Bueno
export function UserProfile({ userId }: { userId: string }) {
  const { data, error, isLoading } = useUser(userId)

  if (isLoading) return <div>Loading...</div>
  if (error) return <div>Error: {error.message}</div>
  if (!data) return <div>User not found</div>

  return <div>{data.name}</div>
}
```

### Mejores Prácticas de Testing

#### 1. Tests Descriptivos

```typescript
// ✅ Bueno
describe('Button', () => {
  it('renders children correctly', () => {});
  it('calls onClick when clicked', () => {});
  it('is disabled when disabled prop is true', () => {});
});

// ❌ Evitar
describe('Button', () => {
  it('works', () => {});
  it('test 1', () => {});
});
```

#### 2. Testing Behavior, No Implementation

```typescript
// ✅ Bueno (test behavior)
it('calls onClick when clicked', () => {
  const handleClick = vi.fn()
  render(<Button onClick={handleClick}>Click</Button>)
  fireEvent.click(screen.getByText('Click'))
  expect(handleClick).toHaveBeenCalledTimes(1)
})

// ❌ Evitar (test implementation)
it('sets onClick to button onClick prop', () => {
  const handleClick = vi.fn()
  const button = new Button({ onClick: handleClick })
  expect(button.props.onClick).toBe(handleClick)
})
```

#### 3. Usar Testing Library Queries

```typescript
// ✅ Bueno (prioritizado por accesibilidad)
expect(screen.getByRole('button', { name: 'Submit' })).toBeInTheDocument();
expect(screen.getByLabelText('Email')).toBeInTheDocument();

// ⚠️ Acceptable (cuando no hay alternativa)
expect(screen.getByText('Submit')).toBeInTheDocument();

// ❌ Evitar (frágil)
expect(container.querySelector('.submit-button')).toBeInTheDocument();
```

### Mejores Prácticas de Git

#### 1. Commits Atómicos

```bash
# ✅ Bueno: Un commit por cambio lógico
git add src/components/Button.tsx
git commit -m "feat(button): add loading state"

git add src/components/Button.test.tsx
git commit -m "test(button): add tests for loading state"

# ❌ Evitar: Commit con cambios no relacionados
git add src/components/Button.tsx src/api/user.ts
git commit -m "various changes"
```

#### 2. Mensajes de Commit Claros

```bash
# ✅ Bueno
feat(auth): add OAuth2 login support
fix(button): resolve click handler race condition
docs(readme): update installation instructions

# ❌ Evitar
fix stuff
update
wip
```

#### 3. Branches con Nombres Descriptivos

```bash
# ✅ Bueno
feat/user-authentication
fix/login-button-error
refactor/optimize-api-client
docs/update-readme

# ❌ Evitar
stuff
fix-1
branch-2
```

---

## 🔧 Troubleshooting

### Problemas Comunes y Soluciones

#### 1. Error: "Cannot find module"

**Problema:**

```
Error: Cannot find module '@components/Button'
```

**Solución:**

- Verifica que el path alias esté configurado en `tsconfig.json` y `vite.config.ts`
- Reinicia el servidor de desarrollo
- Verifica que el archivo exista en la ubicación correcta

#### 2. Error: "TypeScript compilation failed"

**Problema:**

```
error TS2322: Type 'string' is not assignable to type 'number'
```

**Solución:**

- Corrige el error de tipo en el código
- Si es correcto, usa aserción de tipo: `value as number`
- Verifica que el tipo esté correctamente definido

#### 3. Tests Fallan Después de Refactor

**Problema:**
Los tests fallan después de cambiar la implementación pero no el comportamiento.

**Solución:**

- Verifica que los tests estén probando comportamiento, no implementación
- Actualiza los tests si el comportamiento cambió intencionalmente
- Usa snapshots con cuidado (pueden ser frágiles)

#### 4. ESLint Error en Pre-commit

**Problema:**
El commit se rechaza por errores de ESLint.

**Solución:**

```bash
# Ver errores
pnpm lint

# Corregir automáticamente
pnpm lint --fix

# Si no se puede corregir automáticamente, corrige manualmente
```

#### 5. Commitlint Rechaza Commit

**Problema:**

```
⧗   input: add new feature
✖   subject may not be empty [subject-empty]
✖   type may not be empty [type-empty]
```

**Solución:**
Usa el formato convencional:

```bash
# Correcto
git commit -m "feat: add new feature"

# O usa Commitizen
pnpm commit
```

#### 6. Port Already in Use

**Problema:**

```
Error: Port 5173 is already in use
```

**Solución:**

```bash
# Matar proceso en el puerto
npx kill-port 5173

# O usar otro puerto
pnpm dev --port 3000
```

#### 7. Dependency Conflicts

**Problema:**
Conflictos de versiones entre dependencias.

**Solución:**

```bash
# Limpiar cache e instalar
rm -rf node_modules pnpm-lock.yaml
pnpm install

# O actualizar dependencias
pnpm update
```

#### 8. Build Failed

**Problema:**
El build de producción falla pero el desarrollo funciona.

**Solución:**

```bash
# Verificar TypeScript
pnpm build  # Esto ejecuta tsc primero

# Verificar que no haya imports relativos rotos
# Verificar que todos los archivos necesarios estén incluidos
```

---

## 📖 Recursos Adicionales

### Documentación Oficial

- **React**: https://react.dev
- **TypeScript**: https://www.typescriptlang.org/docs
- **Vite**: https://vitejs.dev
- **Vitest**: https://vitest.dev
- **Playwright**: https://playwright.dev
- **ESLint**: https://eslint.org/docs/latest
- **Prettier**: https://prettier.io/docs/en

### Tutoriales y Guías

- **React Tutorial**: https://react.dev/learn
- **TypeScript Handbook**: https://www.typescriptlang.org/docs/handbook/intro.html
- **Vite Guide**: https://vitejs.dev/guide/
- **Testing Library**: https://testing-library.com/docs/react-testing-library/intro/

### Comunidades

- **React Discord**: https://react.dev/community
- **TypeScript Community**: https://www.typescriptlang.org/community
- **Vite Discord**: https://chat.vitejs.dev
- **Stack Overflow**: Etiquetas: react, typescript, vite

### Herramientas Útiles

- **TypeScript VSCode Plugin**: Mejora el soporte de TypeScript en VSCode
- **ESLint VSCode Plugin**: Integración de ESLint en VSCode
- **Prettier VSCode Plugin**: Formateo automático en VSCode
- **Vitest VSCode Plugin**: Integración de Vitest en VSCode
- **React DevTools**: Herramientas de desarrollo para React

---

## 🎓 Conclusión

Este proyecto proporciona una base sólida y moderna para desarrollar aplicaciones React con las mejores prácticas actuales. La configuración está optimizada para:

- **Desarrollo Rápido**: HMR, build instantáneo, herramientas modernas
- **Calidad de Código**: TypeScript estricto, linting automático, testing
- **Colaboración**: Git hooks, commits convencionales, code review
- **Mantenibilidad**: Estructura clara, documentación completa, estándares

Sigue las guías y convenciones descritas en esta documentación para mantener la calidad y consistencia del código a medida que el proyecto crece.

¡Feliz desarrollo! 🚀
