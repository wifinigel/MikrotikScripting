# ch8-08-while-timer.rsc

# script to report page load time of google.com

# get the current time
:local CurrentTime [/system clock get time];

# calculate the time in 1 minute
:local EndTime ($CurrentTime + 00:01:00);

# define a target web site
:local WebSite "www.google.com";

# run a while loop until one minute interval has expired
:while ( [/system/clock get time] < $EndTime ) do={

    :put "Getting web page from $WebSite";

    # fetch a page from web site
    :local FetchResult;
    :local TimeTaken [:time {
        :set FetchResult [/tool fetch url=("https://$WebSite") \
            mode=https http-method=get as-value keep-result=no];
    }];
    
    if ($FetchResult->"status" = "finished") do={
        # print out how long page retrieval took (if successful)
        :put "Web page fetch time: $TimeTaken secs";
    } else={
        # print failure message if fetch failed
        :put "Web page fetch failed";
    }

    # pause for 5 seconds
    :delay 5;
}
:put "One minute period has ended!"

