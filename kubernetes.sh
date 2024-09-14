#!/bin/bash

alias k="kubectl"

# kubectl apply and delete
alias kappf="kubectl apply -f"
alias kdelf="kubectl delete -f"

# kubectl describe
alias kd="kubectl describe"
alias kdc="kubectl describe configmap"
alias kdcj="kubectl describe cronjob"
alias kdd="kubectl describe deploy"
alias kdj="kubectl describe job"
alias kdp="kubectl describe pod"
alias kdsa="kubectl describe serviceaccount"
alias kds="kubectl describe svc"
alias kdsc="kubectl describe secret"

# kubectl exec
alias kex="kubectl exec"
alias kexit="kubectl exec -it"

# kubectl get
alias kg="kubectl get"
alias kgc="kubectl get configmap"
alias kgcj="kubectl get cronjob"
alias kgd="kubectl get deploy"
alias kgj="kubectl get job"
alias kgp="kubectl get pod"
alias kgsa="kubectl get serviceaccount"
alias kgs="kubectl get svc"
alias kgsc="kubectl get secret"

# kubectl label
alias kl="kubectl label"
alias klc="kubectl label configmap"
alias klcj="kubectl label cronjob"
alias kld="kubectl label deploy"
alias klj="kubectl label job"
alias klp="kubectl label pod"
alias klsa="kubectl label serviceaccount"
alias kls="kubectl label svc"
alias klsc="kubectl label secret"

# kubectl port-forward
alias kpf="kubectl port-forward"