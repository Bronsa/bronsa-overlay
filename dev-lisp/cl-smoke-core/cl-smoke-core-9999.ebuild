# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit common-lisp-2 darcs eutils cmake-utils

DESCRIPTION="Common Lisp bindings for Qt and KDE using Smoke"
HOMEPAGE="http://tobias.rautenkranz.ch/lisp/cl-smoke/"
EDARCS_REPOSITORY="http://tobias.rautenkranz.ch/lisp/cl-smoke/smoke"

LICENSE="GPL"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND="kde-base/smoke\
	dev-lisp/alexandria\
	dev-lisp/bordeaux-threads\
	dev-lisp/closer-mop\
	dev-lisp/cffi\
	dev-lisp/trivial-garbage"
RDEPEND="dev-lisp/cl-smoke-qt-core"

src_install () {
	cmake-utils_src_install
	common-lisp-install *.{lisp,asd}
	common-lisp-symlink-asdf smoke
}
