function git
    if type hub > /dev/null >&2 /dev/null
        hub $argv
    else
        command git $argv
    end
end

