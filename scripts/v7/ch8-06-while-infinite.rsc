# filename: ch8-06-while-infinite.rsc

# Let's create an infinite loop using "while"

:local LoopCounter 5;

:while ($LoopCounter <= 10) do={

    # print out the current loop counter value
    :put "Value of loop counter is: $LoopCounter";

    # decrement the counter
    :set LoopCounter ($LoopCounter - 1);

    # add in a pause to prevent cpu thrashing
    :delay 1;
}

# print a message when/if the loop exits
:put "Loop has exited!";