# Key bindings
function my_key_bindings
    fish_vi_key_bindings
    bind -M insert -m default jj force-repaint
end
set -g fish_key_bindings my_key_bindings

eval (python3 ~/.config/fish/virtualfish/virtualfish/)
