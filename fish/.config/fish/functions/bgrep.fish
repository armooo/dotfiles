function bgrep
    set target $argv[-1]
    set source_targets (bazel query "kind('source file', deps($target, 1))")
    set source_files (string replace ':' '/' (string replace // '' $source_targets))

    if test -z $source_files
        echo "Target $target has no source files"
    else
        grep $argv[1..-2] $source_files
    end
end

