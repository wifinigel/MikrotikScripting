# A simple script to print your Mikrotik board architecture

:local architectureName [/system resource get architecture-name]
#:put "Your Mikrotik board architecture is : $architectureName"
:log info "Your Mikrotik board architecture is : $architectureName"
