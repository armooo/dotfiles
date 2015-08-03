#
# Load common unssh options
# Copy and paste of /usr/share/fish/completions/ssh.fish

# __fish_complete_unssh unssh

complete -x -c unssh -d Hostname -a "

(__fish_print_hostnames)

(
	#Prepend any username specified in the completion to the hostname
	echo (commandline -ct)|sed -ne 's/\(.*@\).*/\1/p'
)(__fish_print_hostnames)
"

complete -x -c unssh -d User -a "
(__fish_print_users | sgrep -v '^_')@
"
complete -c unssh --description "Command to run" -x -a '(__fish_complete_subcommand --fcs-skip=2)'

complete -c unssh -s a --description "Disables forwarding of the authentication agent"
complete -c unssh -s A --description "Enables forwarding of the authentication agent"
complete -x -c unssh -s b --description "Interface to transmit from" -a "
(
	cat /proc/net/arp ^/dev/null| sgrep -v '^IP'|cut -d ' ' -f 1 ^/dev/null
)
"

complete -x -c unssh -s e --description "Escape character" -a "\^ none"
complete -c unssh -s f --description "Go to background"
complete -c unssh -s g --description "Allow remote host to connect to local forwarded ports"
complete -c unssh -s I --description "Smartcard device"
complete -c unssh -s k --description "Disable forwarding of Kerberos tickets"
complete -c unssh -s l -x -a "(__fish_complete_users)" --description "User"
complete -c unssh -s m --description "MAC algorithm"
complete -c unssh -s n --description "Prevent reading from stdin"
complete -c unssh -s N --description "Do not execute remote command"
complete -c unssh -s p -x --description "Port"
complete -c unssh -s q --description "Quiet mode"
complete -c unssh -s s --description "Subsystem"
complete -c unssh -s t --description "Force pseudo-tty allocation"
complete -c unssh -s T --description "Disable pseudo-tty allocation"
complete -c unssh -s x --description "Disable X11 forwarding"
complete -c unssh -s X --description "Enable X11 forwarding"
complete -c unssh -s L --description "Locally forwarded ports"
complete -c unssh -s R --description "Remotely forwarded ports"
complete -c unssh -s D --description "Dynamic port forwarding"

# Since unssh runs subcommands, it can accept any switches
complete -c unssh -u
