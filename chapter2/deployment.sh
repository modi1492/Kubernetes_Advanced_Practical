kubectl run myapp --image=ikubernetes/myapp:v1 --port=80 --replicas=1 --dry-run
kubectl run myapp --image=ikubernetes/myapp:v1 --port=80 --replicas=1
kubectl get deployments
# fail
curl http://10.160.230.134:80/



DNS_POD=$(kubectl get pods -o name -n kube-system | grep kube-dns)
DNS_POD=$(kubectl get pods -o name -n kube-system | grep coredns)
MY_APP=$(kubectl get pods -o name  | grep myapp)
kubectl exec $MY_APP ps aux
kubectl -it exec $MY_APP /bin/sh



kubectl expose deployment.apps/myapp --type="NodePort" --port=80 --name=myapp


kubectl run client --image=busybox --restart=Never -it -- /bin/sh

wget -O - -q http://myapp.default:80

kubectl get svc/myapp

kubectl describe services myapp

kubectl scale deployments/myapp --replicas=3


kubectl describe services/myapp

while true; do wget -O - -q http://myapp.default:80/hostname.html; sleep 1; done

kubectl scale deployments/myapp --replicas=2

kubectl delete deployment --all
kubectl delete deployment --all --cascade=false


# todo
#共享mount uts network linux内核名称空间









