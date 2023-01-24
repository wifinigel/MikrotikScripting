# filename: ch9-05-use-global-func.rsc

# declare the name of the global function we wish to use
# to make it available in our script
:global RemoveSpaceFunc;

# creates a string that contains spaces
:local StringWithSpaces "txBroadcast = 201";

# print original string
:put ("String with spaces: $StringWithSpaces");

# print string that is modified by function
:local StringNoSpaces [$RemoveSpaceFunc $StringWithSpaces];
:put ("String with no spaces: $StringNoSpaces");
