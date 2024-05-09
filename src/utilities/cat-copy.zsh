
#--------------------------------------------------------------------#
# Cat & Copy to clipboard utility                                    #
#--------------------------------------------------------------------#

cat_copy() {
    local err_msg=""
    if [[ $OS == "GitBash" ]]; then
        cat $@ | clip
    elif [[ -n "$WSL_DISTRO_NAME" ]]; then
        cat $@ | clip.exe
    else
        err_msg="Cannot recognize system info"
    fi

    if [[ -n "$err_msg" ]]; then
        notify "Error to copy to your clipboard" "$err_msg" "ZSH: Cat and Copy"
    else
        notify "Copied to your clipboard" "Text successfully copied to your clipboard!" "ZSH: Cat and Copy"
    fi
}

autoload -Uz notify