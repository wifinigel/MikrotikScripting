# filename: ch6-11-global-vars2.rsc

# Lets get a dump of our current global variables:
:environment print;

# Let's declare a new global variable
:global Beverage "coffee";

# Let's declare global vars that already exist so that
# we may access them
:global Fruit;
:global TellTheTruth;

# Let's print modify the vars if we no not
# wish to tell the truth
if ($TellTheTruth = false) do={
    :set Fruit "bananas";
    :set Beverage "beer";
}

# Let's see which are my favourite fruit and 
# beverage
:put "My favourite fruit is: $Fruit";
:put "My favourite beverage is: $Beverage";

if ($TellTheTruth = false) do={
    :put "(pssst...this is actually a lie)";
}

# Lets get a dump of our current global variables:
:put "\nCurrent global variables:\n";
:environment print;
