# filename: ch7-08-if-else-binary.rsc

# define WAN interface name
:local WanInterfaceName "ether1-WAN";

# find the interface index
:local InterfaceIndex [/interface/ethernet find name=$WanInterfaceName];
    
:local UpDown;

if ([:interface ethernet get $InterfaceIndex]->"running") do={
    :set UpDown "up";
} else={
    :set UpDown "down";
}

:put "Interface $WanInterfaceName is currently $UpDown";