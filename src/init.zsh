
#--------------------------------------------------------------------#
# Initializer                                                        #
#--------------------------------------------------------------------#

first_init() {
    printf "\n%s\n" "First Init Custom Config"
    if [ ! -d "$ZSH_CACHE" ]; then
        mkdir $ZSH_CACHE
        notify "Creating Cache Directory" "Creating on: $ZSH_CACHE"
        printf "\x1b[0;34m%s\x1b[1;30m: \x1b[1;4;3;34m%s\x1b[0m\n" "Creating cache directory at" "$ZSH_CACHE"
    fi

    if [ ! -f "$ZSH_CUSTOM_CONFIG" ]; then
        notify "Creating Custom Config" "Creating on: $ZSH_CACHE"
        save_config print
        printf "\x1b[0;34m%s\x1b[1;30m: \x1b[1;4;3;34m%s\x1b[0m\n" "Creating custom config file at" "$ZSH_CUSTOM_CONFIG"
    fi
}

# Cleanup
cleanup_init() {
    unset TOAST_MODULE
    unset TOAST_MODULE_EXIST
    unset STARTUP_ANIMATION_CLEAR
    unset STARTUP_ANIMATION_CONSOLE_CLEAR
    unset NOTIFY_LOGO
    unset NOTIFY_SOUND
    unset NOTIFY_AT_STARTUP

    unset -f init
    unset -f first_init
    unset -f cleanup_init
    unset -f load_config
    unset -f save_config
    unset -f init_config
    unset -f validate_os
    unset -f validate_notification_module
    unset -f startup_animation_stop

    type startup_animation_start &> /dev/null && unset -f startup_animation_start
}

init() {
    # Init config
    init_config

    # Validating OS & Module
    validate_os
    validate_notification_module

    # Importing config file
    load_config

    # Clear start up Animation
    [[ $STARTUP_ANIMATION_PID ]] && startup_animation_stop

    # Notify at start up
    if [[ $NOTIFY_AT_STARTUP == 'yes' ]]; then
        local notify_title="Hi, $USERNAME"
        [[ $USERNAME == "" ]] && notify_title="Hi"
         notify $notify_title "Let's build code!"
    fi

    # Checking & Creating Initial Config if not exist
    if [[ ! -f "$ZSH_CUSTOM_CONFIG" ]]; then
        first_init
        load_config
    fi
}

autoload -Uz cleanup_init
autoload -Uz first_init
autoload -Uz init
