# verify-kubernetes
Getting a Verify hub &amp; stubs running on Kubernetes 

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
    
   
    

