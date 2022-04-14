#! /bin/sh

docker network create -d overlay backend

# See architecture.png file to understand this up. It is meant to show how apps # can be separated into isolated networks.

docker network create -d overlay frontend

docker service create --name vote -p 45080:80 --network frontend --replicas 2 bretfisher/examplevotingapp_vote
# In SAG network had to use 45080 instead of port 80 since port 80 blocked

docker service create --name redis --network frontend --replicas 2 redis:3.2

docker service create --name worker --network frontend --network backend bretfisher/examplevotingapp_worker

docker service create --name db --network backend -e POSTGRES_HOST_AUTH_METHOD=trust --mount type=volume,source=db-data,target=/var/lib/postgresql/data postgres:9.4

docker service create --name result --network backend -p 5001:80 bretfisher/examplevotingapp_result
