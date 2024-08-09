#!/usr/bin/perl
use strict;
use warnings;

# Open the input file
my $filename = 'input.txt';
open(my $fh, '<', $filename) or die "Could not open file '$filename' $!";

# Initialize a hash to store word counts
my %word_count;

# Read the file line by line
while (my $line = <$fh>) {
    chomp $line;

    # Convert line to lowercase and split into words
    $line = lc $line;
    my @words = split /\s+/, $line;

    # Count each word
    foreach my $word (@words) {
        # Remove punctuation
        $word =~ s/[^a-zA-Z0-9]//g;

        # Increment word count
        $word_count{$word}++ if $word;
    }
}

# Close the file
close $fh;

# Print the word counts
foreach my $word (sort keys %word_count) {
    print "$word: $word_count{$word}\n";
}
