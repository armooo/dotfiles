source ~/.config/fish/completions/bazel.fish
complete -f -c bzlfix -a '(__bazel_targets ".*_bin|_.*test|.*binary")'
