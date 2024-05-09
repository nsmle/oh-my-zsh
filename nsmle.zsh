# ============================================================
# ================== ZSH NSMLE CUSTOMIZATION =================
# ============================================================
# 
# More: https://github.com/ohmyzsh/ohmyzsh/wiki/Customization
# 

HOMEUSER="${HOMEUSER:-"$HOME"}"
ZSH_CUSTOM="${ZSH_CUSTOM:-"$(dirname "$0")"}"

. $ZSH_CUSTOM/lib/config.zsh
. $ZSH_CUSTOM/lib/os.zsh
. $ZSH_CUSTOM/lib/init.zsh
. $ZSH_CUSTOM/lib/notify.zsh
. $ZSH_CUSTOM/lib/alias.zsh
. $ZSH_CUSTOM/lib/animation/startup-animation-stop.zsh

# Initializing
init