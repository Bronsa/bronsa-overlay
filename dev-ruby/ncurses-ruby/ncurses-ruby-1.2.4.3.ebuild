# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2
USE_RUBY="ruby18 ruby19"

RUBY_FAKEGEM_TASK_TEST=""
RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="Changes README THANKS TODO"

inherit multilib ruby-fakegem
MY_PN=ncursesw
DESCRIPTION="Ruby wrappers of ncurses and PDCurses libs"
HOMEPAGE="http://ncurses-ruby.berlios.de/"
SRC_URI="http://gems.rubyforge.org/gems/${MY_PN}-${PV}.gem"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="examples"

DEPEND=">=sys-libs/ncurses-5.3"
RDEPEND="${DEPEND}"
RUBY_PATCHES=( "${FILESDIR}"/${P}-fix-trace.patch )

each_ruby_configure() {
	epatch $FILESDIR/ruby19.patch
	${RUBY} extconf.rb || die
}
each_ruby_compile() {
	emake || die
	mv ncursesw_bin$(get_modname) lib/ || die
}

all_ruby_install() {
	all_fakegem_install

	if use examples; then
		insinto /usr/share/doc/${PF}
		doins -r examples || die
	fi
}

