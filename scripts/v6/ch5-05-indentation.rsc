# ch5-05-indentation.rsc

# Create an if-else statement with no additional indentation
:local DayOfWeek "Monday";

if ($DayOfWeek = "Monday") do={
    :put "Boo...it's Monday.";
} else={
    :put "Yay! It's not Monday!";
}