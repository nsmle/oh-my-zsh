# ============================================================
# ================== ZSH NSMLE CUSTOMIZATION =================
# ============================================================
# 
# More: https://github.com/ohmyzsh/ohmyzsh/wiki/Customization
# 

HOMEUSER="${HOMEUSER:-"$HOME"}"
ZSH_CUSTOM="${ZSH_CUSTOM:-"$(dirname "$0")"}"

. $ZSH_CUSTOM/src/config.zsh
. $ZSH_CUSTOM/src/os.zsh
. $ZSH_CUSTOM/src/init.zsh
. $ZSH_CUSTOM/src/notify.zsh
. $ZSH_CUSTOM/src/alias.zsh
. $ZSH_CUSTOM/src/animation/startup-animation-stop.zsh

# Initializing
init