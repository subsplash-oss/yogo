# yogo

A simple go container that serves a webpage with an ENV configurable greeting

## Running with Docker Compose

Build and run the application:

```bash
docker-compose up
```

This will:

- Build the Docker image using the official golang image
- Run the container with port 8080 exposed on localhost
- Set the `GREETING` environment variable to "world"

Visit `http://localhost:8080` to see "yo world" displayed.

### Environment Variables

- `GREETING`: Configures the greeting message (defaults to "world" in docker-compose.yml)

### Development

To run in the background:

```bash
docker-compose up -d
```

To stop the application:

```bash
docker-compose down
```
