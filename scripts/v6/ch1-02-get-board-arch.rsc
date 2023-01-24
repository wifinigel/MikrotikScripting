# filename: ch1-02-get-board-arch.rsc

# A simple script to print your Mikrotik board architecture

:local ArchitectureName [/system resource get architecture-name];
:put "Your Mikrotik board architecture is : $ArchitectureName";