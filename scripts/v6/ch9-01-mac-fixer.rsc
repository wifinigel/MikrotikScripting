# filename: ch9-01-mac-fixer.rsc

# Let's create function to remove colon characters
# from a MAC address passed as an argument

# --- start of function ---
:global MacColonRemoveFunc do={
   :local TidyMac "";
   for i from=0 to=([:len $1]-1) do={ 
      :local TmpValue [:pick $1 $i];
      :if ($TmpValue !=":") do={ :set TidyMac "$TidyMac$TmpValue" }
   }
   :return $TidyMac;
}
# --- end of function ---

# Now, let's call the function with some values
:local MacAddress "00:08:EF:44:98:18"
:put ("$MacAddress becomes: " . [$MacColonRemoveFunc $MacAddress]);

:set MacAddress "DC:2C:6E:DF:D5:F6"
:put ("$MacAddress becomes: " . [$MacColonRemoveFunc $MacAddress]);

# Cleanup global namespace
:set MacColonRemoveFunc;
