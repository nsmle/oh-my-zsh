
#--------------------------------------------------------------------#
# Validate OS Helper                                                 #
#--------------------------------------------------------------------#

validate_os() {
    if [[ "$OS" == "Windows_NT" ]]; then
        if [[ "$(uname -s | cut -c 1-10)" == "MINGW32_NT" || "$(uname -s | cut -c 1-10)" == "MINGW64_NT" ]]; then
            OS="GitBash"
        elif [[ "$env:os" == "Windows_NT" ]]; then
            OS="PowerShell"
        elif [[ "$OS" == "Windows_NT" ]]; then
            OS="Cmd"
        fi
    else
        if [[ "$env:os" == "Windows_NT" ]]; then
            OS="PowerShell"
        elif [[ -n "$WSL_DISTRO_NAME" ]]; then
            OS="WSL"
        elif [[ "$(uname)" == "Linux" ]]; then
            OS="Linux"
        elif [[ "$(uname -s | cut -c 1-10)" == "MINGW32_NT" || "$(uname -s | cut -c 1-10)" == "MINGW64_NT" ]]; then
            OS="GitBash"
        elif [[ "$OS" == "Windows_NT" ]]; then
            OS="Cmd"
        fi
    fi
}

validate_notification_module() {
    if [[ "$OS" == "WSL" ]] ||
       [[ "$OS" == "GitBash" ]] ||
       [[ "$OS" == "Cmd" ]]; then
        TOAST_MODULE_EXIST=$(powershell.exe -Command "if (Get-Module -Name BurntToast -ListAvailable) { echo \"yes\" } else { echo \"no\" }")
        TOAST_MODULE=BurntToast
    elif [[ "$OS" == "Linux" ]]; then
        TOAST_MODULE=notify-send
        if [[ "$(notify-send --help 2> /dev/null | grep 'notify-send')" == "notify-send"  ]]; then
            TOAST_MODULE_EXIST=yes
        else
            TOAST_MODULE_EXIST=no
        fi
    else
        TOAST_MODULE=unknown
        TOAST_MODULE_EXIST=no
    fi
}

autoload -Uz validate_os
autoload -Uz validate_notification_module
