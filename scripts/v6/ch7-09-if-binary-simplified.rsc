# filename: ch7-09-if-binary-simplified.rsc

# define WAN interface name
:local WanInterfaceName "ether1-WAN";

# find the interface index
:local InterfaceId [/interface ethernet find name=$WanInterfaceName];
    
:local UpDown "down";
if ([:interface ethernet get $InterfaceId]->"running") do={
    :set UpDown "up"
}

:put "Interface $WanInterface is currently $UpDown";