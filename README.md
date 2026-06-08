# 🚀 React + TypeScript + Vite Starter

A modern, production-ready React starter template with TypeScript, Vite, and best-in-class development tools configured for professional development.

## ✨ Features

- ⚡️ **Vite 8** - Ultra-fast build tool with HMR
- ⚛️ **React 19** - Latest React with React Compiler
- 📘 **TypeScript 6** - Strict type checking with modern features
- 🧪 **Vitest** - Fast unit testing framework
- 🎭 **Playwright** - E2E testing framework
- 📏 **ESLint 10** - Modern flat config with React & TypeScript rules
- 🎨 **Prettier** - Code formatting with consistent style
- 🔍 **Path Aliases** - Clean imports with `@/` aliases
- 🪝 **Lefthook** - Git hooks for code quality
- 📝 **Commitizen** - Interactive conventional commits
- 🚦 **Commitlint** - Commit message validation
- ✅ **Lint-staged** - Run linters on staged files only

## 🚀 Quick Start

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

## 📘 Beginner Setup Guide

New to Docker, GitHub Actions, or CI/CD? Check out our detailed step-by-step setup guide:

👉 **[Complete Setup Guide for Beginners](./SETUP_GUIDE.md)**

This guide includes:

- Detailed prerequisites and installation instructions
- Step-by-step Docker Hub configuration
- GitHub Secrets setup with screenshots
- Complete workflow explanations for development and production
- Troubleshooting common issues
- Best practices for each environment

## 🎨 Using as Template

Want to use this project as a template for your own projects?

👉 **[Template Customization Guide](./TEMPLATE_CUSTOMIZATION.md)**

This guide explains:

- All files you need to modify when using this as a template
- Step-by-step instructions for each configuration file
- What to change in package.json, Docker, GitHub Actions, and more
- Complete checklist to ensure nothing is missed
- Optional automation script for bulk replacements

## 📚 Documentation

For comprehensive documentation, including:

- Detailed configuration explanations
- Complete usage guide
- Workflow examples
- Best practices
- Troubleshooting

👉 **[See Complete Documentation](./DOCUMENTATION.md)**

## 📋 Available Scripts

| Command             | Description                        |
| ------------------- | ---------------------------------- |
| `pnpm dev`          | Start development server           |
| `pnpm build`        | Build for production               |
| `pnpm preview`      | Preview production build           |
| `pnpm lint`         | Run ESLint                         |
| `pnpm test`         | Run unit tests in watch mode       |
| `pnpm test:ui`      | Run tests with UI                  |
| `pnpm test:e2e`     | Run E2E tests                      |
| `pnpm coverage`     | Generate coverage report           |
| `pnpm commit`       | Interactive commit with Commitizen |
| `pnpm docker:build` | Build Docker image                 |
| `pnpm docker:dev`   | Start Docker Compose development   |
| `pnpm docker:prod`  | Build and run Docker production    |
| `pnpm docker:down`  | Stop Docker Compose containers     |

## 🛠️ Tech Stack

- **React 19.2.6** - UI library
- **TypeScript 6.0.2** - Type safety
- **Vite 8.0.12** - Build tool
- **Vitest 4.1.8** - Unit testing
- **Playwright 1.60.0** - E2E testing
- **ESLint 10.4.1** - Linting
- **Prettier 3.8.3** - Formatting
- **pnpm** - Package manager

## 🐳 Docker

This project includes Docker configuration for both development and production environments.

### Development with Docker Compose

```bash
# Start development server with hot reload
pnpm docker:dev

# Or using docker-compose directly
docker-compose up

# Stop containers
pnpm docker:down
# Or
docker-compose down
```

The development environment:

- Runs Vite dev server on port 5173
- Supports hot module replacement
- Mounts source code for live updates

### Production Build with Docker

```bash
# Build production image
pnpm docker:build

# Build and run production container
pnpm docker:prod

# Or build manually with build arguments
docker build --target prod -t react-starter-pnpm:prod --build-arg VITE_API_URL=https://api.example.com .
docker run -p 80:80 react-starter-pnpm:prod
```

The production environment:

- Uses multi-stage build for optimization
- Serves static files with Nginx
- Includes SPA routing support
- Exposes port 80

### Docker Configuration Files

- **Dockerfile**: Multi-stage build configuration
- **docker-compose.yml**: Development environment setup
- **nginx.conf**: Nginx configuration for production
- **.dockerignore**: Files excluded from Docker build
- **.env.example**: Environment variables template

## 🔄 CI/CD with GitHub Actions

This project includes automated CI/CD pipelines using GitHub Actions.

### Workflows

- **CI/CD Pipeline**: Runs on push to main/develop branches and on PRs
  - Linting with ESLint
  - Type checking with TypeScript
  - Unit testing with Vitest
  - Coverage reporting
  - Application build
  - Docker image build and push (main branch only)
  - Deployment (main branch only, requires configuration)

- **PR Check**: Lightweight workflow for pull requests
  - Linting, type checking, testing, and build

### Setup

1. **Configure Secrets** in your GitHub repository settings:
   - `DOCKER_USERNAME`: Your Docker Hub username
   - `DOCKER_PASSWORD`: Your Docker Hub password or access token
   - `VITE_API_URL`: API URL for production builds (optional)
   - `CODECOV_TOKEN`: Codecov token for coverage reports (optional)

2. **Customize Deployment** in `.github/workflows/ci-cd.yml`:
   - Edit the `deploy` job to add your deployment logic
   - Supports Kubernetes, AWS ECS, Google Cloud Run, etc.

### Documentation

See [`.github/workflows/README.md`](.github/workflows/README.md) for detailed documentation on:

- Workflow configuration
- Secret setup
- Customization options
- Local testing with `act`
- Troubleshooting

## 📁 Project Structure

```
src/
├── components/     # React components
├── hooks/          # Custom hooks
├── utils/          # Utility functions
├── types/          # TypeScript types
├── assets/         # Static assets
└── *.test.tsx      # Component tests
```

## 🎯 Path Aliases

```typescript
import { Button } from '@components/Button';
import { useAuth } from '@hooks/useAuth';
import { formatDate } from '@utils/formatDate';
import type { User } from '@types/user';
```

## 🧪 Testing

```bash
# Unit tests
pnpm test              # Watch mode
pnpm test --run        # Single run
pnpm test:ui           # UI mode
pnpm coverage          # Coverage report

# E2E tests
pnpm test:e2e          # Run E2E tests
pnpm test:e2e:ui       # UI mode
```

## 📝 Git Workflow

This project uses conventional commits with automated validation:

```bash
# Use interactive commit wizard
pnpm commit

# Or commit directly with conventional format
git commit -m "feat: add new feature"
```

Pre-commit hooks automatically run linters on staged files.

## 🔧 Configuration

- **TypeScript**: `tsconfig.json`
- **Vite**: `vite.config.ts`
- **ESLint**: `eslint.config.js`
- **Prettier**: `.prettierrc.json`
- **Vitest**: `vitest.config.ts`
- **Git Hooks**: `lefthook.yml`

## 📖 React Compiler

The React Compiler is enabled to automatically optimize your React components. See [React Compiler documentation](https://react.dev/learn/react-compiler) for more information.

## 🤝 Contributing

1. Create a feature branch
2. Make your changes
3. Write tests
4. Run `pnpm lint` and `pnpm test`
5. Commit with `pnpm commit`
6. Push and create a PR

## 📄 License

MIT
