# ch10-06-error-check.rsc
:local WebSites { "badname1234.com"; "google.com"};
:foreach SiteName in=$WebSites do={
    :do {
        :local SiteIpAddress [/resolve $SiteName];
        :put "Site IP for $SiteName is $SiteIpAddress";
    } on-error {
        :put "Name lookup failed for $SiteName"
    }
}