# Laravel Authentication Project

Welcome to the Laravel Authentication Project! This project provides a Laravel application with robust authentication features, designed to streamline user management in your applications. It includes Docker configurations for easy deployment and a GitHub Actions workflow for automating image creation on Docker Hub.

![image](https://github.com/ZeinabAbdelghaffar/Docker/assets/87963230/4913c0cb-4221-4624-bd6e-387184454e13)

## Prerequisites

Before getting started, ensure you have the following prerequisites installed on your machine:

- Docker
- GitHub account for using GitHub Actions

## Getting Started

Follow these simple steps to set up and run the Laravel Authentication Project:

1. **Clone the Repository:**

   ```bash
   git clone https://github.com/ZeinabAbdelghaffar/Docker.git
   ```

2. **Created a GitHub Repo for Authentication in Laravel**

3. **Created a Dockerfile:**

   - This file creates an image for your application (WebServer, Laravel, and your application).

4. **Store the Docker Image:**

   - To store our Docker image, we need to create a new repository on DockerHub.

   ![image](https://github.com/ZeinabAbdelghaffar/Docker/assets/87963230/874b6dc0-2144-4f5b-91d4-fa31745c8f27)

5. **Configure GitHub Repository Secrets:**

   - Configure your repository secrets on GitHub (Settings -> Actions -> New repository secret).

   ![image](https://github.com/ZeinabAbdelghaffar/Docker/assets/87963230/68f17c1b-941b-47a1-9c82-a6fe59ce0bc7)

6. **Create a Workflow File:**

   - Create a workflow file that automates the process of building and pushing the Docker image to Docker Hub.

   ![image](https://github.com/ZeinabAbdelghaffar/Docker/assets/87963230/f9cf3b26-c7be-46b5-8528-93b34f1e0476)

7. **Created a docker-compose.yml:**

   - This file spins up a MySQL database as the authentication backend and your application container.

8. **Build the Docker Image:**

   ```bash
   docker build -t laravel-authentication-app .
   ```

9. **Spin up the Docker Containers:**

   ```bash
   docker-compose up -d
   ```

10. **Initialize the Laravel Project:**

    ```bash
    docker-compose exec app composer install
    docker-compose exec app cp .env.example .env
    docker-compose exec app php artisan key:generate
    docker-compose exec app php artisan storage:link
    docker-compose exec app chmod -R 777 storage bootstrap/cache
    docker-compose exec app npm install
    docker-compose exec app php artisan migrate:fresh --seed
    ```

11. **Access the Application:**

    The application should now be accessible at `http://localhost:8080`.

## GitHub Actions Workflow

The GitHub Actions workflow automates the process of building and pushing the Docker image to Docker Hub. It triggers on pushes to the `main` branch and uses Docker Hub secrets for authentication.

## Docker Hub Repository

The Docker image for this project is automatically built and pushed to the Docker Hub repository `ZeinabAbdelghaffar/laravel-authentication-app` on each push to the `main` branch.
