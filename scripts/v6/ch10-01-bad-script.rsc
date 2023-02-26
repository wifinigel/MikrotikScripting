# filename: ch10-01-bad-script.rsc

:local w {"mikrotik.com"; "www.google.com"; "twitter.com"};

:foreach s in=$w do={
    :local i [:resolve $s];
    :local p [/ping $i count=3 ];
    :local u [/tool fetch url=("https://$s") mode=https http-method=get \
        as-value keep-result=no];

    :put "==========================================";
    :put ("Site: $s");
    :put ("IP Address = $i");
    :put ("Ping success = $p/3");
    :put ("Page d/load duration: " . $u->"duration"); 
    :put "===========================================";
} 
