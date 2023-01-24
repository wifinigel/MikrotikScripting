# filename: ch8-01-for-basic.rsc

# Let's print out a series of numbers and part of
# the 12 times table
:for LoopCount from=1 to=5 do={

    :put ("Current loop counter is: $LoopCount");
    :put ("12 x $LoopCount is: " . (12 * $LoopCount));
}

# Print out the final loop count (fails!)
:put ("Final loop count is: " . $LoopCount);
