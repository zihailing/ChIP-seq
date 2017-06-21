#!/user/bin/perl
use strict; use warnings;
use FileHandle;

#######input output_results.xls#########
my($file) = @ARGV;
my $in = FileHandle->new("< $file");

my $num = 0;
while(<$in>){
	chomp;
	my @array = split(/\t/, $_);
	$num++;
	if($num ==1){
		print "$array[0]\t$array[1]\t$array[2]\tDEPs_name\t$array[3]\t$array[4]\t$array[5]\t$array[10]\t$array[11]\t$array[12]\t$array[13]\n";
	}else{
		my $name = "DEP_".($num-1);
		print "$array[0]\t$array[1]\t$array[2]\t$name\t$array[3]\t$array[4]\t$array[5]\t$array[10]\t$array[11]\t$array[12]\t$array[13]\n";
	}
}
