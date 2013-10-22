use strict;
if(@ARGV != 2) {
	print "usage: perl guess_number.pl <min> <max> \n";
	exit;
}
my ($min, $max) = @ARGV;	#the user enters the minimum and maximum value
my $number_of_guesses;		#keep track of the number of guesses

#repeat this loop until the right answer is reached
while(1) {			
	#if min is less than max, the user is giving bad responses
	if($min > $max) {
		print "cheater! I quit\n";		
		exit;
	}
	#guess the middle number and round
	my $guess = int (($min + $max)/2);		
	$number_of_guesses++;
	#get clue from user
	print "My guess is: $guess\nAm I high, low, or right?\n";
	my $input = <STDIN>;		
	#if guess was low, eliminate it and all values below
	if($input =~ /low/) {
		$min = $guess + 1;	
		next;
	}
	#if guess was high, eliminate guess all values above
	elsif($input =~ /high/) {
		$max = $guess - 1;	
		next;
	}
	#if guess was right, print how many guesses it took and break out of the loop
	elsif($input =~ /right/) {
		print "Yeay! That took me $number_of_guesses guesses.\n";
		last;
	}
	#if user fails to give proper response
	else {
		print "Please answer the question.\n";
		$number_of_guesses--;	#this guess didn't count
	}
}
	