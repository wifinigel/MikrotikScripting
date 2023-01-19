# filename: ch7-05-if-else-vars2.rsc

# Get the current time
:local CurrentTime [:system clock get time];
:put "The current time is : $CurrentTime";

# declare the time of day variable
:local TimeOfDay

# Check if it's after noon
:if ($CurrentTime > 12:00) do={
    :set TimeOfDay "Afternoon/Evening"
} else={
    # otherwise, it must be morning (00:00 to 11:59)
    :set TimeOfDay "Morning"
}

# Print out the time of day
:put "At the moment, it's : $TimeOfDay"