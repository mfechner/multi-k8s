docker build -t idefix6/multi-client:latest -t idefix6/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t idefix6/multi-server:latest -t idefix6/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t idefix6/multi-worker:latest -t idefix6/multi-worker:$SHA -f ./worker/Dockerfile ./worker

docker push idefix6/multi-client:latest
docker push idefix6/multi-server:latest
docker push idefix6/multi-worker:latest

docker push idefix6/multi-client:$SHA
docker push idefix6/multi-server:$SHA
docker push idefix6/multi-worker:$SHA

kubectl apply -f k8s

kubectl set image deployments/client-deployment client=idefix6/multi-client:$SHA
kubectl set image deployments/server-deployment server=idefix6/multi-server:$SHA
kubectl set image deployments/worker-deployment worker=idefix6/multi-worker:$SHA
