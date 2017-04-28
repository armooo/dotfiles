source ~/.config/fish/completions/bazel.fish
complete -f -c brun  -a '(__bazel_targets ".*_bin|_.*test|.*binary")'
