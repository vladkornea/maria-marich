sudo docker ps
sudo docker container stop maria-marich
sudo docker container rm --volumes maria-marich

sudo docker build --tag=maria-marich .
sudo docker container create --publish=target=80,published=127.0.0.1:8080,protocol=tcp \
  --volume=$PWD/src/docroots:/our/sites/maria-marich/docroots --name=maria-marich maria-marich
sudo docker container start maria-marich

sudo docker image prune --force --all
sudo docker ps
sudo docker container logs --follow maria-marich
