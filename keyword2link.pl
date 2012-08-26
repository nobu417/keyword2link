#
# keyword2link -- make keyword to link
#
# Copyright (c) 2012 Nobuyuki Sato
# <http://www.nobu417.jp/>
#

package MT::Plugin::keyword2link;
use MT::Template::Context;

MT::Template::Context->add_global_filter(keyword2link => \&keyword2link);

sub keyword2link {
	my ($text, $arg, $ctx) = @_;

	# Set your Amazon associate below.
	my $amazon_tag = "nobu417jp-22";
	# Set the search URL of your site below.
	my $url = "http://www.nobu417.jp/search?q=";

	my $amazon = "http://www.amazon.co.jp/gp/search?index=blended&tag=$amazon_tag&keywords=";	
	my $google = "http://www.google.com/search?q=";

	if ($text =~ /\[a\[([^\]]*)\]\]/) {
		$text =~ s/\[a\[([^\]]*)\]\]/<span class="amazon"><a href="$amazon$1">$1<\/a><\/span>/ig;
	} elsif ($text =~ /\[g\[([^\]]*)\]\]/) {
		$text =~ s/\[g\[([^\]]*)\]\]/<span class="google"><a href="$google$1">$1<\/a><\/span>/ig;
	} else {
		$text =~ s/\[\[([^\]]*)\]\]/<span class="keyword"><a href="$url$1">$1<\/a><\/span>/ig;
	}
	$text;
}

1;
