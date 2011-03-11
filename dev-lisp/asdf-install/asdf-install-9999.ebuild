# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit common-lisp-2 git
EGIT_REPO_URI="http://github.com/gwkkwg/asdf-install.git"
DESCRIPTION="asdf-install"
HOMEPAGE=""

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="virtual/commonlisp"
RDEPEND="dev-lisp/asdf"

src_install () {
	pushd ${PN}
	common-lisp-install *.{lisp,asd}
	common-lisp-symlink-asdf
	popd
}
