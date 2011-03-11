# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"
USE_RUBY="ruby18 ruby19"
inherit ruby-fakegem

DESCRIPTION="a console-based email client for people with a lot of email"
HOMEPAGE="http://sup.rubyforge.org/"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-ruby/ruby-gettext
	>=dev-ruby/mime-types-1
	dev-ruby/lockfile
	>=dev-ruby/trollop-1.12
	dev-ruby/highline
	>=dev-ruby/ruby-rmail-0.17
	dev-ruby/ncurses-ruby
	dev-libs/xapian-bindings[ruby]"
	#dev-ruby/fastthread"
	#dev-ruby/net-ssh
	#>=dev-ruby/ncurses-0.9.1

RDEPEND="${DEPEND}"
