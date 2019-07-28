#!/bin/bash
#### NOTE ###############################################
# File path : /usr/local/bin/akros-init.sh
# Description: 
#   - Injected with the Ignition 
#
#########################################################

echo "########## THIS FILE IS A PLACEHOLDER ##########"

#########################################################
# Logs
#########################################################
log() {
    echo "$1" >> /tmp/debug_run.txt
    echo "$1" >&2
}

#########################################################
# do_something : dummy function
#########################################################
do_something() {
    echo "Function to do something"
}
#########################################################
# parse_args
#########################################################
parse_args() {
    USAGE="Usage: $0 [options]
Options:
    -p PORT Port for web server.
    -i URL  The URL (or path) to the given Ignition config,
    -h      This help.
This tool installs style disk images on a block device.
"

    while getopts "p:i:h" OPTION
    do
        case $OPTION in
            p) PORT="$OPTARG" ;;
            i) IGNITION="$OPTARG" ;;
            h) echo "$USAGE"; exit;;
            *) exit 1;;
        esac
    done

    if [[ -n "${PORT}" ]]
    then
        echo "AKROS_PORT=${PORT}" >> /tmp/etc_environment
    fi

    if [[ -n "${IGNITION}" ]]
    then
        echo "${IGNITION}" > /tmp/ignition_url
    fi
}
#########################################################
# Main function for running the installer
#########################################################
main() {

    # if [[ $EUID -ne 0 ]]; then
    #    echo "$0 must be run as root"
    #    exit 1
    # fi

    # if [[ -f /tmp/foo ]]; then 
    #     log "Funtionality is not implemented"
    # elif [[ -n ${CHECK_VAR} ]]; then
    #     log "The variable was set to ${CHECK_VAR}"
    # else
    #     log "No options match"
    # fi

    parse_args $@

    # Invoke specific functions
    do_something

    log "Execution complete"
}

main $@

#########################################################
# END OF FILE
#########################################################