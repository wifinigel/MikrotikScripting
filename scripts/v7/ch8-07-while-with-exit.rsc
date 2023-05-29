# filename: ch8-07-while-with-exit.rsc

# Let's create a loop using "while"

:local LoopCounter 5;

:while ($LoopCounter <= 10) do={

    # print out the current loop counter value
    :put "Value of loop counter is: $LoopCounter";

    # increment the counter
    :set LoopCounter ($LoopCounter + 1);
}

# print a message when/if the loop exits
:put "Loop has exited!";