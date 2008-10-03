#!/usr/bin/perl
use 5.010;
use strict;
use warnings;
use Win32::Detached;

use lib '.';
use Lifevis;

open STDERR, '>>error.txt';
open STDOUT, '>>log.txt';

Lifevis->run();
