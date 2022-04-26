# Kubernetes_cheatsheet

[1. Install tools](https://kubernetes.io/es/docs/tasks/tools/)

[2. Kubernetes dashboard](https://kubernetes.io/docs/tasks/access-application-cluster/web-ui-dashboard/)

[3. kubecolors](https://github.com/hidetatz/kubecolor)

[4. autocompletion](https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/#enable-shell-autocompletion)

## Kubernetes dashboard

    usar --enable-skip-login para evitar el login  

### create adhoc dashboard token authentication

    # Crear sa "dashboard service account"
    kubectl create serviceaccount dashboard-admin-sa
    kubectl create clusterrolebinding dashboard-admin-sa \ 
    --clusterrole=cluster-admin --serviceaccount=default:dashboard-admin-sa
    kubectl get secrets
    kubectl describe secret dashboard-admin-sa-token-<id>

## kubectl

    	kubectl version --client
    	kubectl version -o json

## Contexts

    	kubectl config get-contexts
    	kubectl config use-context <mycontext>

## Nodes & cluster info

    	kubectl get nodes
    	kubectl cluster-info
    	kubectl get all -A
    	kubectl -n kube-system get cm kubeadm-config -o yaml

## Service Accounts

    	kubectl get serviceaccounts

    # crear SA adicional
    kubectl apply -f - <<EOF
    apiVersion: v1
    kind: ServiceAccount
    metadata:
    name: build-robot
    EOF

    	kubectl get serviceaccounts/build-robot -o yaml
    	kubectl delete serviceaccount/build-robot

## Tokens & secrets

    	kubectl get secrets
    	kubectl get secret --namespace=<namespace>
    	kubectl get secret <token> --namespace=<namespace> -o yaml

    # creación manual de un API token para una SA existente
    kubectl apply -f - <<EOF
    apiVersion: v1
    kind: Secret
    metadata:
    name: build-robot-secret
    annotations:
    kubernetes.io/service-account.name: build-robot
    type: kubernetes.io/service-account-token
    EOF

    	kubectl describe secrets/build-robot-secret

## Nodes

    	kubectl get node --output yaml
    	kubectl drain node1
    	kubectl cordom node1
 	kubectl uncordom node1
    
## Namespaces
	
    	kubectl get ns -o yaml
    	kubectl get pods --all-namespaces
    	kubectl config set-context --current --namespace=<namespace>

## Label

    	kubectl label node worker-node1 node-role.kubernetes.io/worker=worker
    	kubectl label --overwrite nodes <your_node> kubernetes.io/role=<your_new_label>

## API
 
	kubectl api-resources --namespaced=true
    	kubectl api-resources --namespaced=false	
