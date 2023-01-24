# filename: ch8-04-foreach-web.rsc

# define an array of web sites
:local WebSites {"mikrotik.com"; "google.com"; "twitter.com"};

# use a foreach loop to check if each site is reachable
:foreach Site in=$WebSites do={

    :put "Pinging web site: $Site";

    :local PingResult [/ping $Site count=3 ];

    :if ($PingResult > 0) do {
        :put ("\nWeb site $Site reached OK\n");
    } else={
        :put ("\nNo response from web site: $Site\n");
    }
}