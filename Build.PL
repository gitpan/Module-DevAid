use strict;
use warnings;
use Module::Build;

my $builder = Module::Build->new(
    module_name         => 'Module::DevAid',
    license             => 'perl',
    dist_author         => 'Kathryn Andersen',
    dist_version_from   => 'lib/Module/DevAid.pm',
	requires            => {
	     'Getopt::Long' => 2.34,
	     'Pod::Usage' => 0,
	     'Data::Dumper' => 0,
	},
    build_requires => {
        'Test::More' => 0,
    },
    script_files      => [ 'scripts/moddevaid' ],
    add_to_cleanup      => [ 'Module-DevAid-*' ],
);

$builder->create_build_script();
# create the Makefile.PL 
use Module::Build::Compat;
print "creating Makefile.PL\n";
Module::Build::Compat->create_makefile_pl('passthrough', $builder);
