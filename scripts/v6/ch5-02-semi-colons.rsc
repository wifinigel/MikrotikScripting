# ch5-02-semi-colons.rsc

:local MULTIPLIER 10;

:for Number from=1 to=10 do={
    :local Result ($Number * $MULTIPLIER);
    :put ("This is an unusually long line. Here is the result $Number times \
    $MULTIPLIER is: $Result");
}
