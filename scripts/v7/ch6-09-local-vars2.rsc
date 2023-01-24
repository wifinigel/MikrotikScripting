# filename: ch6-09-local-vars2.rsc

# Create a local variable that is an array of words
:local Words { "Hello, "; "how "; "are "; "you ?"};

# Create a local variable to store concatenated words in a string
:local WordString;

# Step through each word and add to the "WordString" variable
:foreach Word in=$Words do={
    :put "Word from array: $Word";
    :set WordString ($WordString . $Word);
}

# Print out the result
:put "\n";
:put "New string we've built:";
:put $WordString;
:put "\n";
:put ("Original array: " . [:tostr $Words]);
