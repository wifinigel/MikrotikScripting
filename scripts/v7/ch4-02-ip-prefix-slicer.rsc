# ch4-02-ip-prefix-slicer.rsc

# Create a function to slice up an IP prefix
:global IpPrefixSlicerFunc do={
	:local InterfaceIp ([/ip/address get $1]->"address");
	:local SlashPosition [:find $InterfaceIp "/"];
	:local IpAddress [:pick $InterfaceIp 0 $SlashPosition];
	:return [:toip $IpAddress]
}

# Run the function for ID *1 and verify data type of result
:local IpAddress [$IpPrefixSlicerFunc *1];
:put ("Result: $IpAddress");
:put ("Data type: " . [:typeof $IpAddress]);