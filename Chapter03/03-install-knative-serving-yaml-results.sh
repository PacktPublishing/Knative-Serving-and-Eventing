❯ kubectl apply -f https://github.com/knative/serving/releases/download/knative-v1.6.0/serving-crds.yaml
customresourcedefinition.apiextensions.k8s.io/certificates.networking.internal.knative.dev created
customresourcedefinition.apiextensions.k8s.io/configurations.serving.knative.dev created
customresourcedefinition.apiextensions.k8s.io/clusterdomainclaims.networking.internal.knative.dev created
customresourcedefinition.apiextensions.k8s.io/domainmappings.serving.knative.dev created
customresourcedefinition.apiextensions.k8s.io/ingresses.networking.internal.knative.dev created
customresourcedefinition.apiextensions.k8s.io/metrics.autoscaling.internal.knative.dev created
customresourcedefinition.apiextensions.k8s.io/podautoscalers.autoscaling.internal.knative.dev created
customresourcedefinition.apiextensions.k8s.io/revisions.serving.knative.dev created
customresourcedefinition.apiextensions.k8s.io/routes.serving.knative.dev created
customresourcedefinition.apiextensions.k8s.io/serverlessservices.networking.internal.knative.dev created
customresourcedefinition.apiextensions.k8s.io/services.serving.knative.dev created
customresourcedefinition.apiextensions.k8s.io/images.caching.internal.knative.dev created


===========================================================================================================================================

❯ kubectl wait --for=condition=Established --all crd
customresourcedefinition.apiextensions.k8s.io/certificates.networking.internal.knative.dev condition met
customresourcedefinition.apiextensions.k8s.io/clusterdomainclaims.networking.internal.knative.dev condition met
customresourcedefinition.apiextensions.k8s.io/configurations.serving.knative.dev condition met
customresourcedefinition.apiextensions.k8s.io/domainmappings.serving.knative.dev condition met
customresourcedefinition.apiextensions.k8s.io/images.caching.internal.knative.dev condition met
customresourcedefinition.apiextensions.k8s.io/ingresses.networking.internal.knative.dev condition met
customresourcedefinition.apiextensions.k8s.io/metrics.autoscaling.internal.knative.dev condition met
customresourcedefinition.apiextensions.k8s.io/podautoscalers.autoscaling.internal.knative.dev condition met
customresourcedefinition.apiextensions.k8s.io/revisions.serving.knative.dev condition met
customresourcedefinition.apiextensions.k8s.io/routes.serving.knative.dev condition met
customresourcedefinition.apiextensions.k8s.io/serverlessservices.networking.internal.knative.dev condition met
customresourcedefinition.apiextensions.k8s.io/services.serving.knative.dev condition met
customresourcedefinition.apiextensions.k8s.io/volumesnapshotclasses.snapshot.storage.k8s.io condition met
customresourcedefinition.apiextensions.k8s.io/volumesnapshotcontents.snapshot.storage.k8s.io condition met
customresourcedefinition.apiextensions.k8s.io/volumesnapshots.snapshot.storage.k8s.io condition met

===========================================================================================================================================

❯ kubectl apply -f https://github.com/knative/serving/releases/download/knative-v1.0.0/serving-core.yaml
namespace/knative-serving created
clusterrole.rbac.authorization.k8s.io/knative-serving-aggregated-addressable-resolver created
clusterrole.rbac.authorization.k8s.io/knative-serving-addressable-resolver created
clusterrole.rbac.authorization.k8s.io/knative-serving-namespaced-admin created
clusterrole.rbac.authorization.k8s.io/knative-serving-namespaced-edit created
clusterrole.rbac.authorization.k8s.io/knative-serving-namespaced-view created
clusterrole.rbac.authorization.k8s.io/knative-serving-core created
clusterrole.rbac.authorization.k8s.io/knative-serving-podspecable-binding created
serviceaccount/controller created
clusterrole.rbac.authorization.k8s.io/knative-serving-admin created
clusterrolebinding.rbac.authorization.k8s.io/knative-serving-controller-admin created
clusterrolebinding.rbac.authorization.k8s.io/knative-serving-controller-addressable-resolver created
customresourcedefinition.apiextensions.k8s.io/images.caching.internal.knative.dev unchanged
customresourcedefinition.apiextensions.k8s.io/certificates.networking.internal.knative.dev unchanged
customresourcedefinition.apiextensions.k8s.io/configurations.serving.knative.dev unchanged
customresourcedefinition.apiextensions.k8s.io/clusterdomainclaims.networking.internal.knative.dev unchanged
customresourcedefinition.apiextensions.k8s.io/domainmappings.serving.knative.dev unchanged
customresourcedefinition.apiextensions.k8s.io/ingresses.networking.internal.knative.dev unchanged
customresourcedefinition.apiextensions.k8s.io/metrics.autoscaling.internal.knative.dev unchanged
customresourcedefinition.apiextensions.k8s.io/podautoscalers.autoscaling.internal.knative.dev unchanged
customresourcedefinition.apiextensions.k8s.io/revisions.serving.knative.dev unchanged
customresourcedefinition.apiextensions.k8s.io/routes.serving.knative.dev unchanged
customresourcedefinition.apiextensions.k8s.io/serverlessservices.networking.internal.knative.dev unchanged
customresourcedefinition.apiextensions.k8s.io/services.serving.knative.dev unchanged
image.caching.internal.knative.dev/queue-proxy created
configmap/config-autoscaler created
configmap/config-defaults created
configmap/config-deployment created
configmap/config-domain created
configmap/config-features created
configmap/config-gc created
configmap/config-leader-election created
configmap/config-logging created
configmap/config-network created
configmap/config-observability created
configmap/config-tracing created
horizontalpodautoscaler.autoscaling/activator created
Warning: policy/v1beta1 PodDisruptionBudget is deprecated in v1.21+, unavailable in v1.25+; use policy/v1 PodDisruptionBudget
poddisruptionbudget.policy/activator-pdb created
deployment.apps/activator created
service/activator-service created
deployment.apps/autoscaler created
service/autoscaler created
deployment.apps/controller created
service/controller created
deployment.apps/domain-mapping created
deployment.apps/domainmapping-webhook created
service/domainmapping-webhook created
horizontalpodautoscaler.autoscaling/webhook created
poddisruptionbudget.policy/webhook-pdb created
deployment.apps/webhook created
service/webhook created
validatingwebhookconfiguration.admissionregistration.k8s.io/config.webhook.serving.knative.dev created
mutatingwebhookconfiguration.admissionregistration.k8s.io/webhook.serving.knative.dev created
mutatingwebhookconfiguration.admissionregistration.k8s.io/webhook.domainmapping.serving.knative.dev created
secret/domainmapping-webhook-certs created
validatingwebhookconfiguration.admissionregistration.k8s.io/validation.webhook.domainmapping.serving.knative.dev created
validatingwebhookconfiguration.admissionregistration.k8s.io/validation.webhook.serving.knative.dev created
secret/webhook-certs created

===========================================================================================================================================

❯ kubectl wait pod --timeout=-1s --for=condition=Ready -l '!job-name' -n knative-serving
pod/activator-68b7698d74-65ffn condition met
pod/autoscaler-6c8884d6ff-kcx5t condition met
pod/controller-76cf997d95-zg2km condition met
pod/domain-mapping-57fdbf97b-mx2b8 condition met
pod/domainmapping-webhook-66c5f7d596-q9cpm condition met
pod/webhook-7df8fd847b-6lhp7 condition met

===========================================================================================================================================

kubectl apply -f https://github.com/knative/net-kourier/releases/download/knative-v1.0.0/kourier.yaml
namespace/kourier-system created
configmap/kourier-bootstrap created
configmap/config-kourier created
serviceaccount/net-kourier created
clusterrole.rbac.authorization.k8s.io/net-kourier created
clusterrolebinding.rbac.authorization.k8s.io/net-kourier created
deployment.apps/net-kourier-controller created
service/net-kourier-controller created
deployment.apps/3scale-kourier-gateway created
service/kourier created
service/kourier-internal created

===========================================================================================================================================

kubectl wait pod --timeout=-1s --for=condition=Ready -l '!job-name' -n kourier-system
pod/3scale-kourier-gateway-77849dcc96-7ssgc condition met


===========================================================================================================================================

kubectl wait pod --timeout=-1s --for=condition=Ready -l '!job-name' -n knative-serving
pod/activator-68b7698d74-65ffn condition met
pod/autoscaler-6c8884d6ff-kcx5t condition met
pod/controller-76cf997d95-zg2km condition met
pod/domain-mapping-57fdbf97b-mx2b8 condition met
pod/domainmapping-webhook-66c5f7d596-q9cpm condition met
pod/net-kourier-controller-6f68cbb74f-bgfct condition met
pod/webhook-7df8fd847b-6lhp7 condition met

===========================================================================================================================================

kubectl apply -f https://github.com/knative/net-kourier/releases/download/knative-v1.0.0/kourier.yaml
namespace/kourier-system created
configmap/kourier-bootstrap created
configmap/config-kourier created
serviceaccount/net-kourier created
clusterrole.rbac.authorization.k8s.io/net-kourier created
clusterrolebinding.rbac.authorization.k8s.io/net-kourier created
deployment.apps/net-kourier-controller created
service/net-kourier-controller created
deployment.apps/3scale-kourier-gateway created
service/kourier created
service/kourier-internal created

===========================================================================================================================================

kubectl wait pod --timeout=-1s --for=condition=Ready -l '!job-name' -n kourier-system
pod/3scale-kourier-gateway-77849dcc96-7ssgc condition met

===========================================================================================================================================

kubectl wait pod --timeout=-1s --for=condition=Ready -l '!job-name' -n knative-serving
pod/activator-68b7698d74-65ffn condition met
pod/autoscaler-6c8884d6ff-kcx5t condition met
pod/controller-76cf997d95-zg2km condition met
pod/domain-mapping-57fdbf97b-mx2b8 condition met
pod/domainmapping-webhook-66c5f7d596-q9cpm condition met
pod/net-kourier-controller-6f68cbb74f-bgfct condition met
pod/webhook-7df8fd847b-6lhp7 condition met

===========================================================================================================================================

 kubectl patch configmap/config-network \
>   --namespace knative-serving \
>   --type merge \
>   --patch '{"data":{"ingress.class":"kourier.ingress.networking.knative.dev"}}'
configmap/config-network patched

===========================================================================================================================================

 kubectl --namespace kourier-system get service kourier
NAME      TYPE           CLUSTER-IP     EXTERNAL-IP    PORT(S)                      AGE
kourier   LoadBalancer   10.0.149.247   20.92.208.41   80:30881/TCP,443:30502/TCP   3m57s

===========================================================================================================================================

kubectl patch configmap/config-domain \
>   --namespace knative-serving \
>   --type merge \
>   --patch '{"data":{"myapp.20.92.208.41.nip.io":""}}'
configmap/config-domain patched

===========================================================================================================================================

kubectl describe configmap/config-domain -n knative-serving
Name:         config-domain
Namespace:    knative-serving
Labels:       app.kubernetes.io/part-of=knative-serving
              app.kubernetes.io/version=1.0.0
              serving.knative.dev/release=v1.0.0
Annotations:  knative.dev/example-checksum: 81552d0b

Data
====
_example:
----
# Routes having the cluster domain suffix (by default 'svc.cluster.local')
# will not be exposed through Ingress. You can define your own label
# selector to assign that domain suffix to your Route here, or you can set
# the label
#    "networking.knative.dev/visibility=cluster-local"
# to achieve the same effect.  This shows how to make routes having
# the label app=secret only exposed to the local cluster.
svc.cluster.local: |
  selector:
    app: secret

myapp.20.92.208.41.nip.io:
----


BinaryData
====

Events:  <none>

===========================================================================================================================================

kubectl apply -f https://github.com/knative/net-http01/releases/download/knative-v1.6.0/release.yaml
deployment.apps/net-http01-controller created
service/net-http01-controller created

===========================================================================================================================================

kubectl patch configmap/config-network \
>     --namespace knative-serving \
>     --type merge \
>     --patch '{"data":{"certificate-class":"net-http01.certificate.networking.knative.dev"}}'
configmap/config-network patched

===========================================================================================================================================

kubectl patch configmap/config-network \
>     --namespace knative-serving \
>     --type merge \
>     --patch '{"data":{"auto-tls":"Enabled"}}'
configmap/config-network patched

===========================================================================================================================================

kubectl create -f hello-service.yaml
service.serving.knative.dev/hello created

===========================================================================================================================================

 kubectl get kservice
NAME    URL                                               LATESTCREATED   LATESTREADY   READY   REASON
hello   https://hello.default.myapp.20.92.208.41.nip.io   hello-world     hello-world   True    

===========================================================================================================================================

 kubectl get service
NAME                                         TYPE           CLUSTER-IP     EXTERNAL-IP                                         PORT(S)                                      AGE
hello                                        ExternalName   <none>         kourier-internal.kourier-system.svc.cluster.local   80/TCP                                       101s
hello-world                                  ClusterIP      10.0.150.103   <none>                                              80/TCP                                       2m10s
hello-world-private                          ClusterIP      10.0.17.63     <none>                                              80/TCP,9090/TCP,9091/TCP,8022/TCP,8012/TCP   2m10s
kubernetes                                   ClusterIP      10.0.0.1       <none>                                              443/TCP                                      3h56m
route-10b1bf27-3fce-47be-8146-f74fb7fcf267   ClusterIP      10.0.171.67    <none>                                              80/TCP                                       101s

===========================================================================================================================================

 kubectl get certificate
NAME                                         READY   REASON
route-10b1bf27-3fce-47be-8146-f74fb7fcf267   True    

===========================================================================================================================================

kubectl get revision
NAME          CONFIG NAME   K8S SERVICE NAME   GENERATION   READY   REASON   ACTUAL REPLICAS   DESIRED REPLICAS
hello-world   hello                            1            True             1                 1

===========================================================================================================================================

❯ kubectl get revisions
NAME          CONFIG NAME   K8S SERVICE NAME   GENERATION   READY   REASON   ACTUAL REPLICAS   DESIRED REPLICAS
hello-world   hello                            1            True             1                 1

===========================================================================================================================================

❯ kubectl get route
NAME    URL                                               READY   REASON
hello   https://hello.default.myapp.20.92.208.41.nip.io   True    

===========================================================================================================================================

curl https://hello.default.myapp.20.92.208.41.nip.io
Hello Knative!

===========================================================================================================================================


