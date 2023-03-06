# filename: ch9-02-multiple-args-simple.rsc

# Let's create function to receive multiple args

# --- start of function ---
:global PrintInterfaceAttrsFunc do={

    :local InterfaceName $1;
    :local InterfaceSpeed $2;
    :local InterfaceIp $3;

    # check args are correct data types
    if ([:typeof $InterfaceName] != "str") do={
        :error "Interface name argument not a string!";
    }

    if ([:typeof $InterfaceSpeed] != "str") do={
        :error "InterfaceSpeed argument not a string!";
    }

    if ([:typeof $InterfaceIp] != "str") do={
        :error "Interface IP argument not a string!";
    }

    # data type checks passed, print the interface data
    :put "$InterfaceName: IP address = $InterfaceIp, speed = \
        $InterfaceSpeed"; 

}
# --- end of function ---

# Let's call the function with some sample values ($1, $2, $3)
$PrintInterfaceAttrsFunc "WAN1" "100Mbps" "192.168.99.1/24";

# Let's call the function with some other values ($1, $2, $3)
$PrintInterfaceAttrsFunc "ether2-LAN" "1000Mbps" "172.16.1.254/24";

# Cleanup global namespace
:set PrintInterfaceAttrsFunc;

