# filename: ch6-06-local-scope.rsc

# ---- start of a local scope ----
{
    :local apple "green";
    :local banana "yellow";
    :put ("(1) The apple is: $apple");
    :put ("(1) The banana is: $banana");

    # ---- start of child local scope ----
    {
        :local apple "red"; 
        :put ("(2) The apple is: $apple");
        :put ("(2) The banana is: $banana");
    }   
    # ---- end of child local scope ----

    :put ("(3) The apple is: $apple");
    :put ("(3) The banana is: $banana");

}   
# ---- end of local scope ----

:put ("(4) The apple is: $apple");
:put ("(4) The banana is: $banana");

# ---- start of new local scope ----
{   
    :local apple "yellow";
    :put ("(5) The apple is: $apple");
    :put ("(5) The banana is: $banana");
}   
# ---- end of new local scope ----