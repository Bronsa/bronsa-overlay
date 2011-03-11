# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
DESCRIPTION="LOIQ stands for LOIC in Qt4. It is a an attempt to re-create the LOIC server stress-test tool using Qt4/C++ instead of original C#/.Net to make it available under *NIX OSes (primarily under Linux)."
HOMEPAGE="http://loiq.sourceforge.net/"
SRC_URI="mirror://sourceforge/loiq/${P}.tar.bz2"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~X86 ~amd64"
IUSE=""

DEPEND="x11-libs/qt-core"
RDEPEND="${DEPEND}"

src_configure () {
	rm loiq
}
src_install () {
	dobin loiq
}

