:local Filename "ch10-04-bad-script.rsc"
# A simple script to perform a series of tests on a
# list of web sites. 

# function to log error message
:global LogMessageFunc do={
    :global Filename;
    :local ErrorMessage ("$Filename: $1");
    
    :log error $ErrorMessage;
    :error $ErrorMessage;
}

# function to DNS resolve a site name to IP
:global DnsResolveFunc do={
    :local WebSiteName $1;
    :global LogMessageFunc;

    # check arg type str of correct length passed
    if (([:typeof $WebSiteName]!="str") or \
        ([:len value=$WebSiteName] < 6)) do={
        $LogMessageFunc ("DnsResolveFunc: arg value $WebSiteName not \
            a valid string!");
    }

    return [:resolve $WebSiteName];
}

# function to ping an IP address 3 times
:global PingIpAddressFunc do={
    :local IpAddress $1;
    :global LogMessageFunc;

    # check arg type ip is passed
    if ([:typeof $IpAddress] != "ip") do={
        $LogMessageFunc ("PingIpAddressFunc: arg value $IpAddress not \
            an IP address!");
    }

    return [/ping $IpAddress count=3];
}

# function to return the result of fetching a web page
:global GetWebPageFunc do={
    :local SiteName $1;
    :global LogMessageFunc;

    # check arg type str of correct length passed
    if (([:typeof $SiteName] != "str") or \
        ([:len value=$SiteName] < 6)) do={
        $LogMessageFunc ("GetWebPageFunc: arg value $SiteName not a \
            valid string!");
    }

    return [/tool fetch url=("https://$SiteName") mode=https \
        http-method=get as-value keep-result=no];
}

##########
# Main
##########

# define list of websites to test
:local WebSites { "mikrotik.com"; "www.google.com"; "twitter.com"};

# step through each website and perform various tests
:foreach SiteName in=$WebSites do={

    # try a DNS resolution of this site
    :local IpAddress [$DnsResolveFunc $SiteName];

    # try pinging the IP address of this site
    :local PingResult [$PingIpAddressFunc $IpAddress];

    # try getting the web page of this site
    :local UrlFetch [$GetWebPageFunc $SiteName];

    # print out a summary report for this site
    :put "==========================================";
    :put ("Site: $SiteName");
    :put ("IP Address = $IpAddress");
    :put ("Ping success = $PingResult/3");
    :put ("Page d/load duration: " . $UrlFetch->"duration"); 
    :put "===========================================";
}

# cleanup global namespace
:set LogMessageFunc;
:set DnsResolveFunc;
:set PingIpAddressFunc;
:set GetWebPageFunc;
