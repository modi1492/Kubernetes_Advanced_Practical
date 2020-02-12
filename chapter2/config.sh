#!/usr/bin/env bash
kubectl version --short=true
kubectl cluster-info

kubectl run nginx-deploy --image=nginx:1.12 --replicas=2
kubectl expose deployment.apps/nginx-deploy --name=nginx-svc --port=80
kubectl create -f nginx-deploy.yaml -f nginx-svc.yaml
kubectl  apply -f nginx-deploy.yaml -f nginx-svc.yaml

kubectl get namespaces
kubectl get pods,services -o wide
kubectl get pods -l k8s-app -n kube-system


kubectl get pods -l component=kube-apiserver -o yaml -n kube-system
kubectl describe pods -l component=kube-apiserver -n kube-system
kubectl logs kube-apiserver-master.ilinux.io -n kube-system
kubectl exec kube-apiserver-master.ilinux.io -n kbe-system --ps

kubectl delete services nginx-svc

kubectl delete pods --all -n kube-public


#################################################################2.4
kubectl run myapp --image=ikubernetes/myapp:v1 --port=80 --replicas=1 --dry-run
kubectl run myapp --image=ikubernetes/myapp:v1 --port=80 --replicas=1

kubectl get deployments

kubectl get pods -o wide
curl http://10.244.3.2:80/
POD_NAME=myap*******
kubectl describe pods $POD_NAME
kubectl logs $POD_NAME

DNS_POD=$(kubectl get pods -o name -n kube-system | grep kube-dns)
kubectl logs $DNS_POD -c kubedns -n kube-system

kubectl exec $POD_NAME ps aux

kubectl -it exec $POD_NAME /bin/sh
# 2.4.3
kubectl expose deployments/myapp -type="NodePort" -port=80 -name=myapp service "myapp" exposed

kubectl run client --image=busybox --restart=Never -it -- /bin/sh

kubectl get svc/myapp

kubectl describe services mapp-svc

kubectl scale deployments/myapp --replicas=3

kubectl get pods -l run=myapp

kubectl describe deployments/app

kubectl describe services/myapp

while true; do wget -O - -q http://myapp.default:80/hostname.html; sleep 1; done;

kubectl scale deployments/myapp -replicas=2

kubectl delete service myapp

kubectl delee deployment --all


