use v6;

use JSON::Class;

# Need to import here to get the traits
import JSON::Marshal;
import JSON::Unmarshal;

class META6 does JSON::Class {

    enum Optionality <Mandatory Optional>;

    role MetaAttribute {
        has Optionality $.optionality is rw;
    }

    role MetaAttribute::Specfication does MetaAttribute {

    }

    role MetaAttribute::Customary does MetaAttribute {

    }

    multi sub trait_mod:<is> (Attribute $a, Optionality :$specification!) {

        $a does MetaAttribute::Specfication;
        $a.optionality = $specification // Optional;
    }

    multi method new(Str :$file!) {
        self.new(file => $file.IO);
    }

    multi method new(IO::Path :$file!) {
        self.new(file => $file.open);
    }

    multi method new(IO::Handle :$file!) {
        my $json = $file.slurp-rest;
        self.from-json($json);
    }

    class Resource {

    }

    class Support {
    }

    # cope with "v0.0.1"
    sub unmarsh-version(Str() $v) returns Version {
        my $ver = Version.new($v);
        if $ver.parts[0] eq 'v' {
            $ver.parts.shift;
        }
        $ver;
    }


    has Version     $.perl          is rw is marshalled-by('Str') is unmarshalled-by(&unmarsh-version) is specification(Mandatory);
    has Str         $.name          is rw is specification(Mandatory);
    has Version     $.version       is rw is marshalled-by('Str') is unmarshalled-by(&unmarsh-version) is specification(Mandatory);
    has Str         $.description   is rw is specification(Mandatory);
    has Str         @.authors       is rw is specification(Optional);
    has Str         %.provides      is rw is specification(Mandatory);
    has Str         @.depends       is rw is specification(Optional);
    has Str         %.emulates      is rw is specification(Optional);
    has Str         %.supersedes    is rw is specification(Optional);
    has Str         %.superseded-by is rw is specification(Optional);
    has Str         %.excludes      is rw is specification(Optional);
    has Str         @.build-depends is rw is specification(Optional);
    has Str         @.test-depends  is rw is specification(Optional);
    has Resource    $.resource      is rw is specification(Optional);
    has Support     $.support       is rw is specification(Optional);
    has Bool        $.production    is rw is specification(Optional);
    has Str         $.license       is rw is specification(Optional);
    has Str         @.tags          is rw is specification(Optional);
}

# vim: expandtab shiftwidth=4 ft=perl6
