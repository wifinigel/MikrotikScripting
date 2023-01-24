# filename: ch8-05-foreach-kv.rsc

# define an array of interface data
:local InterfaceErrors {"WAN"=514; "LAN"=0; "ether3"=0; "ether4"=0; 5};

# use a foreach loop to print out the error value for each interface
:foreach InterfaceName,ErrorCounter in=$InterfaceErrors do={
    :put "$InterfaceName errors: $ErrorCounter";
}