#create the chapter07-ns namespace
kubectl create namespace chapter07-ns

#creating the blue version of the service
kubectl apply -f blue-service.yaml
# service.serving.knative.dev/helloworld created

#Get the name of the revision created
kn revision list -n chapter07-ns
# NAME               SERVICE      TRAFFIC   TAGS   GENERATION   AGE   CONDITIONS   READY   REASON
# helloworld-00001   helloworld   100%             1            60s   4 OK / 4     True    

#create a route to point to the blue service created above
kubectl apply -f route.yaml

#verify the route was created
kubectl get routes -A
# NAMESPACE      NAME              URL                                                             READY   REASON
# chapter07-ns   bluegreen-route   http://bluegreen-route.chapter07-ns.myapp.20.92.172.55.nip.io   True    
# chapter07-ns   helloworld        https://helloworld.chapter07-ns.myapp.20.92.172.55.nip.io       True    

#verify the blue service has been deployed and working
curl http://bluegreen-route.chapter07-ns.myapp.20.92.172.55.nip.io
# Hello blue!

#update the blue service to green service and deploy the green service 
kubectl apply -f green-service.yaml

#find the name of the second revision
kn revision list -n chapter07-ns
NAME               SERVICE      TRAFFIC   TAGS   GENERATION   AGE     CONDITIONS   READY   REASON
helloworld-00002   helloworld   100%             2            26s     4 OK / 4     True    
helloworld-00001   helloworld                    1            7m55s   3 OK / 4     True    

#create a new route to the green version
kubectl apply -f bluegreen-route.yaml

#get the green route created - this is version 2
kubectl get route bluegreen-route --output jsonpath="{.status.traffic[*].url}" -n chapter07-ns
#http://v2-bluegreen-route.chapter07-ns.myapp.20.92.172.55.nip.io%   

#check the green version using the route above
curl http://v2-bluegreen-route.chapter07-ns.myapp.20.92.172.55.nip.io
# Hello green!

#The green version is working great ... switch to green version by updating route
kubectl apply -f green-route.yaml

#visit the url of the blue service created earlier to verfy switch over to green
curl http://bluegreen-route.chapter07-ns.myapp.20.92.172.55.nip.io
# Hello green!