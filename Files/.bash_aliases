# Aliases
alias mscreen='screen -S metalcycling'
alias lls='ls -alF -h -tr'
alias finds='grep -rni . -e $@'
alias findf='find . -name $@'
alias jqp='jq --color-output .'
alias watch='watch -c'
alias sls='screen -ls'
alias scr='screen -r $(screen -ls | grep -i detached | head -n 1 | awk "{ print $1 }")'
alias scd='screen -d $(screen -ls | grep -i detached | head -n 1 | awk "{ print $1 }")'
alias scw='screen -wipe $(screen -ls | grep -i "dead" | head -n 1 | awk "{ print $1 }")'
alias dps='docker ps -a'
alias dim='docker images -a'
alias drun='docker run --interactive --tty --rm'
alias dexec='docker exec'
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
alias kcg='kubecolor get -o yaml'
alias kcd='kubecolor describe'
alias kcl='kubecolor logs'
alias kclf='kubecolor logs --follow=true'
alias kcga='kubecolor get all'
alias kcgp='kubecolor get pod -o yaml'
alias kcdp='kubecolor describe pod'
alias gst='git status'
alias gl='git pull'
alias gp='git push'
alias gd='git diff'
alias ga='git add'
alias gr='git restore'
alias grs='git restore --staged'
alias gdf='git diff --'
alias gdv='git difftool'
alias gau='git add --update'
alias gc='git commit -v'
alias gca='git commit -v -a'
alias gb='git branch'
alias gba='git branch -a'
alias gco='git checkout'
alias gcob='git checkout -b'
alias gcot='git checkout -t'
alias gcotb='git checkout --track -b'
alias glog='git log'
alias glogo='git log --oneline'
alias glogp='git log --pretty=format:"%h %s" --graph'

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
    kubecolor exec -it ${1} -- /bin/bash -c "TERM=xterm-256color /bin/bash"
}

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
