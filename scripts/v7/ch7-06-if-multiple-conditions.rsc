# filename: ch7-06-multiple-conditions.rsc

# Get the current time
:local CurrentTime [:system clock get time];
:put "The current time is : $CurrentTime";

# declare the time of day variable
:local TimeOfDay;

# Check if it's very early
:if (($CurrentTime >= 00:00) and ($CurrentTime < 06:00)) do={
    :put "It's very early in the morning...shouldn't you be in bed?";
}

# Check if its morning
:if (($CurrentTime >= 06:00) and ($CurrentTime < 12:00)) do={
    :put "Good morning!";
}

# Check if its afternoon
:if (($CurrentTime >= 12:00) and ($CurrentTime < 17:00)) do={
    :put "Good afternoon!";
}

# check if its evening
:if (($CurrentTime >= 17:00) and ($CurrentTime < 00:00)) do={
    :put "Good evening!";
}
