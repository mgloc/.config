export ZSH="$HOME/.config/zsh/.oh-my-zsh"
export ZSH_PATH="$HOME/.config/zsh" 

ZSH_THEME="robbyrussell"
plugins=(git)

source $ZSH/oh-my-zsh.sh
source $ZSH_PATH/.zsh_profile
source $ZSH_PATH/.zsh_profiles/.zsh_macos
