#
# keyword2text -- make keyword to link
#
# Copyright (c) 2012 Nobuyuki Sato
# <http://www.nobu417.jp/>
#

package MT::Plugin::keyword2link;
use MT::Template::Context;

MT::Template::Context->add_global_filter(keyword2link => \&keyword2link);

sub keyword2link {
	my ($text, $arg, $ctx) = @_;
	# Rewrite URL below to your search URL.
	my $url = "http://www.nobu417.jp/search?q=";
	$text =~ s/\[\[([^\]]*)\]\]/<a href="$url$1" class="keyword">$1<\/a>/ig;
	$text;
}

1;
