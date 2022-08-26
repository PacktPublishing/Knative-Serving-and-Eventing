#install the operator
kubectl apply -f https://github.com/knative/operator/releases/download/knative-v1.6.1/operator.yaml

#create the serving objects
Kubectl apply -f KnativeServing.yaml

#Get the externalip 
kubectl --namespace knative-serving get service kourier

#Patch the config-domain with the IP obtained previously
kubectl patch configmap/config-domain \
  --namespace knative-serving \
  --type merge \
  --patch '{"data":{"myapp.20.227.21.206.nip.io":""}}'

