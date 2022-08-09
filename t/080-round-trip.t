#!/usr/bin/env raku

use Test;
use META6;
use JSON::Fast;

subtest {
    my $file = $*PROGRAM.parent.add('data/META6-with-builder.json');

    my $orig-struct = from-json($file.slurp);

    my $obj = META6.new(:$file);

    my $new-struct = from-json($obj.to-json);

    is-deeply $new-struct, $orig-struct, 'round trip nicely with "build", "builder" and associative "depends"';
}, "with builder";
subtest {
    my $file = $*PROGRAM.parent(2).add('META6.json');

    my $orig-struct = from-json($file.slurp);

    my $obj = META6.new(:$file);

    my $new-struct = from-json($obj.to-json);

    is-deeply $new-struct, $orig-struct, 'round trip nicely with "traditional" "depends" and "test-depends", no "build"';
}, "with my META";




done-testing;
# vim: ft=raku
