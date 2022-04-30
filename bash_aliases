
alias clus1='export KUBECONFIG=~/.kube/kubconfig_cluster1' 
alias clus2='export KUBECONFIG=~/.kube/kubconfig_cluster2'

# set context
alias kn='f() { [ "$1" ] && kubectl config set-context --current --namespace $1 || kubectl config view --minify | grep namespace | cut -d" " -f6 ; } ; f'

# show context
alias kx='f() { [ "$1" ] && kubectl config use-context $1 || kubectl config current-context ; } ; f'

# get a list of users
alias kgu="kubectl config view -o jsonpath='{.users[*].name}'"




