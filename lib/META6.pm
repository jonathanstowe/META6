use v6;

use JSON::Fast;

class META6 {

    class Resource {

    }

    class Support {

    }

    has Version     $.perl          is rw;
    has Str         $.name          is rw;
    has Version     $.version       is rw;
    has Str         $.description   is rw;
    has Str         @.authors       is rw;
    has Str         %.provides      is rw;
    has Str         @.depends       is rw;
    has Str         %.emulates      is rw;
    has Str         %.supersedes    is rw;
    has Str         %.superseded-by is rw;
    has Str         %.excludes      is rw;
    has Str         @.build-depends is rw;
    has Str         @.test-depends  is rw;
    has Resource    $.resource      is rw;
    has Support     $.support       is rw;
    has Bool        $.production    is rw;
    has Str         $.license       is rw;
    has Str         @.tags          is rw;

}

# vim: expandtab shiftwidth=4 ft=perl6
