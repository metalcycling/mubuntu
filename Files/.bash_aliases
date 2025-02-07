# Aliases
alias lls='ls -alF -h -tr'
alias finds='grep -rni . -e $@'
alias findf='find . -name $@'
alias jqp='jq --color-output .'
alias watch='watch -c'
alias dps='docker ps -a'
alias dim='docker images -a'
alias drun='docker run'
alias dexec='docker exec'
alias drm='docker rm'
alias drmi='docker rmi'
alias dstop='docker stop'
alias dpr='docker system prune --all'
alias kubectl='kubecolor'
alias kc='kubecolor'
alias kcn='kubecolor config set-context --current --namespace'
alias kcw='watch -n 0.2 unbuffer kubecolor get all -o wide'
alias kcga='kubecolor get all'
alias kcgp='kubecolor get pod -o yaml'
alias kcdp='kubecolor describe pod'
alias kclp='kubecolor logs'

ignore()
{
    echo "${1}" >> .gitignore;
}

psa()
{
    if [[ -n ${1} ]]; then
        ps aux | grep -- ${1}
    else
        ps aux
    fi
}
