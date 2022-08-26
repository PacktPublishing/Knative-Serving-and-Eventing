❯ kubectl apply -f https://github.com/knative/operator/releases/download/knative-v1.6.1/operator.yaml
secret/operator-webhook-certs created
deployment.apps/operator-webhook created
service/operator-webhook created
customresourcedefinition.apiextensions.k8s.io/knativeeventings.operator.knative.dev created
customresourcedefinition.apiextensions.k8s.io/knativeservings.operator.knative.dev created
clusterrole.rbac.authorization.k8s.io/knative-serving-operator-aggregated created
clusterrole.rbac.authorization.k8s.io/knative-serving-operator-aggregated-stable created
clusterrole.rbac.authorization.k8s.io/knative-eventing-operator-aggregated created
clusterrole.rbac.authorization.k8s.io/knative-eventing-operator-aggregated-stable created
clusterrole.rbac.authorization.k8s.io/knative-serving-operator created
clusterrole.rbac.authorization.k8s.io/knative-eventing-operator created
serviceaccount/knative-operator created
clusterrolebinding.rbac.authorization.k8s.io/knative-serving-operator created
clusterrolebinding.rbac.authorization.k8s.io/knative-eventing-operator created
role.rbac.authorization.k8s.io/knative-operator-webhook created
clusterrole.rbac.authorization.k8s.io/knative-operator-webhook created
serviceaccount/operator-webhook created
rolebinding.rbac.authorization.k8s.io/operator-webhook created
clusterrolebinding.rbac.authorization.k8s.io/operator-webhook created
clusterrolebinding.rbac.authorization.k8s.io/knative-serving-operator-aggregated created
clusterrolebinding.rbac.authorization.k8s.io/knative-serving-operator-aggregated-stable created
clusterrolebinding.rbac.authorization.k8s.io/knative-eventing-operator-aggregated created
clusterrolebinding.rbac.authorization.k8s.io/knative-eventing-operator-aggregated-stable created
configmap/config-logging created
configmap/config-observability created
deployment.apps/knative-operator created

===========================================================================================================================================

Kubectl apply -f KnativeServing.yaml
namespace/knative-serving created
knativeserving.operator.knative.dev/knative-serving created

===========================================================================================================================================

kubectl --namespace knative-serving get service kourier
NAME      TYPE           CLUSTER-IP     EXTERNAL-IP     PORT(S)                      AGE
kourier   LoadBalancer   10.0.223.135   20.227.21.206   80:30463/TCP,443:31322/TCP   69s

===========================================================================================================================================

kubectl patch configmap/config-domain \
  --namespace knative-serving \
  --type merge \
  --patch '{"data":{"myapp.20.227.21.206.nip.io":""}}'

===========================================================================================================================================


kubectl get deployment -n knative-serving
NAME                     READY   UP-TO-DATE   AVAILABLE   AGE
3scale-kourier-gateway   1/1     1            1           115s
activator                1/1     1            1           8h
autoscaler               1/1     1            1           8h
autoscaler-hpa           1/1     1            1           8h
controller               1/1     1            1           8h
domain-mapping           1/1     1            1           8h
domainmapping-webhook    1/1     1            1           8h
net-kourier-controller   1/1     1            1           116s
webhook                  1/1     1            1           8h

===========================================================================================================================================

❯ kubectl get KnativeServing knative-serving -n knative-serving
NAME              VERSION   READY   REASON
knative-serving   1.6.0     True    

===========================================================================================================================================

kubectl get ksvc