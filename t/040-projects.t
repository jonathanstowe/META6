#!perl6

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
}




done-testing;
# vim: expandtab shiftwidth=4 ft=perl6
