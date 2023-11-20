setup_myzsh() {
    rm -f ~/.zcompdump; compinit
}

setup_highlighting() {
    # Load syntax highlighter
    source $MYZSH/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
}

setup_autosuggestion() {
    # Load autosuggestions
    source $MYZSH/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
}

load_overrides() {
    source $1 || touch $1
}
