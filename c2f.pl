# $language = "PerlScript"
# $interface = "1.0"

# A temperature conversion script using Perlscript.

use Win32::OLE;
Win32::OLE->Option(Warn => 3);

#Grab selected text
$ctemp = $crt->Screen->Selection;

#Calculate F from C
$ftemp = 9/5 * $ctemp + 32;

#Pop up a message box with the F temp
$crt->Dialog->MessageBox("Selected Temp:\t$ctemp C\nConverted Temp:\t$ftemp F","Temp:",64);