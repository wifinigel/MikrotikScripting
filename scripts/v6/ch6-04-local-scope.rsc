# ---- global scope start ----
# filename: ch6-04-local-scope.rsc

# Let's create a variable in the global scope
:local GlobalScopeVar "I'm in the global scope!";

{
    # ---- start of a local scope ----

    # Let's create a variable in this scope
    :local LocalScopeVar "I'm in the local scope!";

    # Let's print out the variable in this scope
    :put ("Local scope variable contents = $LocalScopeVar");

    # ---- end of local scope ----
}

# Let's print it out the global scope variable
:put ("Global scope variable contents = $GlobalScopeVar");

# Let's print out the local scope variable
# (hint: this won't work)
:put ("Local scope variable contents = $LocalScopeVar");

# ---- global scope end ----