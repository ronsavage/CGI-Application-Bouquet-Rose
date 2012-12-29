use Module::Build;

my($builder) = Module::Build -> new
(
 module_name    => 'CGI::Application::Bouquet::Rose',
 license        => 'perl_5',
 dist_abstract  => 'Generate a set of CGI::Application-based classes',
 dist_author    => 'Ron Savage <ron@savage.net.au>',
 build_requires =>
 {
	 Test::More => 0,
	 Test::Pod  => 0,
 },
 configure_requires =>
 {
 	 Module::Build => 0.3800,
 },
 requires =>
 {
	 Carp             => 0,
	 Config::IniFiles => 0,
	 File::Copy       => 0,
	 File::Path       => 0,
	 File::Spec       => 0,
	 HTML::Template   => 0,
 },
);

$builder -> add_build_element('conf');
$builder -> create_build_script();
