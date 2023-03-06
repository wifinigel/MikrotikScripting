# filename: ch9-03-multiple-args-array.rsc

# Let's create function to receive a single array arg

# --- start of function ---
:global PrintInterfaceAttrsFunc do={

    # verify arg is correct type
    if ([:typeof $1] != "array") do={
        :error "Function argument is not an array!";
    }

    # extract values from array passed as arg 
    :local Args $1;
    :local InterfaceName ($Args->"ifname");
    :local InterfaceSpeed ($Args->"ifspeed");
    :local InterfaceIp ($Args->"ifip");

    # check args are correct data types
    if ([:typeof $InterfaceName] != "str") do={
        :error "InterfaceName argument not a string!";
    }

    if ([:typeof $InterfaceSpeed] != "str") do={
        :error "InterfaceSpeed argument not a string!";
    }

    if ([:typeof $InterfaceIp] != "str") do={
        :error "InterfaceIp argument not a string!";
    }

    # data type checks passed, print the interface data
    :put "$InterfaceName: IP address = $InterfaceIp, speed = \
        $InterfaceSpeed"; 
}
# --- end of function ---

# Let's call the function with some sample values in an array
:local Args { ifname="WAN1"; ifspeed="100Mbps"; \
    ifip="192.168.99.1/24" };
$PrintInterfaceAttrsFunc $Args;

# Let's call the function with some other values in an array
:set Args { ifname="ether2-LAN"; ifspeed="1000Mbps"; \
    ifip="172.16.1.254/24" };
$PrintInterfaceAttrsFunc $Args;

# Cleanup global namespace
:set PrintInterfaceAttrsFunc;
