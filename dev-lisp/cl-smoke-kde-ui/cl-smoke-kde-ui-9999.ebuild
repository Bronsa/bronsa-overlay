# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit common-lisp-2 darcs

DESCRIPTION="Common Lisp bindings for Qt and KDE using Smoke"
HOMEPAGE="http://tobias.rautenkranz.ch/lisp/cl-smoke/"
EDARCS_REPOSITORY="http://tobias.rautenkranz.ch/lisp/cl-smoke/kde.ui"

LICENSE="GPL"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""


DEPEND="dev-lisp/sbcl"
RDEPEND="dev-lisp/cl-smoke-kde-core\
				 dev-lisp/cl-smoke-qt-svg"

src_install () {
	common-lisp-install *.asd src/
	common-lisp-symlink-asdf cl-smoke.kde.ui
}
