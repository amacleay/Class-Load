#!/usr/bin/env perl
use strict;
use warnings;
use Test::More tests => 15;
use Class::Require ':all';
use Test::Exception;
use lib 't/lib';

ok(load_class('Class::Require::OK'), "loaded class OK");
is($Class::Require::ERROR, undef);

throws_ok {
    load_class('Class::Require::Nonexistent')
} qr{^Can't locate Class/Require/Nonexistent.pm in \@INC};
like($Class::Require::ERROR, qr{^Can't locate Class/Require/Nonexistent.pm in \@INC});

ok(load_class('Class::Require::OK'), "loaded class OK");
is($Class::Require::ERROR, undef);

throws_ok {
    load_class('Class::Require::SyntaxError')
} qr{^Missing right curly or square bracket at };
like($Class::Require::ERROR, qr{^Missing right curly or square bracket at });

throws_ok {
    load_class('Class::Require::Nonexistent')
} qr{^Can't locate Class/Require/Nonexistent.pm in \@INC};
like($Class::Require::ERROR, qr{^Can't locate Class/Require/Nonexistent.pm in \@INC});

throws_ok {
    load_class('Class::Require::SyntaxError')
} qr{^Missing right curly or square bracket at };
like($Class::Require::ERROR, qr{^Missing right curly or square bracket at });

ok(is_class_loaded('Class::Require::OK'));
ok(!is_class_loaded('Class::Require::Nonexistent'));
ok(!is_class_loaded('Class::Require::SyntaxError'));

