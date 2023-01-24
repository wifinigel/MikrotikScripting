# filename: ch10-02-bad-script.rsc
#
# A simple script to perform a series of tests on a
# list of web sites.  

# define list of websites to test
:local w {"mikrotik.com"; "www.google.com"; "twitter.com"};

# step through each website and perform various tests
:foreach s in=$w do={

    # try a DNS resolution of this site
    :local i [/resolve $s];

    # try pinging the IP address of this site
    :local p [/ping $i count=3 ];

    # try fetching the web page of this site
    :local u [/tool fetch url=("https://$s") mode=https http-method=get \
        as-value keep-result=no];

    # print out a summary report for this site
    :put "==========================================";
    :put ("Site: $s");
    :put ("IP Address = $i");
    :put ("Ping success = $p/3");
    :put ("Page d/load duration: " . $u->"duration"); 
    :put "===========================================";
} 
