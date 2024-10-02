## Running the Application with Docker

To run the LoveApp REST API using Docker, follow these steps:

1. **Pull the Docker Image**  
   Use the following command to pull the Docker image from GitHub Container Registry:

   ```bash
   docker pull ghcr.io/whaleopop/loveapp:docker-db
   ```

2. **List Available Docker Images**  
   After pulling the image, you can verify that it's downloaded by listing your Docker images:

   ```bash
   docker images
   ```

   Look for the `IMAGE ID` of the `ghcr.io/whaleopop/loveapp:docker-db` image.

3. **Run the Docker Container**  
   Use the `docker run` command to start a container from the image. Replace `{IMAGE ID}` with the actual image ID you noted in the previous step:

   ```bash
   docker run -d -p 8080:8000 {IMAGE ID}
   ```

   This command will run the container in detached mode (`-d`) and map port `8000` in the container to port `8080` on your host machine.

4. **Access the Application**  
   Once the container is running, you can access the LoveApp REST API at `http://localhost:8080`.
