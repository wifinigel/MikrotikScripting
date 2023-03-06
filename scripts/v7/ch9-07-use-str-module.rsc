# filename: ch9-07-use-str-module.rsc

# import the functions we need and declare the functions
# names we wish to use
/import "ch9-06-str-funcs-mod.rsc"
:global RemoveSpaceFunc;
:global ChopStrFunc;

# check our function names are valid
if ([:typeof $RemoveSpaceFunc] != "array") do={
    :error "RemoveSpaceFunc is wrong data type or does not exist.";
}

if ([:typeof $ChopStrFunc] != "array") do={
    :error "ChopStrFunc is wrong data type or does not exist.";
}

# create a string to use with the functions
:local StringToModify "txBroadcast = 201,";

# print original string
:put ("Orignal string: $StringToModify");

# use both functions to modify the string
:local ModifiedString [$RemoveSpaceFunc $StringToModify];
:set ModifiedString [$ChopStrFunc $ModifiedString];
:put ("Modified string: $ModifiedString");

# tidy up the global namespace (optional)
:set RemoveSpaceFunc;
:set ChopStrFunc;
