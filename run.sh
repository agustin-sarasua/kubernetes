cat pod.yaml

kubectl create -f pod.yaml

kubectl get pod demo-golang

kubectl logs --tail=3 demo-golang

kubectl delete pod demo-golang

# PODS do not have any notion of persistence, if they die nothing in the framework will recreate them.
# Thats where replicaset cames in

cat replicaset.yaml

kubectl create -f replicaset.yaml

kubectl get replicaset demo-golang

kubectl get pods

kubectl scale --replicas=4 replicaset/demo-golang

kubectl scale --replicas=2 replicaset/demo-golang

# If you delete 1 pod, it will recreate an other to match de desired number for the replicaset
kubectl delete pod demo-golang-ph5n8
# You will still have 2
kubectl get pods

kubectl delete replicaset demo-golang

# The limitation of the replicaset is that you can not change the pod template.
# This is where the Deployment cames in, they have a notion of app life cycle

kubectl create -f deployment.yaml

kubectl get deployments

# The env variable is to show how you can change the image
# You can see the replicasets that the deployment creates
kubectl get replicasets
# You can see the pods that the replicaset created
kubectl get pods

kubectl logs --tail=3 demo-golang-77c49fb67b-qgxz4

# You can run a "kubectl apply -f" to change the version from v1 to v2

kubectl get replicasets

# You will now have 2 replicasets
# If something goes wrong you can run to get back to v2
kubectl rollout undo deployment/demo

