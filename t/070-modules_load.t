#! /usr/bin/env perl6

use v6;
use META6;
use Test;

my $m = META6.new( file => $*PROGRAM.sibling('../META6.json') );
my @modules = $m<provides>.keys;

plan @modules.elems; 

for $m<provides>.keys -> $module {
  use-ok $module, "This module loads: $module";
}

# vim: expandtab shiftwidth=4 ft=perl6
