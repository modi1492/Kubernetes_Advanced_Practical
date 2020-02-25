#!/usr/bin/env bash
kubectl api-versions

kubectl proxy --port=8080
curl localhost:8080/api/v1/namespaces/
curl 172.16.1.240/api/v1/namespaces/

kubectl get namespace kube-system -o yaml
kubectl get deployment myapp -o yaml