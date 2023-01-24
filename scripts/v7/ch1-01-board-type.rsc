# filename: ch1-01-board-type.rsc

# A simple script to print your Mikrotik board type

:local BoardType [/system/resource get board];
:put "Your Mikrotik board type is : $BoardType";
