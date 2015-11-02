#!perl6

use v6;
use lib 'lib';

use Test;

use META6;

my IO::Path $data-dir = $*PROGRAM.parent.child("data");

my IO::Path $meta-path = $data-dir.child('META.info');

my $obj;

lives-ok { $obj = META6.new(file => $meta-path) }, "default test";

say $obj.to-json;

done-testing;
# vim: expandtab shiftwidth=4 ft=perl6
