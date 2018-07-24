# verify-kubernetes
Getting a Verify hub &amp; stubs running on Kubernetes 

## useful commands

1. install minikube
    - minikube sets up a local kubernetes
    - `$ brew cask install minikube`
2. run minikube
    - `$ minikube start` and wait for a few minutes
    - `$ kubectl cluster-info` will show information about the kubernetes cluster 
    - `$ minikube stop` will stop the cluster and keep state
    - `$ minikube delete` will stop the cluster and delete all state
3. see the minikube dashboard
    - `$ minikube dashboard` will open the dashboard in your browser
4. run stub-idp and stub-idp-database
    - `$ kubectl apply -f deployments/stub-idp.yaml`
    - `$ kubectl get pods -l app=stub-idp` will list the running apps
    - `$ kubectl delete -f deployments/stub-idp.yaml` if it goes wrong 
    - `$ kubectl describe services stub-idp-service` will show information about the running Service - note the NodePort that is used to access stub-idp outside kubernetes
    - `$ curl $(minikube ip):30010/service-name` should get the stub-idp service name from one of the apps
    - `$ open $(minikube ip):30010/stub-country/login` will display the something went wrong page

## available deployments

| deployment | status |
| ---------- | ------ |
| stub-idp & database      | tested successfully with a local hub |
| frontend                 | app starts but needs a hub running   |
| matching-service-adapter | won't start due to config file       |

## useful links

* [the frontend cookies page](http://192.168.99.100:30020/cookies)
    

