# filename: ch9-06-str-funcs-mod.rsc

# function to remove spaces from a string
#
# e.g. :local NoSpaceVar [$RemoveSpaceFunc "string with spaces"]
#
:global RemoveSpaceFunc do={
   :local NewName ""
   for i from=0 to=([:len $1]-1) do={ 
      :local Tmp [:pick $1 $i]
      :if ($Tmp !=" ") do={ :set NewName "$NewName$Tmp" }
   }
   :return $NewName
}
# --- end of function ---

# function to remove last char from a string
#
# e.g. :local ChoppedVar [$ChopStrFunc "string with extra char,"]
#
:global ChopStrFunc do={
   :return [ :pick $1 0 ( [ :len $1 ] -1 ) ];
}
# --- end of function ---