# ch6-02-undeclared-variable.rsc

# Declare a variable but assign no value
:local RouteDistance;

# Let's test the data type of the variable
:if ([:typeof $RouteDistance] = "nothing") do={
    :put "Test 1: this variable has no value!";      
}

# Let's test the data type of a non-existent variable
:if ([:typeof $RouteDist] = "nothing") do={
    :put "Test 2: this variable has no value!";      
}
