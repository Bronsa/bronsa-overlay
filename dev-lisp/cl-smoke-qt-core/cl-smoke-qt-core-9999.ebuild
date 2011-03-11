# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit common-lisp-2 darcs

DESCRIPTION="Common Lisp bindings for Qt and KDE using Smoke"
HOMEPAGE="http://tobias.rautenkranz.ch/lisp/cl-smoke/"
EDARCS_REPOSITORY="http://tobias.rautenkranz.ch/lisp/cl-smoke/qt.core"

LICENSE="GPL"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""


DEPEND="x11-libs/qt-core\
			  dev-lisp/sbcl"
RDEPEND="dev-lisp/cl-smoke-core\
				 dev-lisp/cffi\
				 dev-lisp/alexandria"

src_install () {
	cmake-utils_src_install
	common-lisp-install *.asd  src/
	common-lisp-symlink-asdf cl-smoke.qt.core
}
