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

## 📚 Documentation

For comprehensive documentation, including:

- Detailed configuration explanations
- Complete usage guide
- Workflow examples
- Best practices
- Troubleshooting

👉 **[See Complete Documentation](./DOCUMENTATION.md)**

## 📋 Available Scripts

| Command         | Description                        |
| --------------- | ---------------------------------- |
| `pnpm dev`      | Start development server           |
| `pnpm build`    | Build for production               |
| `pnpm preview`  | Preview production build           |
| `pnpm lint`     | Run ESLint                         |
| `pnpm test`     | Run unit tests in watch mode       |
| `pnpm test:ui`  | Run tests with UI                  |
| `pnpm test:e2e` | Run E2E tests                      |
| `pnpm coverage` | Generate coverage report           |
| `pnpm commit`   | Interactive commit with Commitizen |

## 🛠️ Tech Stack

- **React 19.2.6** - UI library
- **TypeScript 6.0.2** - Type safety
- **Vite 8.0.12** - Build tool
- **Vitest 4.1.8** - Unit testing
- **Playwright 1.60.0** - E2E testing
- **ESLint 10.4.1** - Linting
- **Prettier 3.8.3** - Formatting
- **pnpm** - Package manager

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
