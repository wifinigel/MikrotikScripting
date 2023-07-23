# filename: ch10-03-bad-script.rsc
#
# A simple script to perform a series of tests on a
# list of web sites.  

# define list of websites to test
:local WebSites {"mikrotik.com"; "www.google.com"; "twitter.com"};

# step through each website and perform various tests
:foreach SiteName in=$WebSites do={

    # try a DNS resolution of this site
    :local IpAddress [:resolve $SiteName];

    # try pinging the IP address of this site
    :local PingResult [/ping $IpAddress count=3];

    # try getting the web page of this site
    :local UrlFetch [/tool fetch url=("https://$SiteName") mode=https \
        http-method=get as-value keep-result=no];

    # print out a summary report for this site
    :put "==========================================";
    :put ("Site: $SiteName");
    :put ("IP Address = $IpAddress");
    :put ("Ping success = $PingResult/3");
    :put ("Page d/load duration: " . $UrlFetch->"duration"); 
    :put "===========================================";
} 
