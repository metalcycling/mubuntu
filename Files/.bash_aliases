# Aliases
alias mscreen='screen -S metalcycling'
alias lls='ls -alF -h -tr'
alias finds='grep -rni . -e $@'
alias findf='find . -name $@'
alias jqp='jq --color-output .'
alias watch='watch -c'
alias uncolorize='sed -r "s/\x1B(\[[0-9;]*[A-Za-z])//g"'
alias cdd='cd /Users/metalcycling/Dropbox'
alias cdl='cd /Users/metalcycling/Dropbox/Luma_AI'
alias cdk='cd /Users/metalcycling/Dropbox/Luma_AI/Repositories/lumaverse/projects/kuma'
alias sls='screen -ls'
alias scr='screen -r $(screen -ls | grep -i detached | head -n 1 | awk "{ print $1 }")'
alias scd='screen -d $(screen -ls | grep -i detached | head -n 1 | awk "{ print $1 }")'
alias scw='screen -wipe $(screen -ls | grep -i "dead" | head -n 1 | awk "{ print $1 }")'
alias dps='docker ps -a'
alias dim='docker images -a'
alias drun='docker run --interactive --tty --rm'
alias dexec='docker exec --interactive --tty'
alias drm='docker rm'
alias drmi='docker rmi'
alias dstop='docker stop'
alias dpr='docker system prune --all'
alias sctl='systemctl'
alias sctls='systemctl status'
alias sctlr='systemctl restart'
alias kubectl='kubecolor'
alias kc='kubecolor'
alias kcn='kubecolor config set-context --current --namespace'
alias kcw='watch -n 0.2 unbuffer kubecolor get all -o wide'
alias kcg='kubecolor get'
alias kcy='kubecolor get -o yaml'
alias kcd='kubecolor describe'
alias kcl='kubecolor logs'
alias kclf='kubecolor logs --follow=true'
alias kcga='kubecolor get all'
alias kcgp='kubecolor get pods'
alias kcdp='kubecolor describe pod'
alias kcyp='kubecolor get pod -o yaml'
alias kcdl='kubecolor delete'
alias kcaf='kubecolor apply -f'
alias kcdf='kubecolor delete -f'
alias kcgw='watch -n 0.2 unbuffer kubecolor get'
alias kcgpw='watch -n 0.2 unbuffer kubecolor get pods'
alias gs='git status'
alias gl='git pull'
alias gp='git push'
alias gd='git diff'
alias ga='git add'
alias gr='git restore'
alias grs='git restore --staged'
alias gdf='git diff --'
alias gdv='git difftool'
alias gau='git add --update'
alias gc='git commit -v -m'
alias gca='git commit -v -a -m'
alias gb='git branch'
alias gba='git branch -a'
alias gco='git checkout'
alias gcob='git checkout -b'
alias gcot='git checkout -t'
alias gcotb='git checkout --track -b'
alias glog='git log'
alias glogo='git log --oneline'
alias glogp='git log --pretty=format:"%h %s" --graph'
alias gst='git stash'
alias gstl='git stash list'
alias gstp='git stash pop'
alias gstd='git stash drop'

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

psk()
{
    pid=$(ps aux | grep -- ${1} | grep -v grep | awk '{ print $2 }')

    if [[ -n ${pid} ]]; then
        kill -9 ${pid}
    fi
}

kce()
{
    if [[ -z ${2} ]]; then
        kubecolor exec --stdin --tty ${1} -- /bin/bash -c "TERM=xterm-256color /bin/bash"
    else
        kubecolor exec --stdin --tty --namespace ${1} ${2} -- /bin/bash -c "TERM=xterm-256color /bin/bash"
    fi
}

_kce() {
    local current namespace

    COMPREPLY=()
    current="${COMP_WORDS[COMP_CWORD]}"

    if (( COMP_CWORD == 1 )); then
        COMPREPLY=($(compgen -W "$(kubectl get pods -o custom-columns=:metadata.name --no-headers 2>/dev/null)" -- ${current}))
        return 0
    fi

    if (( COMP_CWORD == 2 )); then
        namespace=${COMP_WORDS[1]}
        COMPREPLY=($(compgen -W "$(kubectl get pods -n ${namespace} -o custom-columns=:metadata.name --no-headers 2>/dev/null)" -- ${current}))
        return 0
    fi
}

complete -F _kce -o default -o bashdefault kce

cdf()
{
    cd $(dirname ${1})
}

cdw()
{
    cd $(dirname $(command -v ${1}))
}

complete -A command cdw

vimw()
{
    vim $(which ${1})
}

complete -A command vimw
