
#--------------------------------------------------------------------#
# Helper PowerShell Notification                                     #
#--------------------------------------------------------------------#

notify() {
    [[ $TOAST_MODULE_EXIST == "no" ]] && return
    if [[ $TOAST_MODULE == "BurntToast" ]]; then
        local title="$1"
        local message="$2"
        local context="$3"
        local logo="$4"
        logo="${logo:-$NOTIFY_LOGO}"
        echo $WT_SESSION
        # local tabId=$WT_SESSION    

        logo=$(echo "$logo" | sed 's/\/c/C:\\/;s/\//\\/g')
        if [[ "${logo:0:3}" == "/c/" ]]; then
            logo="$(tr '[:lower:]' '[:upper:]' <<< "${logo:1:1}")${logo:2}"
        fi

        local notify_command="New-BurntToastNotification -Sound \"$NOTIFY_SOUND\" -AppLogo \"$logo\" -Text \"$title\",\"$message\" -UniqueIdentifier \"zsh-custom-toast\""
        [[ $context != "" ]] && notify_command="\$ZshNotify = New-BTHeader -Id \"001\" -Title \"$context\"; $notify_command -Header \$ZshNotify"

        # powershell.exe -Command $notify_command > /dev/null 2>&1
        powershell.exe -Command $notify_command

    # elif [[ $TOAST_MODULE == "notify-send" ]]; then
    #     # RUN NOTIFY SEND ON LINUX
    fi
}

autoload -Uz notify