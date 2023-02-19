# filename: ch8-02-for-check-web.rsc

# define an array of web sites
:local WebSites {"mikrotik.com"; "google.com"; "twitter.com"};

# use a simple for loop to check if each site is reachable
:for SiteIndex from=0 to=2 do={

    :local Site ($WebSites->$SiteIndex);

    :put "Pinging web site: $Site";

    :local PingResult [/ping $Site count=3 ];
    :if ($PingResult > 0) do {
        :put "\nWeb site $Site reached OK\n";
    } else={
        :put "\nNo response from web site: $Site\n";
    }
}