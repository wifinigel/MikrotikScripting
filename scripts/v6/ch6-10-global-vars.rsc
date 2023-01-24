# filename: ch6-10-global-vars.rsc

# Note: this script assumes global vars $Day,
# $Month and $Year have been set via the CLI
#
# Let's get a dump of our current global variables:
:environment print;

# Let's check we can access each variable:
:put "The day today is $Day";
:put "The month today is $Month";
:put "The year today is $Year";

# Uh-oh...we had an issue, no values were printed!
:put "\nThat didn't work!\n";

# To access global variables declared outside our script
# we need to declare them again within our script, but do
# not assign a value when declaring them:
:global Day;
:global Month;
:global Year

# Let's try printing them again:
:put "The day today is $Day";
:put "The month today is $Month";
:put "The year today is $Year";

# Let's declare a new global variable to
# access outside of this script:
:global TimeOfDay "morning";
:global Breakfast "muesli";

# Lets get a dump of our current global variables:
:put "\nCurrent global variables:\n";
:environment print;
