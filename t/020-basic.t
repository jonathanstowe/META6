#!raku

use v6;
use Test;

use JSON::Fast;

use META6;

my IO::Path $data-dir = $*PROGRAM.parent.add("data");

my IO::Path $meta-path = $data-dir.add('META6.json');

my $obj;

lives-ok { $obj = META6.new(file => $meta-path) }, "default test";

is $obj.version, "0.0.1", "object get good version";
is $obj.name, "JSON::Marshal", "got right name";
is $obj.description, "Simple serialisation of objects to JSON", "and description";
is $obj.meta-version, Version.new(0), "got the right default version";

my $json;

lives-ok { $json = $obj.to-json }, "call to-json";

my $h = from-json($json);

is $h<version>, "0.0.1", "version is right";
is $h<raku>, "6", "perl is right";
nok $h<excludes>:exists, "and it skipped excludes";

for $obj.^attributes -> $attr {
    if $attr.has_accessor {

        ok $attr.^does(META6::MetaAttribute), "attribute { $attr.name } has the trait";

    }
}


done-testing;
# vim: expandtab shiftwidth=4 ft=raku
