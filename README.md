# META6

Do things with Raku [META files](http://design.raku.org/S22.html#META6.json)

[![CI](https://github.com/jonathanstowe/META6/actions/workflows/main.yml/badge.svg)](https://github.com/jonathanstowe/META6/actions/workflows/main.yml)

## Synopsis

The below will generate the  *META6.json* for this module.

```
use META6;

my $m = META6.new(   name        => 'META6',
                     version     => Version.new('0.0.1'),
                     auth        => 'github:jonathanstowe',
                     api         => '1.0',
                     description => 'Work with Raku META files',
                     raku-version   => Version.new('6.*'),
                     depends     => ['JSON::Class:ver<0.0.15+>', 'JSON::Name' ],
                     test-depends   => <Test JSON::Fast>,
                     tags        => <devel meta utils>,
                     authors     => ['Jonathan Stowe <jns+git@gellyfish.co.uk>'],
                     source-url  => 'https://github.com/jonathanstowe/META6.git',
                     support     => META6::Support.new(
                        source => 'https://github.com/jonathanstowe/META6.git'
                     ),
                     provides => {
                        META6 => 'lib/META6.pm',
                     },
                     license     => 'Artistic',
                     production  => False,
                     meta-version   => 1,

                 );

print $m.to-json;

my $m = META6.new(file => './META6.json');
$m<version description> = v0.0.2, 'Work with Raku META files even better';
say 'Modules in the distribution: ' ~ $m<provides>.keys.join(', ');
spurt('./META6.json', $m.to-json);
```
## Description

This provides a representation of the Raku [META
files](http://design.raku.org/S22.html#META6.json) specification -
the META file data can be read, created , parsed and written in a manner
that is conformant with the specification.

Where they are known about it also makes allowance for "customary"
usage in existing software (such as installers and so forth.)

The intent of this is allow the generation and testing of META files for
module authors, so it can provide meta-information whether the attributes
are mandatory as per the spec and where known the places that "customary"
attributes are used,


### to-json

See [JSON::Fast to-json()](https://github.com/timo/json_fast#to-json) for options. `sorted-keys`
is recommended if you intend to modify the same file multiple times.

## Installation

Assuming you have a working Rakudo installation you should be able to install this with *zef* :

    # From the source directory
   
    zef install .

    # Remote installation

    zef install META6

## Support

Suggestions/patches are welcomed via [github](https://github.com/jonathanstowe/META6)

I'm particulary interested in knowing about "customary" (i.e. non-spec)
fields that are being used in the wild and in what software so I can
add them if necessary.

## Licence

This free software.

Please see the [LICENCE](LICENCE) file in the distribution for the details.

© Jonathan Stowe 2015 - 2021
