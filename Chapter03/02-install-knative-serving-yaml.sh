#install knative CRD's
kubectl apply -f https://github.com/knative/serving/releases/download/knative-v1.6.0/serving-crds.yaml
kubectl wait --for=condition=Established --all crd

#install knative core
kubectl apply -f https://github.com/knative/serving/releases/download/knative-v1.6.0/serving-core.yaml
kubectl wait pod --timeout=-1s --for=condition=Ready -l '!job-name' -n knative-serving > /dev/null


#install Kourier
kubectl apply -f https://github.com/knative/net-kourier/releases/download/knative-v1.6.0/kourier.yaml
kubectl wait pod --timeout=-1s --for=condition=Ready -l '!job-name' -n kourier-system 
kubectl wait pod --timeout=-1s --for=condition=Ready -l '!job-name' -n knative-serving


#patch the config-network
kubectl patch configmap/config-network \
  --namespace knative-serving \
  --type merge \
  --patch '{"data":{"ingress.class":"kourier.ingress.networking.knative.dev"}}'

#Get the external IP
kubectl --namespace kourier-system get service kourier

#patch the config-domain
kubectl patch configmap/config-domain \
  --namespace knative-serving \
  --type merge \
  --patch '{"data":{"myapp.20.92.172.55.nip.io":""}}'

#review the above changes
kubectl describe configmap/config-domain -n knative-serving

#apply the net-http01 yaml
kubectl apply -f https://github.com/knative/net-http01/releases/download/knative-v1.6.0/release.yaml


kubectl patch configmap/config-network \
    --namespace knative-serving \
    --type merge \
    --patch '{"data":{"certificate-class":"net-http01.certificate.networking.knative.dev"}}'


kubectl patch configmap/config-network \
    --namespace knative-serving \
    --type merge \
    --patch '{"data":{"auto-tls":"Enabled"}}'

#create the knative service
kubectl create -f hello-service.yaml

#The next set of commands review what we created above
kubectl get kservice

kubectl get service

kubectl get certificate

kubectl get revisionx

kubectl get revisions

kubectl get route

# call the endpoint
curl https://hello.default.myapp.20.92.172.55.nip.io

kubectl get pods -n knative-serving
