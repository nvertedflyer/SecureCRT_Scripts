# $language = "PerlScript"
# $interface = "1.0"

# Break up large file sizes in human readable format.
#This script is ugly and I feel bad for writing it, but not
#bad enough to delete it.  Deal with it.

use Win32::OLE;
Win32::OLE->Option(Warn => 3);

$fsize = $crt->Screen->Selection;

$hrfsize = reverse $fsize;
$hrfsize =~ s/(\d\d\d)(?=\d)(?!\d*\.)/$1,/g;
$hrfsize = reverse $hrfsize;

$crt->Dialog->MessageBox("     Bits Seperated:\t\t\t$hrfsize\n\n","Human Readable Number:",64);