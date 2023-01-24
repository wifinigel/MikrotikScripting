# filename: ch7-04-if-else-vars.rsc

# Get the current time
:local CurrentTime [:system clock get time];
:put "The current time is : $CurrentTime";

# Check if it's after noon
:if ($CurrentTime > 12:00) do={
    :local TimeOfDay "Afternoon/Evening";
} else={
    # otherwise, it must be morning (00:00 to 11:59)
    :local TimeOfDay "Morning";
}

# Print out the time of day
:put "At the moment, it's : $TimeOfDay";