# Trade Bot Simulator

This project is a trade bot simulation environment. It uses Kafka for storage and streaming of timeseries trading data, and provides a microservice runtime that can dynamically load API endpoint plugins via Java's ServiceLoader.

## Features

- Simulate trading bots with timeseries data persistence to Kafka.
- Microservice runtime exposing REST APIs.
- API can be extended with plugins using ServiceLoader.
- Local deployment using Docker Compose.
- Utility scripts for managing related repositories.

## Requirements

- Docker & Docker Compose / podman also works
- Java 21 or higher (for development and plugins)
- Gradle (for building plugins)
- Bash and `yq` (for repository management scripts)
- SSH access for private repositories

## Repository Management Scripts

The following scripts are provided to help manage multiple related git repositories in this project. Each script expects a `repos.yaml` file listing the repositories.

## Setup

1. Configure repositories in `repos.yaml`:
2. Clone repos `clone.bash`
3. Docker start `docker compose up`

```yaml
  repos:
  - name: repo-name    # Local directory name
  url: git@...       # Git repository URL
  branch: main      # Default branch (optional)
```

## Scripts

### clone.bash

Clones all repositories from `repos.yaml`:

```bash
./clone.bash
```

- Skips existing repositories
- Uses colored output for better visibility

### meta.bash

Executes commands in all repositories:

```bash
./meta.bash <command>
```

Provides shortcuts for common multi-repo operations on top of `meta.bash`.

**Options:**
- `-u`, `--update`: Pushes all submodules, pulls all repositories, then pushes all repositories.
- `-h`, `--help`: Displays help information.

## Useful URLs

- Kafka UI: [http://localhost:7000](http://localhost:7000)
- Schema Registry: [http://localhost:7002](http://localhost:7002)
- Microservice API: [http://localhost:6001](http://localhost:6001) (configurable)
