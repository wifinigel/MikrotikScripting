# filename: ch7-09-if-binary-simplified.rsc

# define WAN interface name
:local WanInterfaceName "ether1-WAN";

# find the interface index
:local InterfaceIndex [/interface ethernet find name=$WanInterfaceName];
    
:local UpDown "down";
if ([:interface ethernet get $InterfaceIndex]->"running") do={
    :set UpDown "up"
}

:put "Interface $WanInterface is currently $UpDown";