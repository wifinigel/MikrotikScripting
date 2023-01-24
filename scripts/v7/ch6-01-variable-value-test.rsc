# ch6-01-variable-value-test.rsc

# Declare a variable with no value
:local BridgeName;

# Test if the variable has a value
:if ([:typeof $BridgeName] = "nothing") do={
    :put "Test 1: this variable has no value!";      
} else= {
    :put ("Test 1: the variable value is: $BridgeName");
}

# Set a value for the variable
:set BridgeName "Bridge1";

# Test if the variable has a value
:if ([:typeof $BridgeName] = "nothing") do={
    :put "Test 2: this variable has no value!";      
} else= {
    :put ("Test 2: the variable value is: $BridgeName");
}