if status is-interactive
    # Commands to run in interactive sessions can go here
end

function fish_greeting
    set_color cyan
    echo -n (hostname)
    set_color normal

    echo -n " ("
    set_color yellow
    echo -n (ip -4 addr show | awk '/inet / && !/127.0.0.1/ {print $2}' | cut -d/ -f1 | head -n 1)
    set_color normal
    echo -n ") | "

    set_color green
    echo -n " "(top -bn1 | grep "Cpu(s)" | awk '{print $2}')"%"
    set_color normal
    echo -n " | "

    set_color magenta
    echo -n " "(free -m | awk '/Mem/ {print $3 "MB / " $2 "MB"}')
    set_color normal
    echo -n " | "

    set_color blue
    if test -e /sys/class/power_supply/BAT1/capacity
        echo -n " "(cat /sys/class/power_supply/BAT1/capacity)"%"
    else
        echo -n " N/A"
    end

    set_color normal
    echo
end
