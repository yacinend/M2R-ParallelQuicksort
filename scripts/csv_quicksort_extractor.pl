
use strict;

my($line);
my($size);
my($compil);

print "Size, Compilation, Type, Time\n" ;
while($line=<>) {
    chomp $line;
    if($line =~/^Size: ([\d\.]*)$/) {
        $size = $1;
        next;
    } 
     if($line =~/^Compilation: (.*)/) {
        $compil = $1;
        next;
    }
    if($line =~/^(.*) quicksort.*: ([\d\.]*) sec.$/) {
        print "$size, \"$compil\", \"$1\", $2\n" ;
        next;
    } 
}
