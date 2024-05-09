
#--------------------------------------------------------------------#
# Start Up Animation Stop                                            #
#--------------------------------------------------------------------#

startup_animation_stop() {
    if [[ $STARTUP_ANIMATION_CLEAR == 'no' ]]; then
        unset STARTUP_ANIMATION_CLEAR
        unset STARTUP_ANIMATION_CONSOLE_CLEAR
        return
    fi

    if [[ $STARTUP_ANIMATION_PID && $STARTUP_ANIMATION_PID != "" ]]; then
        kill -9 "$STARTUP_ANIMATION_PID" &>/dev/null
        unset STARTUP_ANIMATION_PID
    fi 

    [[ $STARTUP_ANIMATION_CONSOLE_CLEAR == "yes" ]] && clear

    tput cnorm
    [[ $STARTUP_ANIMATION_CONSOLE_CLEAR != "yes" ]] && printf "\n"
    
    [[ $STARTUP_ANIMATION_CLEAR ]] && unset STARTUP_ANIMATION_CLEAR
    [[ $STARTUP_ANIMATION_CONSOLE_CLEAR ]] && unset STARTUP_ANIMATION_CONSOLE_CLEAR
}

autoload -Uz startup_animation_stop
