#!/bin/sh

function main() {
	#TODO: Test with microphone
	#TODO: Remove full path for binaries
    DEFAULT_SOURCE=$(/run/current-system/sw/bin/wpctl status | /run/current-system/sw/bin/sed -n 's/^*[[:space:]]*[[:digit:]]\+: source description="\(.*\)" prio=[[:digit:]]\+$/\1/p')
    DEFAULT_SINK=$(/run/current-system/sw/bin/wpctl status | /run/current-system/sw/bin/sed -n 's/^*[[:space:]]*[[:digit:]]\+: sink description="\(.*\)" prio=[[:digit:]]\+$/\1/p')
    VOLUME=$(/run/current-system/sw/bin/pamixer --get-volume-human)

    case $1 in
        "up")
            /run/current-system/sw/bin/pamixer --increase 10
            ;;
        "down")
            /run/current-system/sw/bin/pamixer --decrease 10
            ;;
        "mute")
            /run/current-system/sw/bin/pamixer --toggle-mute
            ;;
        *)
	#TODO: Test with microphone
            #echo "Source: ${DEFAULT_SOURCE} | Sink: ${VOLUME} ${DEFAULT_SINK}"
            echo "Sink: ${VOLUME} ${DEFAULT_SINK}"
    esac
}

main "$@"
