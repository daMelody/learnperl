#!/bin/perl

## imports ##
use Text::TabularDisplay;


## main program ##
$nest_egg = 10000;  # starting amount
$year = 2000;       # starting year
$duration = 10;     # number of years saving
$apr = 9.5;         # Annual Percentage Rate

# construct table
my $table = Text::TabularDisplay->new(qw(Year Beginning Interest After));

# calculate interest each year and print to table
for $i (1 .. $duration) {
    # Compare with
    # $interest = ($apr / 100) * $nest_egg
    $interest = int (($apr / 100) * $nest_egg * 100) /100;
    $year_end = $nest_egg + $interest; # calculate year-end value
    
    # add a row to the table
    $table->add($year, $nest_egg, $interest, $year_end);

    $year++; # increment year
    $nest_egg = $year_end;   # add the interest onto balance at start of year
}

$table->add($year, $nest_egg);
print $table->render();
