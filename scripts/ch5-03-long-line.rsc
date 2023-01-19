# filename: ch5-03-long-line.rsc

# Here is a long line
:put [/interface ethernet find where name~"ether" running true rx-fcs-error=0];

# Here is same line across multiple lines
:put [/interface ethernet find where \
    name~"ether" \                                     
    running true \
    rx-fcs-error=0];
