# filename: ch10-05-error-check.rsc
:local WebSites { "badname1234.com"; "google.com"};

:foreach SiteName in=$WebSites do={
    :local SiteIpAddress [:resolve $SiteName];
    :put "Site IP for $SiteName is $SiteIpAddress";
}
