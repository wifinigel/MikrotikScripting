# filename: ch6-12-global-vars3.rsc

# In this script, we expect to have several interface names
# in a global variable called "WanInterfaces". The variable
# should be an array for the script to work correctly

# Declare the "WanInterfaces" global variable to access
# its data (assuming it exists)
:global WanInterfaces;

# Does it have a value? If not, exit with an error
if ( [:typeof $WanInterfaces] = "nothing") do={
    :error "The WanInterfaces global variable is not set. Exiting"
}

# Is the variable an array data type?
if ( [:typeof $WanInterfaces] != "array") do={
    :error "The WanInterfaces global variable is not an array data \
        type. Exiting."
}

# Let's step through the interfaces in the array 
# and print out their operation status
:foreach WanInterface in=$WanInterfaces do={  
    :local InterfaceId [/interface ethernet find name=$WanInterface];
    
    :local UpDown "down";
    if ([/interface ethernet get $InterfaceId]->"running") do={
        :set UpDown "up"
    }

    :put "Interface $WanInterface is currently $UpDown";
}

# Let's assume no-one else will need the "WanInterfaces"
# variable. Let's remove it from global variables
:set WanInterfaces;

