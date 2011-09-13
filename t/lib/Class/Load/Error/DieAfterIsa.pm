package Class::Load::Error::DieAfterIsa;

use strict;
use warnings;

# This library emulates a bug that can occur under App::Cmd,
#
# A Broken library "use"'s annother library ( App::Cmd::Setup ), and that
# library injects @ISA during import->()

our @ISA = qw( UNIVERSAL );

die "Not a syntax error";

