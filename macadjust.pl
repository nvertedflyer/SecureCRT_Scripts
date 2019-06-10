# $language = "PerlScript"
# $interface = "1.0"

#This script takes a mac address from the clipboard
#and converts it to Cisco format, then pastes it into
#the active session.  If anything other than a mac is
#in the clipboard, raise an error to the user.

use Win32;
use Win32::Clipboard;

use Win32::OLE;
Win32::OLE->Option(Warn => 3);

$clip = Win32::Clipboard();
$c = $clip->Get();
$c =~ s/://gm;
$c =~ s/-//gm;	
$c =~ s/(\w{4})(\w{4})(\w{4})/$1.$2.$3/gm;
$c = lc $c;

if ($c !~ /\w{4}.\w{4}.\w{4}/)
{
   $crt->Dialog->MessageBox("Error, No MAC address in clipboard!","Error:",);
}
else
{
   $crt->Screen->Send("$c");
}