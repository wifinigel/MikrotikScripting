# ch10-10-add-remove-vlans.rsc

# a script to add and remove 50 VLANs to/from
# a Mikrotik router interface

: for VlanId from 200 to 249 do={

    # find LAN interface ID
    :local LanInterface "ether2";
    :local LanInterfaceId [/interface find default-name=$LanInterface];

    # add VLAN to LAN interface
    :local VlanName "VLAN$VlanId";
    /interface/vlan add name="$VlanName" vlan-id=$VlanId \
        interface=$LanInterfaceId;
} 

: for VlanId from 200 to 249 do={

    # find LAN interface ID
    :local LanInterface "ether2";
    :local LanInterfaceId [/interface find default-name=$LanInterface];

    # add VLAN to LAN interface
    :local VlanName "VLAN$VlanId";
    /interface/vlan remove "$VlanName";
}