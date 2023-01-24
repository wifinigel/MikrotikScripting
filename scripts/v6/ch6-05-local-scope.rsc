# ---- global scope start ----
# filename: ch6-05-local-scope.rsc

# Let's create a variable in the global scope
:local GlobalScopeVar "I'm in the global scope!";

{
    # ---- start of a local scope ----

    # Let's create a variable in this scope
    :local LocalScopeVar "I'm in the local scope!";

    # Let's print out the variable in this scope
    :put ("Local scope variable contents = $LocalScopeVar");

    # Let's see if we can access the global scope variable
    :put ("Global scope variable (in local scope) = $GlobalScopeVar");

    # ---- end of local scope ----
}

# Let's print out the global scope variable
:put ("Global scope variable (in global scope) = $GlobalScopeVar");

# ---- global scope end ----