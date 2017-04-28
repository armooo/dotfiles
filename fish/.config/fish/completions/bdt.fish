source ~/.config/fish/completions/bazel.fish
complete -f -c bdt -a '(__bazel_targets ".*_bin|_.*test|.*binary")'
