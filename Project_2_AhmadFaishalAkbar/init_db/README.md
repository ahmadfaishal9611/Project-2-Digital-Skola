## No.2

To run it :
1. build the postgres image
```
docker build -t {postgres_image_name} -f Dockerfile.postgres .
```
2. run postgres container
if you want to check the result on local (uncomment first the EXPOSE command on dockerfile postgres)
```
docker run -d -p <port_host>:5432 --name {postgres_container_name} {postgres_image_name} # use another port host if port 5432 is used by another app (check using 'netstat -ano' in cmd), and if you wanna check the result using  dbeaver connect to the port_host
```