# filename: ch7-02-basic-if.rsc

# Create a variable for the WAN interface name
:local WanInterface "ether1-WAN";

# Create a variable for the number of pings we'd like to send
:local PingCount 10;

# Create a variable for the destination on the Internet to ping
:local DestinationAddress 8.8.8.8;

# Let's try a ping to the Internet across the WAN interface
:local WanPingCount [/ping $DestinationAddress interface=$WanInterface \
    count=$PingCount];

# Let's log the result of our Internet connection test
if ( $WanPingCount = $PingCount) do={
    :log info "The Internet is up.";
}

if ( $WanPingCount = 0) do={
    :log error "The Internet is down.";

}

if ( ($WanPingCount < $PingCount) and ($WanPingCount > 0) ) do={   
    :log warning "The Internet connection may be degraded. (Ping \
        result: $WanPingCount/$PingCount)";
}
