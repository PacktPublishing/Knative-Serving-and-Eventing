# login to azure
az login

# Create a resource group in Australia East
az group create --name knativeresourcegroup --location australiaeast

# Create a basic two node AKS cluster
az aks create \
    --resource-group knativeresourcegroup \
    --name myAKSCluster \
    --vm-set-type VirtualMachineScaleSets \
    --node-count 2 

#merge credentials into kubeconfig
az aks get-credentials --name myAKSCluster -g knativeresourcegroup

#verify nodes
kubectl get nodes

#check if the context is pointing to the right cluster
kubectl config get-contexts