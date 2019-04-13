# dst-builder

## Build a Server

1. Clone the repository
2. Add your cluster token to the cluster_token.txt file
3. Execute a docker build, filling in the server name with whatever you want: 

    `docker build . --build-arg cluster_name=<server name> -t <tag name>`

4. Run the image: `docker run -it -p 10999:10999 -t <tag name>`


