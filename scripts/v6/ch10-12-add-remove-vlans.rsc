# ch10-12-add-remove-vlans.rsc

# a script to add and remove 50 VLANs to/from
# a Mikrotik router interface

# find LAN interface ID
:local LanInterface "ether2";
:local LanInterfaceId [/interface find default-name=$LanInterface];

:local AddLoopTime [:time {
    :for VlanId from 200 to 249 do={

        # add VLAN to LAN interface
        :local VlanName "VLAN$VlanId";
        /interface vlan add name="$VlanName" vlan-id=$VlanId \
            interface=$LanInterfaceId;
    }
}];

:put "Add loop time: $AddLoopTime";

:local RemoveLoopTime [:time {
    :for VlanId from 200 to 249 do={

        # add VLAN to LAN interface
        :local VlanName "VLAN$VlanId";
        /interface vlan remove "$VlanName";
    }
}];

:put "Remove loop time: $RemoveLoopTime";