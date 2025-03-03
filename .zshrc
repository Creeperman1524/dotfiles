# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source ~/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# -- Aliases --
# Configuring zsh
alias reload-zsh="source ~/.zshrc"
alias edit-zsh="nvim ~/.zshrc"

# Configuring nvim
alias edit-nvim="nvim ~/.dotfiles/.config/nvim/"

# Running polybar
alias runpolybar="~/.config/polybar/launch.sh"

# ssh
alias discord-bot="ssh root@192.168.30.205"
alias minecraft-server="ssh mcserver@192.168.40.2"

# eza (better ls)
alias ls="eza --color=always --long --git --no-filesize --icons=always --no-time --no-user --no-permissions"

# tree mode for htop
alias htop="htop -t"

# -------------

# Neovim path varialbe
export PATH="$PATH:/opt/nvim/"

# Better history setup
HISTFILE=$HOME/.zhistory
SAVEHIST=1000
HISTSIZE=999
setopt share_history 
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_verify

# Completion using arrow keys (based on history)
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward

# Autocomplete
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# zoxide (better cd)
export PATH="$HOME/.local/bin:$PATH" # add ~/.local/bin to $PATH

alias zoxideHist="zoxide query -l -s | less"

eval "$(zoxide init --cmd cd zsh)" # replaces cd

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/ant/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/ant/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/ant/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/ant/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

