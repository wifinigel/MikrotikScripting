# filename: ch7-03-if-else.rsc

# Print a greeting
:put "Hello, I hope you're well.";

# Check if the time is after 6pm (get time in 21:46:04 format)
:local CurrentTime [:system clock get time];
:put "The current time is : $CurrentTime";

# Say good morning if time is before 12:00
:if ($CurrentTime > 12:00) do={
    :put "Good day!";
} else={
    :put "Good morning!";
}

# Say goodbye
:put "Thanks for visiting, bye!";