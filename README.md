# verify-kubernetes
Getting a Verify hub &amp; stubs running on Kubernetes 

## available deployments

| deployment          | status                                          |
| ------------------- | ----------------------------------------------- |
| stub-idp & database | tested successfully with a local [external] hub |
| frontend            | app starts but needs a hub running              |
| test-rp-msa         | won't start due to config file                  |
| test-rp             | won't start due to config file                  |
| config              | won't start due to missing federation config files |
| saml-soap-proxy     | won't start due to config file                  |
| saml-proxy          | won't start due to config file                  |
| saml-engine         | won't start due to config file                  |
| policy              | won't start due to config file                  |
| stub-event-sink     | starts                                          |

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

## useful links

* [the frontend cookies page](http://192.168.99.100:30020/cookies)
    
## possible issues

* private keys are stored in environment variables
* is there a better way of getting the environment variables into the pods? i.e. from verify-local-startup?
* currently this uses a postgres in a pod as a backing store for stub-idp instead of an external backing store
* possible issues with infinispan when rolling out new versions of apps that use that as a distributed store?

## ports exposed by the cluster

| port  | service |
| ----- | ------- |
| 30010 | stub-idp |
| 30020 | frontend |
| 30030 | test-rp-msa |
| 30040 | test-rp |
| 30050 | stub-event-sink |
| 30060 | config |
| 30070 | policy |
| 30080 | saml-proxy |
| 30090 | saml-soap-proxy |
| 30100 | saml-engine |
