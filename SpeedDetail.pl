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

$fsizeK = $fsize / 1024;
$fsizeM = $fsize / (1024 * 1024);
$fsizeG = $fsize / (1024 * 1024 * 1024);
$fsizeKs = sprintf("%.0f",$fsizeK);
$fsizeMs = sprintf("%.0f",$fsizeM);
$fsizeGs = sprintf("%.0f",$fsizeG);

$hrfsizeGs = reverse $fsizeGs;
$hrfsizeGs =~ s/(\d\d\d)(?=\d)(?!\d*\.)/$1,/g;
$hrfsizeGs = reverse $hrfsizeGs;

$hrfsizeMs = reverse $fsizeMs;
$hrfsizeMs =~ s/(\d\d\d)(?=\d)(?!\d*\.)/$1,/g;
$hrfsizeMs = reverse $hrfsizeMs;

$hrfsizeKs = reverse $fsizeKs;
$hrfsizeKs =~ s/(\d\d\d)(?=\d)(?!\d*\.)/$1,/g;
$hrfsizeKs = reverse $hrfsizeKs;

$crt->Dialog->MessageBox("     Bits Seperated:\t\t\t$hrfsize\n\n     Kbps Rounded:\t\t\t$hrfsizeKs\n\n     Mbps Rounded:\t\t$hrfsizeMs\n\n     Gbps Rounded:\t\t$hrfsizeGs","Human Speeds:",64);