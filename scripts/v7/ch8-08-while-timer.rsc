# ch8-08-while-timer.rsc

# script to report page load time of google.com

# get the current time
:local CurrentTime [/system/clock get time];

# calculate the time in 1 minute
:local EndTime ($CurrentTime + 00:01:00);

# define a target web site
:local WebSite "www.google.com";

# run a while loop until one minute interval expired
:while ( [/system/clock get time] < $EndTime ) do={

    :put "Getting web page from $WebSite";

    # fetch a page from web site
    :local FetchResult [/tool fetch url=("https://$WebSite") mode=https \
        http-method=get as-value keep-result=no];
    
    if ($FetchResult->"status" = "finished") do={
        # print out how long page retrieval took (if successful)
        :local FetchDuration ($FetchResult->"duration");
        :put "Web page fetch time: $FetchDuration secs";
    } else={
        :put "Web page fetch failed";
    }

    # pause for 5 seconds
    :delay 5;

}
