# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2
USE_RUBY="ruby18"

RUBY_FAKEGEM_TASK_TEST=""
RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="Changes README THANKS TODO"

inherit multilib ruby-fakegem

DESCRIPTION="Ruby wrappers of ncurses"
HOMEPAGE="http://ncurses-ruby.berlios.de/"

#SRC_URI="http://rubygems.org/downloads/ncurses-0.9.1.gem"
SRC_URI="http://gems.rubyforge.org/gems/${P}.gem"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="+utf-8"

DEPEND=">=sys-libs/ncurses-5.3
		utf-8? ( dev-ruby/ncurses-ruby )"
RDEPEND="${DEPEND}"

each_ruby_configure() {
	if use "utf-8" ; then
		epatch $FILESDIR/utf-8.patch
	fi
	${RUBY} extconf.rb || die
}
each_ruby_compile() {
	emake || die
	mv ncurses$(get_modname) lib/ || die
}

