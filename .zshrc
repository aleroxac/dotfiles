# Path to your oh-my-zsh installation.
export ZSH=/home/$USER/.dotfiles/oh-my-zsh
export HIST_STAMP="dd/mm/yyyy H:M:S"
#ZSH_THEME="agnoster"
ZSH_THEME="bira"

plugins=(
    git
    sudo
    fzf
    docker
)

prompt_dir() {
  prompt_segment blue black '%2/' 
}

source $ZSH/oh-my-zsh.sh
zcompdump=$(echo .zcompdump-$(echo $HOST)-$(zsh --version|cut -d' ' -f2))

[[ -f ~/$zcompdump ]] && rm ~/$zcompdump ;
[[ -f ~/.zcompdump ]] && rm ~/.zcompdump ;
[[ -f ~/.zsh-update ]] && rm ~/.zsh-update ;
[[ -f ~/.dotfiles/shellrc ]] && . ~/.dotfiles/shellrc

#source <(kubectl completion bash)

# Added by serverless binary installer
export PATH="$HOME/.serverless/bin:$PATH"
