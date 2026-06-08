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

## Setting up Secrets

1. Go to your GitHub repository
2. Navigate to `Settings` > `Secrets and variables` > `Actions`
3. Click `New repository secret`
4. Add each secret with its corresponding value

### Docker Hub Access Token (Recommended)

Instead of using your Docker password, create an access token:

1. Log in to [Docker Hub](https://hub.docker.com/)
2. Go to `Account Settings` > `Security`
3. Click `New Access Token`
4. Give it a descriptive name (e.g., `github-actions`)
5. Copy the generated token
6. Use this token as `DOCKER_PASSWORD` secret

## Workflow Triggers

### CI/CD Pipeline:

- **Push to main/develop**: Runs full pipeline including Docker build and deploy
- **Pull requests to main/develop**: Runs CI checks only (no Docker build or deploy)

### PR Check:

- **Pull requests**: Runs quick checks for fast feedback

## Customization

### Changing Node Version:

Edit the `NODE_VERSION` environment variable in the workflow files:

```yaml
env:
  NODE_VERSION: '20' # Change to your desired version
```

### Changing pnpm Version:

Edit the `PNPM_VERSION` environment variable:

```yaml
env:
  PNPM_VERSION: '10' # Change to your desired version
```

### Modifying Deployment:

Edit the `deploy` job in `ci-cd.yml` to add your specific deployment logic:

```yaml
- name: Deploy to cloud provider
  run: |
    # Add your deployment commands
    # Example for Kubernetes:
    kubectl apply -f k8s/
    # Example for Google Cloud Run:
    gcloud run deploy --image gcr.io/PROJECT-ID/IMAGE-NAME
```

### Disabling Deployment:

To disable automatic deployment, comment out or remove the `deploy` job from `ci-cd.yml`.

## Local Testing

To test workflows locally before pushing:

1. Install [act](https://github.com/nektos/act):

```bash
brew install act  # macOS
# or
choco install act  # Windows
# or
curl https://raw.githubusercontent.com/nektos/act/master/install.sh | sudo bash
```

2. Run the workflow locally:

```bash
act -j pr-check  # Run PR check workflow
act -j ci        # Run CI job
```

## Monitoring

View workflow runs in the `Actions` tab of your GitHub repository. Each run shows:

- Job status (success/failure)
- Logs for each step
- Artifacts (build outputs, coverage reports)
- Execution time

## Troubleshooting

### Docker Build Fails:

- Check that `DOCKER_USERNAME` and `DOCKER_PASSWORD` secrets are set correctly
- Ensure your Docker Hub repository exists
- Verify that the image name in the workflow matches your Docker Hub repository

### Tests Fail:

- Run tests locally: `pnpm test --run`
- Check test logs in the Actions tab
- Ensure all dependencies are installed correctly

### Type Check Fails:

- Run type check locally: `pnpm tsc --noEmit`
- Fix any TypeScript errors before pushing

### Coverage Upload Fails:

- Ensure `CODECOV_TOKEN` is set if your repository is private
- Check that coverage files are generated correctly

## Best Practices

1. **Always run PR checks** before merging to ensure code quality
2. **Keep workflows fast** by splitting heavy operations into separate jobs
3. **Use caching** to speed up dependency installation and Docker builds
4. **Monitor workflow execution time** and optimize slow steps
5. **Keep secrets secure** and never commit them to the repository
6. **Test locally** with `act` before pushing changes to workflows
