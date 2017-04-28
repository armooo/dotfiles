function bdt
    bazel test --test_arg -v --test_output=streamed $argv
end

