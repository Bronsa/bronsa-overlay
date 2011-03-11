# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

USE_RUBY="ruby18 ruby19"
inherit ruby-fakegem

DESCRIPTION="Xapian bindings for Ruby without dependency on system Xapian library"
HOMEPAGE="http://rubygems.org/gems/xapian-full"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-ruby/rake"
RDEPEND="${DEPEND}"

src_prepare (){
	for i in xapian-core-1.2.3 xapian-bindings-1.2.3; do
		tar -xvfz $i.tar.gz
	done
}
