#!/usr/bin/perl
use strict; use warnings;
use FileHandle;

my($file, $annotation, $num) = @ARGV;
die "Please input <file> <annotation> <column_number>!" if(@ARGV != 3);

my $in1 = FileHandle->new("< $file");
my $in2 = FileHandle->new("< $annotation");

my(%hash);

my $line1 = <$in2>;
while(<$in2>){
	chomp;
	$_ =~ /(.{9})\t(.+)/;
	$hash{$1} = $2;
}

while(<$in1>){
	chomp;
	my @array = split(/\t/, $_);
	print "$_\t$hash{$array[$num]}\n";
}
