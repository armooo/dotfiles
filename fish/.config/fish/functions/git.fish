function git
    if type hub > /dev/null ^ /dev/null
        hub $argv
    else
        command git $argv
    end
end

