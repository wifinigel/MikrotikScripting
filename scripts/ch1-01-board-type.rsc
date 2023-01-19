
# A simple script to print your Mikrotik board type

:local boardType [/system resource get board]
:put "Your Mikrotik board type is : $boardType"
