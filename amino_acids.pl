use strict;

## open the file and discard the first line
open(PROTEIN, 'NP_068799.fasta'); 
<PROTEIN>;

##set up the hash
my %hash;
while(my $line = <PROTEIN>) {
    chomp $line;
    my @amino_acids = split ("", $line);
    foreach (@amino_acids) {
	$hash{$_}++;
    }
}

##First: print in alphabetical order
print "1. Amino acids and number of occurences, in alphabetical order\n";
# sort the keys of the hash to get aa in alphabetical order, then loop through
foreach (sort keys %hash) {
    print "\t$_ $hash{$_} \n";
}

##Second: print how many different aa appeared and which did not
print "2. Summary: \n";
#create a list of the 20 aa
my @all = qw/A R N D C E Q G H I L K M F P S T W Y V/;
#create a list to store those that did not appear
my @absent;
my $size = keys %hash;
#if some aa are not in the hash, add those to the absent list
if($size < @all) {  
    foreach(@all) {
	if(! exists $hash{$_}) {
	   push (@absent, $_);  
	}
    }
}
print "\tNumber of different amino acids: ${size}. @absent did not appear.\n";

##Third: Print in order of frequency
print "3. Amino acids and number of occurences, in order of frequency\n";
#sort subroutine to sort numerically.
#$a and $b are the automatic variables of the two keys,
#their values are repeatedly compared, and the resulting list is stored in @sorted
my @sorted = sort { $hash{$b} <=> $hash{$a} } keys %hash;
foreach (@sorted) {
    print "\t$_ $hash{$_} \n";
}

close PROTEIN;
exit;
