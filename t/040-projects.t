#!raku

use v6;

use Test;
use META6;
use JSON::Class;

my constant Projects = Array[META6] but JSON::Class;

my IO::Path $data-dir = $*PROGRAM.parent.add("data");
my IO::Path $meta-path = $data-dir.add('projects.json');

my $json = $meta-path.slurp;

my $projects;

{ 
    CONTROL {
        when CX::Warn {
            $_.resume;
        }
    };
    lives-ok { $projects = Projects.from-json($json) }, "create an object from projects.json";
    ok all($projects.list) ~~ META6, "and they're all META6 objects";
    for $projects.list -> $project {
        ok $project.depends, "Depends is a "
                ~ $project.depends.^name ~ " in "~ $project.name if $project.depends;
    }

    # Check a different kind of META, inline-perl, which should go last
    my $inline-perl = $projects.list[*-1];
    is( $inline-perl<depends>.keys.elems, 3,
            "Correct number of keys in depends for Inline::Perl" );
    ok( $inline-perl<depends><build><requires>,
            "Parsing with Associative depends");
    is( $inline-perl<depends><build><requires>.elems, 2,
            "Right number of dependencies" );
    is( $inline-perl<depends><build><requires>[1]<from>, "bin",
            "Hashed dependencies are parsed" );
}




done-testing;
# vim: expandtab shiftwidth=4 ft=raku
