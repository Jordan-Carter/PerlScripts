#!/usr/bin/perl
use strict;
use warnings;

#creating and filling an array
my @requests = (221, 16, 103, 101, 4, 99, 84, 23, 72, 245, 231, 61,
                247, 233, 212, 85, 193, 115, 29, 35);
#size of the array
#print(scalar @requests);
my $size = @requests;
my $head = $requests[0];
my $seekTime = 0;
my $headIndex;
my $current = 0;

#sorting from smallest to largest with use of spaceship operator
my @list = sort {$a <=> $b} @requests;

while($list[$current] != $head)
{
    $current++;
}

$headIndex = $current;

while($current < $size - 1)
{
    $seekTime += abs($list[$current] - $list[$current + 1]);
    $current++;
}

$seekTime += abs($list[$current] - $list[$headIndex - 1]);
$current = $headIndex - 1;

while($current > 0)
{
    $seekTime += abs($list[$current] - $list[$current - 1]);
    $current--;
}

print("\nLook algorithm's total seek time: $seekTime\n");

