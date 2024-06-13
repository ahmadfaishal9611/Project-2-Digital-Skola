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
or if you don't
```
docker run -d --name {postgres_container_name} {postgres_image_name}
```
3. build extractload image
```
docker build -t {extractload_image_name} -f Dockerfile.extractload .
```
4. run extractload container and link it with postgres container
```
docker run -d --name {extractload_container_name} --link {postgres_container_name}:postgres {extractload_image_name}
```
5. build dbt image
```
docker build -t dbt_image -f Dockerfile.dbt .
```
6. run dbt container
```
docker run --name dbt_container --link postgres_container:postgres -v $(pwd)/dbt_project:/app/dbt_project -v $(pwd)/profiles.yml:/root/.dbt/profiles.yml dbt_image

7. check the result in dbeaver in the database target schema that you set in profiles.yml (in this case 'warehouse' schema)