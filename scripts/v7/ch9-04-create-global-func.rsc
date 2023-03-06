# filename: ch9-04-create-global-func.rsc

# function to remove spaces from a string
#
# e.g. :local NoSpaceVar [$RemoveSpaceFunc "string with spaces"]
#
:global RemoveSpaceFunc do={
   :local NewName ""
   for CharNumber from=0 to=([:len $1]-1) do={ 
      :local Tmp [:pick $1 $CharNumber]
      :if ($Tmp !=" ") do={ :set NewName "$NewName$Tmp" }
   }
   :return $NewName
}
# --- end of function ---