# $language = "PerlScript"
# $interface = "1.0"

# A subnet calc script using Perlscript.

#Use Win32 to create a message box
use Win32::OLE;
Win32::OLE->Option(Warn => 3);

#Use the Net-Netmask module for subnetting
#More info at https://metacpan.org/pod/release/MUIR/Net-Netmask-1.9015/Netmask.pod
#Use ppm: https://www.activestate.com/blog/how-install-cpan-modules-activeperl/
use Net::Netmask;

#Grad screen selection
$ip = $crt->Screen->Selection;

#If user grabbed an IP address and mask, get the subnet info
if ($ip=~m/(\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3})\s(\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3})/)
{

#Use the info grabbed above to supply the IP and mask to the module
$block = new Net::Netmask ($1, $2);

#Parse return into variables
$base = $block->base() ;
$mask = $block->mask() ;
$hmask = $block->hostmask() ;
$bits = $block->bits() ;
$size = $block->size() ;
$mb = $block->maxblock();
$bc = $block->broadcast();

#Print said variables in an informational message box with an okay button
$crt->Dialog->MessageBox(" Subnet Address:\t\t$base\n\n Broadcast Address:\t$bc\n\n Subnet Mask:\t\t$mask\n\n Wildcard:\t\t$hmask\n\n Bits:\t\t\t$bits\n\n Number of hosts:\t\t$size\n\n CIDR:\t\t\t$1/$bits","Subnet Info",64);
}