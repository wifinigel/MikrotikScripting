# ch8-03-for-create-vlan.rsc

# define the interface where we'd like to add a VLAN
# !! Set this to a valid interface name on your Mikrotik !!
:local InterfaceName "ether5";

# create a for loop with a step of 10
:for VlanId from=100 to=150 step=10 do={

    :put ("Creating VLAN $VlanId on interface $InterfaceName");
    :local VlanName ("vlan" . $VlanId);
    /interface vlan add name=$VlanName vlan-id=$VlanId \
        interface=$InterfaceName;
}

