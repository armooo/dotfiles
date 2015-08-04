# Key bindings
fish_vi_mode
function my_key_bindings
    fish_vi_key_bindings
    bind -M insert -m default jj force-repaint
end
set -g fish_key_bindings my_key_bindings

eval (python ~/.config/fish/virtualfish/virtualfish/)
