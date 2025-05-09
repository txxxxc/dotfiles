set -gx NOTIFY_ON_COMMAND_DURATION 5000
function fish_right_prompt --on-event fish_prompt
    # 直前のコマンド名にnvimが含まれていればreturnする
    if string match -q -- "nvim*" (history | head -1)
        return
    end
    if test $CMD_DURATION
        # Show notification if dration is more than 5 seconds
        if test $CMD_DURATION -gt $NOTIFY_ON_COMMAND_DURATION
            # Show duration of the last command in seconds
            set duration (echo "$CMD_DURATION 1000" | awk '{printf "%.3fs", $1 / $2}')
            set -f MSG (echo (history | head -1) returned $status after $duration)
            type -q terminal-notifier && terminal-notifier -message $MSG && return
            return $CMD_DURATION
        end
    end
end

