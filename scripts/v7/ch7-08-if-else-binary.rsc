# filename: ch7-08-if-else-binary.rsc

# define WAN interface name
:local WanInterfaceName "ether1-WAN";

# find the interface ID
:local InterfaceId [/interface/ethernet find name=$WanInterfaceName];
    
:local UpDown;

if ([/interface ethernet get $InterfaceId]->"running") do={
    :set UpDown "up";
} else={
    :set UpDown "down";
}

:put "Interface $WanInterfaceName is currently $UpDown";