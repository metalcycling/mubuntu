# Aliases
alias finds='grep -rni . -e $@'
alias findf='find . -name $@'
alias slurmw='watch -n 1.0 "sinfo -o \"%50N  %10c  %20m  %30G \"; sjstat -v; squeue;"'
alias squeue='squeue --format="%.18i  %.9P  %.30j  %.8u  %.8T  %.10M  %.10l  %.6D  %.23R"'
alias snode='sinfo -O "NodeHost:25,FreeMem:11,Memory:11,Available:7,CPUs:7,CPUsState:19,GresUsed:21,StateLong"'
alias jqp='jq --color-output .'
alias lls='ls -alF -h -tr'
alias dps='docker ps -a'
alias dim='docker images -a'
alias drun='docker run -v /scratch/root/Docker/.bashrc:/home/ray/.bashrc -v /scratch/root/Docker/.bash_aliases:/home/ray/.bash_aliases -v /scratch/root/Docker/.vimrc:/home/ray/.vimrc -v /scratch/root/Docker/.vim:/home/ray/.vim -v /scratch/root/Docker/.inputrc:/home/ray/.inputrc'
alias dexec='docker exec'
alias drm='docker rm'
alias drmi='docker rmi'
alias dstop='docker stop'
alias dpr='docker system prune --all'
alias watch='watch -c'

sjob()
{
    scontrol show job ${1}
}

swork()
{
    cd $(python -c "print('$(sjob ${1} | grep WorkDir)'[11:])")
}

carmen()
{
    module purge
    module load slurm/${1} openmpi/${1} vasp/${1}
}

psa()
{
    if [[ -n ${1} ]]; then
        ps aux | grep -- ${1}
    else
        ps aux
    fi
}
