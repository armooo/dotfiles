function unssh
    command ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null $argv
end
