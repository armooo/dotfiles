function __find_workspace
    set workspace $PWD
    while true
        if test -e $PWD/WORKSPACE
            return $workspace
        end
        retirn $PWD
    end
end

function __bazel_needs_command
    set cmd (commandline -opc)
    if [ (count $cmd) -eq 1 ]
        return 0
    else
        return 1
    end
end

function __bazel_using_command
    set cmd (commandline -opc)
    if [ (count $cmd) -gt 1 ]
        if [ $argv[1] = $cmd[2] ]
            return 0
        end
    end
    return 1
end

function __bazel_targets
    command bazel query  "kind(\"$argv[1] rule\", ...)" ^ /dev/null
end


complete -f -n '__bazel_needs_command' -c bazel -a analyze-profile -d 'Analyzes build profile data.'
complete -f -n '__bazel_needs_command' -c bazel -a build -d 'Builds the specified targets.'
complete -f -n '__bazel_needs_command' -c bazel -a canonicalize-flags -d 'Canonicalizes a list of bazel options.'
complete -f -n '__bazel_needs_command' -c bazel -a clean -d 'Removes output files and optionally stops the server.'
complete -f -n '__bazel_needs_command' -c bazel -a dump -d 'Dumps the internal state of the bazel server process.'
complete -f -n '__bazel_needs_command' -c bazel -a fetch -d 'Fetches external repositories that are prerequisites to the targets.'
complete -f -n '__bazel_needs_command' -c bazel -a help -d 'Prints help for commands, or the index.'
complete -f -n '__bazel_needs_command' -c bazel -a info -d 'Displays runtime info about the bazel server.'
complete -f -n '__bazel_needs_command' -c bazel -a mobile-install -d 'Installs targets to mobile devices.'
complete -f -n '__bazel_needs_command' -c bazel -a query -d 'Executes a dependency graph query.'
complete -f -n '__bazel_needs_command' -c bazel -a run -d 'Runs the specified target.'
complete -f -n '__bazel_needs_command' -c bazel -a shutdown -d 'Stops the bazel server.'
complete -f -n '__bazel_needs_command' -c bazel -a test -d 'Builds and runs the specified test targets.'
complete -f -n '__bazel_needs_command' -c bazel -a version -d 'Prints version information for bazel.'

complete -f -n '__bazel_using_command build' -c bazel -a '(__bazel_targets ".*_bin|_.*test")'
complete -f -n '__bazel_using_command test' -c bazel -a '(__bazel_targets ".*_test")'
complete -f -n '__bazel_using_command run' -c bazel -a '(__bazel_targets ".*_bin|_.*test")'
