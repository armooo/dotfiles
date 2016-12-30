source ~/.config/fish/completions/bazel.fish
complete -f -c bzler -a '(__bazel_targets ".*_bin|_.*test|.*binary")'
