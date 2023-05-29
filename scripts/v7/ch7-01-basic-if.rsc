# filename: ch7-01-basic-if.rsc

# Print a greeting
:put "Hello, I hope you're well.";

# Check if the time is after 6pm (get time in 21:46:04 format)
:local CurrentTime [/system clock get time];
:put "The current time is : $CurrentTime";

# Say good evening if time is after 18:00
:if ($CurrentTime > 18:00) do={
    :put "Good evening!";
}

# Say goodbye
:put "Thanks for visiting, bye!";