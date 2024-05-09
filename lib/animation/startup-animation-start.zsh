
#--------------------------------------------------------------------#
# Start Up Animation Start                                           #
#--------------------------------------------------------------------#

startup_animation_start() {
    ZSH=${ZSH:-"/c/Users/${USERNAME}/.oh-my-zsh"}
    ZSH_CUSTOM=${ZSH_CUSTOM:-"$ZSH/custom"}
    STARTUP_ANIMATION_DIR_PATH=${STARTUP_ANIMATION_DIR_PATH:-"$ZSH_CUSTOM/lib/animation/frames"}

    local frame_style=${STARTUP_ANIMATION_STYLE:-default}
    local frame_interval=0.06
    local frame_path=${STARTUP_ANIMATION_DIR_PATH:-"$STARTUP_ANIMATION_DIR_PATH/startup-animation-$frame_style.frame"}
    [[ ! -f $frame_path ]] && frame_path="$STARTUP_ANIMATION_DIR_PATH/startup-animation-default.frame"
    [[ ! -f $frame_path ]] && return;

    while IFS= read -r line; do
        frames+=("$line")
    done < $frame_path

    # Hide Cursor
    tput civis

    # Starting animation in background
    printf "\n"
    (while true; do 
        for frame in "${frames[@]}"; do
            printf "\r %s" "$frame"
            sleep "$frame_interval"
        done
    done) &

    local animation_pid=$!
    startup_animation_pid=$animation_pid
    export STARTUP_ANIMATION_PID=$animation_pid
    unset -f startup_animation_start
}
