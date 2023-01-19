# filename: ch8-09-while-alt-form.rsc

# Let's create a loop using "while"

:local LoopCounter 5;

:do {

    # print out the current loop counter value
    :put "Value of loop counter is: $LoopCounter";

    # increment the counter
    :set LoopCounter ($LoopCounter + 1);

} while ($LoopCounter <= 4) 

# print a message when/if the loop exits
:put "Loop has exited!";