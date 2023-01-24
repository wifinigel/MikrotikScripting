:global Filename "ch10-08-bad-script.rsc"
# A script to perform a series of tests on a
# list of web sites.

# set DEBUG to "true" for script debugging output,
# "false" for normal operation
:global DEBUG false;

# debug function
:global DebugFunc do={
    :global DEBUG;
    :if ($DEBUG) do={ :put "**Debug: $1";     }
}

# function to log error messages
:global LogMessageFunc do={
    :global Filename;
    :local ErrorMessage "$Filename: $1";
    
    :log error $ErrorMessage;
    :put $ErrorMessage; # print to CLI
}

# function to DNS resolve a site name to IP
:global DnsResolveFunc do={
    :local WebSiteName $1;
    :global LogMessageFunc;
    :global DebugFunc;

    $DebugFunc "Entering DnsResolveFunc";
    $DebugFunc ("Arg passed to func: $WebSiteName");

        # check arg type str of correct length passed
        $DebugFunc "Checking arg data type is correct";

        :if (([:typeof $WebSiteName] != "str") or \
                    ([:len value=$WebSiteName] < 6)) do={
            :local ErrorMsg "DnsResolveFunc: arg value $WebSiteName not a valid \
                string!";
            $LogMessageFunc $ErrorMsg;
            $DebugFunc $ErrorMsg; 
            :return "*** test failed ***";
        } else={
            $DebugFunc "Data type looks good";
        }

    :do {
        $DebugFunc "Looking up IP of site name...";
        :local SiteIpAddr [/resolve $WebSiteName];
        $DebugFunc $SiteIpAddr;
        :return $SiteIpAddr;
    } on-error={
        $DebugFunc "DNS lookup failed!";
        $LogMessageFunc ("DnsResolveFunc: name resolution failed for site: \
            $WebSiteName!");
        :return "*** test failed ***";
    }
}

# function to ping an IP address 3 times
:global PingIpAddressFunc do={
    :local IpAddress $1;
    :global LogMessageFunc;

    # check arg type ip is passed
    :if ([:typeof $IpAddress] != "ip") do={
        $LogMessageFunc ("PingIpAddressFunc: arg value $IpAddress not an IP \
            address!");
        :return "*** test failed ***";
    }
    
    :do {
        return [/ping $IpAddress count=3];
    } on-error {
        $LogMessageFunc ("PingIpAddressFunc: ping test to IP address failed: \
            $IpAddress !");
        :return "*** test failed ***";
    }
}

# function to return the result of fetching a web page
:global GetWebPageFunc do={
    :local SiteName $1;
    :global LogMessageFunc;

    # check arg type str of correct length passed
    if (([:typeof $SiteName] != "str") or ([:len value=$SiteName] < 6)) do={
        $LogMessageFunc ("GetWebPageFunc: arg value $SiteName not a valid \
            string!");
        :return { "duration"="*** test failed ***" };
    }

    do {
        return [/tool fetch url=("https://$SiteName") mode=https http-method=get \
        as-value keep-result=no];
    } on-error {
        $LogMessageFunc ("GetWebPageFunc: unable to retrieve site: $SiteName !");
        return { "duration"="*** test failed ***" };
    }
}

##########
# Main
##########

# define list of websites to test
:local WebSites { "badsite1234.com"; "www.google.com"; "twitter.com"};

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
:set Filename;
:set LogMessageFunc;
:set DnsResolveFunc;
:set PingIpAddressFunc;
:set GetWebPageFunc;
:set DEBUG;
:set DebugFunc;
