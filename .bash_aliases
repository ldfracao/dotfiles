# UTILS
alias md='mkdir'
alias xo='xdg-open'
alias so='source'
alias clipc='xclip -selection clipboard'
alias clipp='xclip -selection clipboard -o'

# NEOVIM
alias nv='nvim'

# APT
alias update='sudo apt update && sudo apt upgrade'

# GIT
alias gin='git init'
alias gcl='git clone'
alias gst='git status'
alias gad='git add'
alias gcm='git commit -m'
alias gch='git checkout'
alias gbr='git branch'
alias glg='git log --all --oneline --graph --decorate'
alias gpl='git pull'
alias gph='git push'
alias gsa='git submodule add'
alias gsu='git submodule update'
alias dfs='git --git-dir=$HOME/.dotfiles --work-tree=$HOME'

# Shapes
LOW_RIGHT_TRI=$'\u25e2'
UPPER_LEFT_TRI=$'\u25e4'
FULL_BLOCK=$'\u2588'
FOLDER=$'\U1f5c0'
COMPUTER=$'\U1f4bb'
USER_ICON=$'\uf007' # Private use area character
GIT_BRANCH_ICON=$'\uf126' # Private use area character

# Colors
RESET="\[\e[0m\]"

# Foreground colors
FG_BLACK="\[\e[30m\]"
FG_RED="\[\e[31m\]"
FG_GREEN="\[\e[32m\]"
FG_YELLOW="\[\e[33m\]"
FG_BLUE="\[\e[34m\]"
FG_MAGENTA="\[\e[35m\]"
FG_CYAN="\[\e[36m\]"
FG_WHITE="\[\e[37m\]"

# Background colors
BG_BLACK="\[\e[40m\]"
BG_RED="\[\e[41m\]"
BG_GREEN="\[\e[42m\]"
BG_YELLOW="\[\e[43m\]"
BG_BLUE="\[\e[44m\]"
BG_MAGENTA="\[\e[45m\]"
BG_CYAN="\[\e[46m\]"
BG_WHITE="\[\e[47m\]"

# Combinations (names are in the format FG_BG)
YELLOW_BLUE="\[\e[3;33;44m\]"

# Colors without \[ \] to be used within functions
FG_MAGENTA_RAW="\e[35m"
YELLOW_MAG_RAW="\e[3;33;45m"
RESET_RAW="\e[0m"

get_git_branch() {
    local branch
    branch=$(git symbolic-ref --short HEAD 2> /dev/null)
    if [[ -n $branch ]]; then
        printf "%b" "${FG_MAGENTA_RAW}${LOW_RIGHT_TRI}${YELLOW_MAG_RAW}${GIT_BRANCH_ICON} ${branch}${RESET_RAW}${FG_MAGENTA_RAW}${UPPER_LEFT_TRI}${RESET_RAW}"
    fi
}

PS1=" ${FG_BLUE}${LOW_RIGHT_TRI}${FULL_BLOCK}${YELLOW_BLUE}${COMPUTER}\h${RESET}${FG_BLUE}${UPPER_LEFT_TRI}\$(get_git_branch)\n"
PS1+="${FG_BLUE}${LOW_RIGHT_TRI}${YELLOW_BLUE} ${USER_ICON} \u ${FOLDER}  \w${RESET}${FG_BLUE}${UPPER_LEFT_TRI}${FG_WHITE}\n"
