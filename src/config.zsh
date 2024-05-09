
#--------------------------------------------------------------------#
# Config                                                             #
#--------------------------------------------------------------------#

save_config() {
    local print_config=${1:-no}
    local config="OS=$OS
TOAST_MODULE=$TOAST_MODULE
TOAST_MODULE_EXIST=$TOAST_MODULE_EXIST
"

    echo -e $config > $ZSH_CUSTOM_CONFIG
    [[ $print_config == 'print' ]] && echo -e $config
}

init_config() {
    OS="${OS:-unknown}"
    ZSH_CACHE="${ZSH_CACHE:-$ZSH/cache}"
    ZSH_CUSTOM_CONFIG="$ZSH_CACHE/zsh_custom_config"
    # Toast notif module
    TOAST_MODULE=unknown
    TOAST_MODULE_EXIST=no
    # Startup animation
    STARTUP_ANIMATION_CONSOLE_CLEAR="${STARTUP_ANIMATION_CONSOLE_CLEAR:-yes}"
    STARTUP_ANIMATION_CLEAR="${STARTUP_ANIMATION_CLEAR:-yes}"
    STARTUP_ANIMATION_STYLE="${STARTUP_ANIMATION_STYLE:-default}"
    # Notification
    NOTIFY_SOUND="${NOTIFY_SOUND:-Reminder}"
    NOTIFY_LOGO="${NOTIFY_LOGO:-$ZSH_CUSTOM/src/asset/nsmle.png}"
    NOTIFY_AT_STARTUP="${NOTIFY_AT_STARTUP:-no}"
}

load_config() {
    local zsh_custom_config=$ZSH_CUSTOM_CONFIG
    [[ $zsh_custom_config != "" ]] && ZSH_CUSTOM_CONFIG=$zsh_custom_config

    # Load Config File
    [ -f "$ZSH_CUSTOM_CONFIG" ] && . $ZSH_CUSTOM_CONFIG

    local notify_logo=$NOTIFY_LOGO
    local notify_sound=$NOTIFY_SOUND
    local notify_at_startup=$NOTIFY_AT_STARTUP
    local startup_animation_clear=$STARTUP_ANIMATION_CLEAR
    local startup_animation_console_clear=$STARTUP_ANIMATION_CONSOLE_CLEAR

    zstyle -s :omz:custom config-path zsh_custom_config
    zstyle -s :omz:custom notify-logo notify_logo
    zstyle -s :omz:custom notify-sound notify_sound
    zstyle -s :omz:custom notify-at-startup notify_at_startup
    zstyle -s :omz:custom startup-animation-clear startup_animation_clear
    zstyle -s :omz:custom startup-animation-console-clear startup_animation_console_clear
    
    # Overriding config file
    [[ $notify_logo != "" && -f $notify_logo ]] && NOTIFY_LOGO=$notify_logo
    [[ $notify_sound != "" ]] && NOTIFY_SOUND=$notify_sound
    [[ $notify_at_startup != "" ]] && NOTIFY_AT_STARTUP=$notify_at_startup
    [[ $startup_animation_clear != "" ]] && STARTUP_ANIMATION_CLEAR=$startup_animation_clear
    [[ $startup_animation_console_clear != "" ]] && STARTUP_ANIMATION_CONSOLE_CLEAR=$startup_animation_console_clear

    # Save to Config File
    [ -f "$ZSH_CUSTOM_CONFIG" ] && save_config
}

autoload -Uz init_config
autoload -Uz save_config
autoload -Uz load_config