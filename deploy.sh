#docker build -t lwolfmayr/multi-client:latest -t lwolfmayr/multi-client:$SHA -f ./client/Dockerfile ./client
#docker build -t lwolfmayr/multi-server:latest -t lwolfmayr/multi-server:$SHA -f ./server/Dockerfile ./server
#docker build -t lwolfmayr/multi-worker:latest -t lwolfmayr/multi-worker:$SHA -f ./worker/Dockerfile ./worker

#docker push lwolfmayr/multi-client:latest
#docker push lwolfmayr/multi-server:latest
#docker push lwolfmayr/multi-worker:latest

#docker push lwolfmayr/multi-client:$SHA
#docker push lwolfmayr/multi-server:$SHA
#docker push lwolfmayr/multi-worker:$SHA

# apply stephengrider for testing
kubectl apply -f k8s
kubectl set image deployments/server-deployment server=stephengrider/multi-server:latest
kubectl set image deployments/client-deployment client=stephengrider/multi-client:latest
kubectl set image deployments/worker-deployment worker=stephengrider/multi-worker:latest