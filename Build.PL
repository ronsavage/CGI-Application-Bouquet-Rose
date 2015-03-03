use warnings;
use strict;

use Module::Build;

# ----------------

my $class = Module::Build->subclass(code => <<'EOF');

sub ACTION_authortest
{
	my($self) = @_;

	$self->depends_on('build');
	$self->depends_on('manifest');
	$self->depends_on('distmeta');

	$self->test_files( qw< t xt/author > );
	$self->recursive_test_files(1);

	$self->depends_on('test');

	return;
}
EOF

$class -> new
(
	module_name    => 'CGI::Application::Bouquet::Rose',
	license        => 'artistic_2',
	dist_abstract  => 'Generate a set of CGI::Application-based classes',
	dist_author    => 'Ron Savage <ron@savage.net.au>',
	build_requires =>
	{
		'Test::More' => 1.001014,
		'Test::Pod' => 1.48,
	},
	configure_requires =>
	{
		'Module::Build' => 0.4211,
	},
	requires =>
	{
		'Carp' => 0,
		'Config::IniFiles' => 0,
		'File::Copy' => 0,
		'File::Path' => 0,
		'File::Spec' => 0,
		'HTML::Template' => 0,
	},
);

$builder -> add_build_element('conf');
$builder -> create_build_script();
