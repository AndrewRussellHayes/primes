use strict;
use warnings;


# read in status file
# status file has number last tested
# status file has number currently being tested
# status file has last number divided as a test

# read in primes file into an array
# loop through primes and print them 
#
# start with next test
# current number divied by last divided +1 until last divided = current number
#	if divide does not have a decimal (test using mod?) then exit loop and
#	increnemt current number
#	else loop again
#	(update files here in case of crash)
#
#


my $currentNumber = 1000000000; #TODO: or read in value if it exists
my $sqrt = sqrt($currentNumber);
my $currentDivisor;
my $modRemainder;
my @primes; #TODO: populate
push(@primes, 2);
push(@primes, 3);
my $filename = "primes_".`date +%m\\_%d\\_%y\\_%H%M%S`;
chomp $filename;


#TODO improvements:
# - only calculate up to the square root
# - skip all even divisors


logPrime(@primes);

#read in stub

#start timer stub

do{
	$currentDivisor = 2;
	#print "\n Current number being tested: ".$currentNumber;
	#print "\n Current divisor: ".$currentDivisor;

	while($sqrt > $currentDivisor){

		#print "\n Current number being tested: ".$currentNumber;
		#print "\n Current divisor: ".$currentDivisor;

		$modRemainder = $currentNumber % $currentDivisor;	

		#print "\nmodremainder is: ".$modRemainder;
		#if($modRemainder == 0){
		#	print "\n number:divisor ".$currentNumber.":".$currentDivisor;
		#}
		last if $modRemainder == 0;

		if($currentDivisor+1 > $sqrt){
			push(@primes, $currentNumber);
			print "\n".$currentNumber." is prime number ".scalar @primes;
			logPrime(@primes);
		}
		$currentDivisor += 1;
	}
	$currentNumber += 1;
	$sqrt = sqrt($currentNumber);

	
#write out stub
#stub. write out time after adding time already passed
	
}while 1;


sub logPrime {
	
	my $fh;

    open($fh, '>>', $filename) or die "Cant open log file '$filename' $!";
	print $fh (scalar @primes.", ".$currentNumber."\n");
    close $fh;

}


__END__

sub writeLog {
     say "In writeLog()";
     my $filename = shift;
     my $header = shift;
     my $log = shift;

     #print "Head: ".$header if $firstLoop;
     #print "Log: ".$log;

     open(my $fh, '>>', $filename) or die "Cant open log file '$filename' $!";
     print $fh $header if $firstLoop;
     print $fh $log;
     close $fh;
 }



sub getHosts {
        open(my $fh, '<', $HostFile) or die "Cant open host config file '$HostFile' $!";
        while (my $IP = <$fh>) {
                next if substr($IP, 0, 1) eq '#';
                chomp $IP;

                my @tuples = split(/\./,$IP);
                $Hosts{$IP}{'Last_Tuple'} = $tuples[3];
                my $noUnderScore = $IP;
                $noUnderScore =~ s/\./_/g;
                $Hosts{$IP}{'Underscore_Host'} = $noUnderScore;

        }
        close $fh;
}


