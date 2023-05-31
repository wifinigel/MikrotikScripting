# filename: ch10-07-bad-script.rsc
#
# A simple script to perform a series of tests on a
# list of web sites.

:global Filename "ch10-07-bad-script.rsc"

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

    # check arg type str of correct length passed
    :if (([:typeof $WebSiteName] != "str") or \
            ([:len value=$WebSiteName] < 6)) do={
        $LogMessageFunc ("DnsResolveFunc: arg value $WebSiteName not \
            a valid string!");
        
        :return "*** test failed ***";
    }

    # try a name lookup
    :do {
        return [:resolve $WebSiteName];
    } on-error={
        $LogMessageFunc ("DnsResolveFunc: name resolution failed for \
            site: $WebSiteName!");
        :return "*** test failed ***";
    }
}

# function to ping an IP address 3 times
:global PingIpAddressFunc do={
    :local IpAddress $1;
    :global LogMessageFunc;

    # check arg type ip is passed
    :if ([:typeof $IpAddress] != "ip") do={
        $LogMessageFunc ("PingIpAddressFunc: arg value $IpAddress not \
            an IP address!");
        :return "*** test failed ***";
    }
    
    # try a ping
    :do {
        return [/ping $IpAddress count=3];
    } on-error={
        $LogMessageFunc ("PingIpAddressFunc: ping test failed: \
            $IpAddress !");
        :return "*** test failed ***";
    }
}

# function to return the result of fetching a web page
:global GetWebPageFunc do={
    :local SiteName $1;
    :global LogMessageFunc;

    # check arg type str of correct length passed
    :if (([:typeof $SiteName] != "str") or \
        ([:len value=$SiteName] < 6)) do={
        $LogMessageFunc ("GetWebPageFunc: arg value $SiteName not a \
            valid string!");
        :return "*** test failed ***";
    }

    # try to get web page
    :do {
        :return [/tool fetch url=("https://$SiteName") mode=https \
            http-method=get as-value keep-result=no];
    } on-error={
        $LogMessageFunc ("GetWebPageFunc: unable to retrieve site: \
            $SiteName !");
        :return { "duration"="*** test failed ***" }
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
:set LogMessageFunc;
:set DnsResolveFunc;
:set PingIpAddressFunc;
:set GetWebPageFunc;
:set Filename;
