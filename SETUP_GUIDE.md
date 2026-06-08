# 📘 Guía Detallada de Configuración - Paso a Paso

Esta guía está diseñada para principiantes y explica cada paso al milímetro para configurar y usar el proyecto con Docker y GitHub Actions.

---

## 📋 Tabla de Contenidos

1. [Prerrequisitos](#prerrequisitos)
2. [Configuración Inicial Local](#configuración-inicial-local)
3. [Configuración de Docker Hub](#configuración-de-docker-hub)
4. [Configuración de GitHub Secrets](#configuración-de-github-secrets)
5. [Flujo de Trabajo de Desarrollo](#flujo-de-trabajo-de-desarrollo)
6. [Flujo de Trabajo de Producción](#flujo-de-trabajo-de-producción)
7. [Primer Despliegue](#primer-despliegue)
8. [Solución de Problemas Comunes](#solución-de-problemas-comunes)

---

## 🔑 Prerrequisitos

Antes de comenzar, asegúrate de tener instalado:

### 1. Docker Desktop

**¿Qué es?** Docker es una plataforma que permite empaquetar aplicaciones en contenedores.

**¿Para qué sirve?** Para que tu aplicación corra igual en tu computadora que en producción.

**Cómo instalarlo:**

- **Windows/Mac:** Descarga desde [docker.com](https://www.docker.com/products/docker-desktop/)
- **Linux:** Sigue las instrucciones para tu distribución en [docs.docker.com](https://docs.docker.com/engine/install/)

**Cómo verificar que está instalado:**

```bash
docker --version
```

Deberías ver algo como: `Docker version 29.5.2, build ...`

### 2. pnpm

**¿Qué es?** Un gestor de paquetes rápido y eficiente para JavaScript.

**¿Para qué sirve?** Para instalar las dependencias de tu proyecto.

**Cómo instalarlo:**

```bash
npm install -g pnpm
```

**Cómo verificar que está instalado:**

```bash
pnpm --version
```

Deberías ver algo como: `10.34.1`

### 3. Cuenta en Docker Hub

**¿Qué es?** Docker Hub es como un "GitHub" para imágenes de Docker.

**¿Para qué sirve?** Para almacenar y compartir tus imágenes de Docker.

**Cómo crear una cuenta:**

1. Ve a [hub.docker.com](https://hub.docker.com/)
2. Haz clic en "Sign Up"
3. Completa el registro con tu email y contraseña
4. Verifica tu email

### 4. Cuenta en GitHub

**¿Qué es?** Plataforma para hospedar código y colaborar.

**¿Para qué sirve?** Para almacenar tu código y usar GitHub Actions para CI/CD.

**Si ya tienes una cuenta:** Perfecto, continúa.

**Si no tienes una cuenta:**

1. Ve a [github.com](https://github.com/)
2. Haz clic en "Sign up"
3. Completa el registro

---

## 💻 Configuración Inicial Local

### Paso 1: Instalar Dependencias

**¿Qué hace este paso?** Descarga todas las librerías que necesita tu proyecto.

**Comando:**

```bash
pnpm install
```

**¿Qué verás?**

```
Lockfile is up to date, resolution step is skipped
Progress: resolved 561, reused 0, downloaded 561, added 561
Done in X.Xs using pnpm vX.X.X
```

**¿Qué significa?**

- Se descargaron 561 paquetes
- Se creó la carpeta `node_modules/` con todas las dependencias
- Se actualizó `pnpm-lock.yaml` si era necesario

### Paso 2: Verificar que Todo Funciona Localmente

**2.1 Ejecutar el Servidor de Desarrollo**

**Comando:**

```bash
pnpm dev
```

**¿Qué verás?**

```
  VITE v8.0.16  ready in X ms

  ➜  Local:   http://localhost:5173/
  ➜  Network: use --host to expose
  ➜  press h + enter to show help
```

**¿Qué hacer?**

1. Abre tu navegador
2. Ve a `http://localhost:5173/`
3. Deberías ver la aplicación React funcionando

**Para detener el servidor:**

- Presiona `Ctrl + C` en la terminal

**2.2 Ejecutar los Tests**

**Comando:**

```bash
pnpm test --run
```

**¿Qué verás?**

```
✓ src/App.test.js (1 test)
✓ src/App.test.tsx (1 test)

Test Files  2 passed (2)
Tests       2 passed (2)
```

**¿Qué significa?** Todos los tests están pasando correctamente.

**2.3 Ejecutar el Linter**

**Comando:**

```bash
pnpm lint
```

**¿Qué verás?**

```
> react-starter-pnpm@0.0.0 lint
> eslint .
```

**¿Qué significa?** No hay errores de estilo de código.

**2.4 Construir para Producción**

**Comando:**

```bash
pnpm build
```

**¿Qué verás?**

```
vite v8.0.16 building client environment for production...
transforming...✓ 17 modules transformed.
dist/index.html                  0.32 kB │ gzip:  0.23 kB
dist/assets/index-DhsqCFDb.js  190.93 kB │ gzip: 60.23 kB

✓ built in 350ms
```

**¿Qué significa?**

- Se creó la carpeta `dist/` con los archivos optimizados para producción
- La aplicación está lista para ser desplegada

---

## 🐳 Configuración de Docker Hub

### Paso 1: Crear un Repositorio en Docker Hub

**¿Qué es un repositorio en Docker Hub?** Es como una carpeta donde guardarás tus imágenes de Docker.

**Pasos:**

1. Inicia sesión en [hub.docker.com](https://hub.docker.com/)
2. Haz clic en tu nombre de usuario (arriba a la derecha)
3. Selecciona "Repositories"
4. Haz clic en el botón "Create Repository"
5. Llena el formulario:
   - **Name:** `react-starter-pnpm` (debe ser exactamente este nombre)
   - **Visibility:** Public (gratis) o Private (requiere cuenta paga)
   - **Description:** React + TypeScript + Vite starter with Docker
6. Haz clic en "Create"

**✅ Verificación:**

- Deberías ver tu repositorio en la lista de repositorios
- La URL será algo como: `https://hub.docker.com/r/TU_USUARIO/react-starter-pnpm`

### Paso 2: Crear un Token de Acceso (Importante)

**¿Por qué no usar mi contraseña?** Por seguridad. Si alguien obtiene tu contraseña, tiene acceso completo a tu cuenta. Un token se puede revocar fácilmente.

**Pasos:**

1. En Docker Hub, haz clic en tu nombre de usuario (arriba a la derecha)
2. Selecciona "Account Settings"
3. En el menú lateral, haz clic en "Security"
4. En la sección "Access Tokens", haz clic en "New Access Token"
5. Llena el formulario:
   - **Access Token Description:** `github-actions` (o cualquier nombre descriptivo)
   - **Access permissions:** Read & Write (necesario para subir imágenes)
6. Haz clic en "Generate"
7. **¡IMPORTANTE!** Copia el token inmediatamente. No podrás verlo de nuevo.

**⚠️ ADVERTENCIA:** Guarda este token en un lugar seguro. Lo necesitarás en el siguiente paso.

---

## 🔐 Configuración de GitHub Secrets

### Paso 1: Subir tu Código a GitHub

**Si ya tienes tu código en GitHub:** Salta al Paso 2.

**Si no tienes tu código en GitHub:**

**1.1 Crear un nuevo repositorio en GitHub:**

1. Ve a [github.com](https://github.com/) e inicia sesión
2. Haz clic en el "+" (arriba a la derecha) → "New repository"
3. Llena el formulario:
   - **Repository name:** `react-starter-pnpm` (o el nombre que prefieras)
   - **Description:** React + TypeScript + Vite starter with Docker and CI/CD
   - **Public/Private:** Elige según prefieras
4. **NO marques** "Add a README file", ".gitignore", o "license" (ya los tenemos)
5. Haz clic en "Create repository"

**1.2 Subir tu código:**

```bash
# Inicializar git si no está inicializado
git init

# Agregar todos los archivos
git add .

# Hacer el primer commit
git commit -m "chore: add Docker and CI/CD configuration"

# Agregar el remoto (reemplaza TU_USUARIO con tu usuario de GitHub)
git remote add origin https://github.com/TU_USUARIO/react-starter-pnpm.git

# Cambiar a la rama main (si no lo está)
git branch -M main

# Subir el código
git push -u origin main
```

**¿Qué verás?**

```
Enumerating objects: XX, done.
Counting objects: 100% (XX/XX), done.
...
To https://github.com/TU_USUARIO/react-starter-pnpm.git
 * [new branch]      main -> main
```

### Paso 2: Configurar los Secrets en GitHub

**¿Qué son los Secrets?** Son variables de entorno seguras que almacenan información sensible como contraseñas y tokens.

**Pasos:**

1. Ve a tu repositorio en GitHub
2. Haz clic en la pestaña "Settings" (arriba)
3. En el menú lateral, haz clic en "Secrets and variables" → "Actions"
4. Haz clic en "New repository secret"

**2.1 Agregar DOCKER_USERNAME:**

1. **Name:** `DOCKER_USERNAME`
2. **Value:** Tu usuario de Docker Hub (el mismo que usas para iniciar sesión)
3. Haz clic en "Add secret"

**2.2 Agregar DOCKER_PASSWORD:**

1. Haz clic en "New repository secret" nuevamente
2. **Name:** `DOCKER_PASSWORD`
3. **Value:** El token de acceso que creaste en Docker Hub (NO tu contraseña)
4. Haz clic en "Add secret"

**2.3 Agregar VITE_API_URL (Opcional pero recomendado):**

1. Haz clic en "New repository secret" nuevamente
2. **Name:** `VITE_API_URL`
3. **Value:** La URL de tu API en producción (ej: `https://api.tu-dominio.com/api`)
4. Si no tienes API aún, puedes poner: `http://localhost:3000/api`
5. Haz clic en "Add secret"

**2.4 Agregar CODECOV_TOKEN (Opcional):**
Este es opcional y solo necesario si quieres subir reportes de cobertura a Codecov.

1. Si quieres usarlo, regístrate en [codecov.io](https://codecov.io/)
2. Crea un token para tu repositorio
3. Agrega el secret:
   - **Name:** `CODECOV_TOKEN`
   - **Value:** El token de Codecov
4. Haz clic en "Add secret"

**✅ Verificación:**
Deberías ver tus secrets listados en la página:

- ✅ DOCKER_USERNAME
- ✅ DOCKER_PASSWORD
- ✅ VITE_API_URL
- ✅ CODECOV_TOKEN (opcional)

---

## 🔄 Flujo de Trabajo de Desarrollo

### Escenario: Desarrollo Local con Docker

**¿Cuándo usar este flujo?** Cuando estás desarrollando nuevas características en tu computadora.

**Paso 1: Iniciar el Entorno de Desarrollo con Docker**

**Opción A: Usando docker-compose (Recomendado para desarrollo con hot reload)**

```bash
pnpm docker:dev
```

**¿Qué hace este comando?**

- Levanta un contenedor Docker con el servidor de desarrollo de Vite
- Monta tu código local en el contenedor (cambios se reflejan automáticamente)
- Expone el puerto 5173 en tu computadora

**¿Qué verás?**

```
[+] Running 2/2
 ✔ Network react-starter-pnpm_default      Created
 ✔ Container react-starter-pnpm-web        Started
```

**¿Qué hacer?**

1. Abre tu navegador en `http://localhost:5173/`
2. Verás tu aplicación corriendo dentro de Docker
3. Cuando hagas cambios en el código, se reflejarán automáticamente (hot reload)

**Para detener:**

```bash
pnpm docker:down
```

**Opción B: Sin Docker (Desarrollo tradicional)**

```bash
pnpm dev
```

**¿Qué hace?** Levanta el servidor de desarrollo directamente en tu computadora.

**¿Cuándo usar cada opción?**

- **Con Docker:** Si quieres simular exactamente el entorno de producción
- **Sin Docker:** Si quieres un desarrollo más rápido y ligero

### Paso 2: Hacer Cambios y Probar

**Ejemplo: Cambiar el texto de la aplicación**

1. Abre `src/App.tsx`
2. Busca el texto que quieres cambiar
3. Modifica el texto
4. Guarda el archivo
5. El navegador se actualizará automáticamente

**Ejecutar tests mientras desarrollas:**

```bash
pnpm test
```

Esto ejecutará los tests en modo watch (se ejecutan automáticamente cuando cambias archivos).

**Ejecutar linter mientras desarrollas:**

```bash
pnpm lint
```

Esto verificará que tu código siga los estándares de estilo.

### Paso 3: Preparar para Commit

**Antes de hacer commit, siempre ejecuta:**

```bash
# Verificar que no hay errores de TypeScript
pnpm tsc --noEmit

# Ejecutar tests
pnpm test --run

# Ejecutar linter
pnpm lint

# Construir para verificar que no hay errores de build
pnpm build
```

**Si todo pasa:**

```bash
# Agregar archivos
git add .

# Hacer commit (usando el wizard interactivo)
pnpm commit
```

**El wizard te preguntará:**

1. **Select the type of change:** elige `feat` para nueva funcionalidad, `fix` para corrección, etc.
2. **What is the scope of this change:** escribe el área afectada (ej: `auth`, `ui`, `api`)
3. **Write a short, imperative tense description:** describe brevemente el cambio
4. **Provide a longer description:** (opcional) explica más detalles
5. **Are there any breaking changes:** generalmente `n`
6. **Does this change affect any open issues:** (opcional) número del issue

**Ejemplo de commit resultante:**

```
feat(ui): add new button component

- Add Button component with variants
- Add styles for primary and secondary buttons
- Add unit tests
```

### Paso 4: Crear una Pull Request

**1. Crear una rama nueva:**

```bash
git checkout -b feature/nueva-funcionalidad
```

**2. Hacer tus cambios y commits:**

```bash
# ... hacer cambios ...
git add .
pnpm commit
git push origin feature/nueva-funcionalidad
```

**3. Crear la PR en GitHub:**

1. Ve a tu repositorio en GitHub
2. Haz clic en "Pull requests" → "New pull request"
3. Selecciona tu rama `feature/nueva-funcionalidad`
4. Haz clic en "Create pull request"
5. Llena el título y descripción
6. Haz clic en "Create pull request"

**¿Qué sucede automáticamente?**

- GitHub Actions ejecutará el workflow `PR Check`
- Verificará: lint, type check, tests, y build
- Verás los resultados en la pestaña "Checks" de tu PR

**4. Revisar y aprobar:**

- Si todos los checks pasan ✅, puedes hacer merge
- Si algún check falla ❌, corrige los errores y haz push nuevamente

---

## 🚀 Flujo de Trabajo de Producción

### Escenario: Desplegar a Producción

**¿Cuándo usar este flujo?** Cuando quieres desplegar tu aplicación a producción.

### Paso 1: Asegurar que la Rama Main Está Actualizada

```bash
git checkout main
git pull origin main
```

### Paso 2: Hacer Push a Main

**Si vienes de una PR:**

1. Después de que la PR es aprobada y mergeada, la rama main se actualiza automáticamente
2. Los cambios ya están en main

**Si haces cambios directamente en main (no recomendado):**

```bash
git add .
git commit -m "feat: nueva funcionalidad"
git push origin main
```

### Paso 3: GitHub Actions se Ejecuta Automáticamente

**¿Qué sucede automáticamente cuando haces push a main?**

1. **CI Job se ejecuta:**
   - ✅ Checkout del código
   - ✅ Instalación de dependencias
   - ✅ Lint (ESLint)
   - ✅ Type Check (TypeScript)
   - ✅ Unit Tests (Vitest)
   - ✅ Coverage report
   - ✅ Build de la aplicación
   - ✅ Upload de artefactos

2. **Docker Build Job se ejecuta (solo si CI pasa):**
   - ✅ Setup de Docker Buildx
   - ✅ Login a Docker Hub
   - ✅ Extracción de metadata (tags, labels)
   - ✅ Build de imagen Docker
   - ✅ Push de imagen a Docker Hub
   - ✅ Caching para builds futuros

3. **Deploy Job se ejecuta (solo si Docker Build pasa):**
   - ⚠️ Este job requiere configuración personalizada
   - Por defecto, solo muestra un mensaje
   - Debes configurarlo según tu proveedor de nube

**¿Cómo ver el progreso?**

1. Ve a tu repositorio en GitHub
2. Haz clic en la pestaña "Actions"
3. Verás el workflow en ejecución
4. Haz clic en el workflow para ver detalles de cada paso

### Paso 4: Verificar la Imagen en Docker Hub

**Pasos:**

1. Ve a [hub.docker.com](https://hub.docker.com/)
2. Inicia sesión
3. Ve a tu repositorio `react-starter-pnpm`
4. Deberías ver una nueva imagen con el tag `latest`

**Tags que se crean automáticamente:**

- `latest`: La versión más reciente (solo en rama main)
- `main-<sha>`: Versión específica del commit en main
- `main`: Versión de la rama main

### Paso 5: Ejecutar la Imagen en Producción

**Opción A: Usar Docker directamente**

```bash
# Descargar y ejecutar la imagen
docker run -d -p 80:80 --name react-app TU_USUARIO/react-starter-pnpm:latest
```

**¿Qué hace este comando?**

- `-d`: Ejecutar en modo detached (segundo plano)
- `-p 80:80`: Mapear el puerto 80 del contenedor al puerto 80 de tu computadora
- `--name react-app`: Nombre del contenedor
- `TU_USUARIO/react-starter-pnpm:latest`: Tu imagen

**Verificar que está corriendo:**

```bash
docker ps
```

Deberías ver tu contenedor en la lista.

**Acceder a la aplicación:**

1. Abre tu navegador
2. Ve a `http://localhost/`
3. Deberías ver tu aplicación

**Ver logs:**

```bash
docker logs react-app
```

**Detener el contenedor:**

```bash
docker stop react-app
```

**Eliminar el contenedor:**

```bash
docker rm react-app
```

**Opción B: Usar docker-compose (Recomendado)**

Crea un archivo `docker-compose.prod.yml`:

```yaml
version: '3.8'

services:
  web:
    image: TU_USUARIO/react-starter-pnpm:latest
    container_name: react-app-prod
    ports:
      - '80:80'
    restart: always
```

**Ejecutar:**

```bash
docker-compose -f docker-compose.prod.yml up -d
```

**¿Por qué es mejor esta opción?**

- Configuración más clara y reproducible
- Fácil de escalar (múltiples contenedores)
- Fácil de agregar otros servicios (base de datos, etc.)

### Paso 6: Configurar el Deploy Automático (Opcional)

**Actualmente, el job de deploy es un placeholder.** Para hacerlo funcionar, debes editarlo según tu proveedor de nube.

**Ejemplo para Kubernetes:**

Edita `.github/workflows/ci-cd.yml`:

```yaml
- name: Deploy to Kubernetes
  uses: azure/k8s-deploy@v4
  with:
    manifests: |
      k8s/deployment.yaml
      k8s/service.yaml
    images: |
      TU_USUARIO/react-starter-pnpm:${{ github.sha }}
    kubectl-version: 'latest'
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

---

## 🎯 Primer Despliegue Completo

### Checklist Completo para tu Primer Despliegue

**✅ Prerrequisitos:**

- [ ] Docker Desktop instalado y corriendo
- [ ] pnpm instalado globalmente
- [ ] Cuenta en Docker Hub creada
- [ ] Cuenta en GitHub creada
- [ ] Código subido a GitHub

**✅ Configuración de Docker Hub:**

- [ ] Repositorio `react-starter-pnpm` creado
- [ ] Token de acceso generado
- [ ] Token copiado y guardado en lugar seguro

**✅ Configuración de GitHub:**

- [ ] Secret `DOCKER_USERNAME` configurado
- [ ] Secret `DOCKER_PASSWORD` configurado
- [ ] Secret `VITE_API_URL` configurado
- [ ] Secret `CODECOV_TOKEN` configurado (opcional)

**✅ Verificación Local:**

- [ ] `pnpm install` ejecutado exitosamente
- [ ] `pnpm dev` funciona y la app carga en el navegador
- [ ] `pnpm test --run` pasa todos los tests
- [ ] `pnpm lint` no muestra errores
- [ ] `pnpm build` crea la carpeta `dist/`
- [ ] `docker build -t react-starter-pnpm .` construye la imagen exitosamente

**✅ Primer Despliegue:**

- [ ] Cambios commit y push a main
- [ ] GitHub Actions CI job pasa exitosamente
- [ ] GitHub Actions Docker Build job pasa exitosamente
- [ ] Imagen aparece en Docker Hub con tag `latest`
- [ ] `docker run -d -p 80:80 TU_USUARIO/react-starter-pnpm:latest` funciona
- [ ] Aplicación accesible en `http://localhost/`

---

## 🔧 Solución de Problemas Comunes

### Problema: "pnpm: command not found"

**Causa:** pnpm no está instalado o no está en el PATH.

**Solución:**

```bash
npm install -g pnpm
```

Verifica:

```bash
pnpm --version
```

### Problema: "docker: command not found"

**Causa:** Docker no está instalado o Docker Desktop no está corriendo.

**Solución:**

1. Instala Docker Desktop desde [docker.com](https://www.docker.com/products/docker-desktop/)
2. Asegúrate de que Docker Desktop esté corriendo
3. Verifica:

```bash
docker --version
```

### Problema: "Cannot connect to the Docker daemon"

**Causa:** Docker Desktop no está corriendo.

**Solución:**

1. Abre Docker Desktop
2. Espera a que esté completamente iniciado (el icono está estable)
3. Intenta nuevamente

### Problema: GitHub Actions falla con "permission denied"

**Causa:** Los secrets no están configurados correctamente.

**Solución:**

1. Ve a Settings → Secrets and variables → Actions
2. Verifica que `DOCKER_USERNAME` y `DOCKER_PASSWORD` existan
3. Verifica que los valores sean correctos
4. Borra los secrets y créalos nuevamente si es necesario
5. Re-ejecuta el workflow

### Problema: Docker push falla con "denied: requested access to the resource is denied"

**Causa:** El nombre del repositorio en Docker Hub no coincide con el workflow.

**Solución:**

1. Verifica que tu repositorio en Docker Hub se llame exactamente `react-starter-pnpm`
2. Verifica que en el workflow la imagen sea: `${{ secrets.DOCKER_USERNAME }}/react-starter-pnpm`
3. Si tu usuario es `juanperez`, la imagen debe ser `juanperez/react-starter-pnpm`

### Problema: Tests fallan en GitHub Actions pero pasan localmente

**Causa:** Diferencias de entorno (Windows vs Linux, versiones diferentes, etc.)

**Solución:**

1. Ejecuta los tests localmente con el mismo comando que usa GitHub Actions:

```bash
pnpm test --run
```

2. Verifica que todas las dependencias estén en `package.json`
3. Verifica que no haya dependencias locales (paths relativos)
4. Revisa los logs detallados en GitHub Actions para ver el error exacto

### Problema: Build falla con "VITE_API_URL is not defined"

**Causa:** El secret `VITE_API_URL` no está configurado o no se está pasando correctamente.

**Solución:**

1. Configura el secret `VITE_API_URL` en GitHub
2. Verifica que en el workflow se esté pasando:

```yaml
build-args: |
  VITE_API_URL=${{ secrets.VITE_API_URL }}
```

### Problema: La aplicación no carga cuando se ejecuta con Docker

**Causa:** Posible problema con el nginx.conf o con los archivos estáticos.

**Solución:**

1. Verifica los logs del contenedor:

```bash
docker logs react-app
```

2. Si ves errores de nginx, verifica el archivo `nginx.conf`
3. Si ves 404, verifica que la carpeta `dist/` se esté copiando correctamente
4. Intenta construir la imagen localmente primero:

```bash
docker build -t test-image .
docker run -p 80:80 test-image
```

### Problema: Hot reload no funciona con docker-compose

**Causa:** Los volúmenes no están montados correctamente.

**Solución:**

1. Verifica que en `docker-compose.yml` tengas:

```yaml
volumes:
  - .:/app
  - /app/node_modules
```

2. El primer volumen monta tu código local
3. El segundo volumen evita sobrescribir node_modules del contenedor
4. Detén y reinicia:

```bash
pnpm docker:down
pnpm docker:dev
```

### Problema: "No space left on device" al construir imagen Docker

**Causa:** Docker ha llenado el disco con imágenes y capas antiguas.

**Solución:**

```bash
# Limpiar imágenes no usadas
docker image prune -a

# Limpiar contenedores detenidos
docker container prune

# Limpiar todo (cuidado, esto elimina todo no usado)
docker system prune -a
```

---

## 📞 Recursos de Ayuda

### Documentación Oficial

- **Docker:** [docs.docker.com](https://docs.docker.com/)
- **Docker Hub:** [docs.docker.com/docker-hub/](https://docs.docker.com/docker-hub/)
- **GitHub Actions:** [docs.github.com/en/actions](https://docs.github.com/en/actions)
- **pnpm:** [pnpm.io](https://pnpm.io/)
- **Vite:** [vitejs.dev](https://vitejs.dev/)
- **React:** [react.dev](https://react.dev/)

### Comunidades

- **Stack Overflow:** [stackoverflow.com](https://stackoverflow.com/) (tag: docker, github-actions)
- **Docker Community Forums:** [forums.docker.com](https://forums.docker.com/)
- **GitHub Community:** [github.community](https://github.community/)

---

## 🎓 Consejos para Principiantes

1. **Empieza pequeño:** No intentes configurar todo de golpe. Hazlo paso a paso.
2. **Verifica cada paso:** Antes de pasar al siguiente, asegúrate de que el actual funcione.
3. **Lee los mensajes de error:** Los errores suelen decir exactamente qué está mal.
4. **Usa los logs:** Cuando algo falla, los logs son tu mejor amigo.
5. **Haz backup:** Antes de hacer cambios grandes, haz commit de tu trabajo.
6. **Pregunta:** Si estás atascado, busca en Google o Stack Overflow.
7. **Documenta:** Anota lo que aprendes para no olvidarlo.

---

## ✅ ¡Felicidades!

Si has seguido todos los pasos, ahora tienes:

- ✅ Una aplicación React funcionando localmente
- ✅ Configuración de Docker para desarrollo y producción
- ✅ Imágenes de Docker subidas a Docker Hub
- ✅ CI/CD automatizado con GitHub Actions
- ✅ Flujo de trabajo completo para desarrollo y producción

**¡Estás listo para desarrollar y desplegar tu aplicación!** 🚀
