# filename: ch7-07-nested-if-statements.rsc

# Get the current time
:local CurrentTime [:system clock get time];
:put "The current time is : $CurrentTime";

# declare the time of day variable
:local TimeOfDay

# Check if it's before noon
:if ($CurrentTime < 12:00) do={
    
    # it's before noon, let's see what time of the morning
    # it is using a nested if-else statement
    if ($CurrentTime < 06:00) do={
        :set TimeOfDay "It's very early in the morning...shouldn't you be in bed?";
    } else={
        # it must be between 06:01 and 11:59 to reach here
        :set TimeOfDay "Good morning!";
    }
    # end of nested if-else statement

} else={

    # it must be after noon, let's see if it's evening or
    # afternoon using a nested if-else statement
    if ($CurrentTime < 18:00) do={
        :set TimeOfDay "Good afternoon!";
    } else={
        # it must be between 18:00 and 23:59 to reach here
        :set TimeOfDay "Good evening!";
    }
    # end of nested if-else statement

}

:put $TimeOfDay;