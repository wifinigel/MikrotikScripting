# ch4-01-bad-ip-data-type.rsc

# Assign an IP address to a variable
:local InterfaceIp "192.168.99.2";

# Print out the variable contents
:put "The interface IP address in \$InterfaceIp is: $InterfaceIp";

# It looks like an IP address - let's check to make sure
:put ("The variable data type of \$InterfaceIp is: ". [:typeof $InterfaceIp]);

# Hmmmm...looks like we need to fix it
:local InterfaceIp [:toip $InterfaceIp];

# Let's print the fixed variable
:put "The interface IP address in \$InterfaceIp is now: $InterfaceIp";

# Let's check its data type
:put ("The variable data type of \$InterfaceIp is now: ". [:typeof $InterfaceIp]);