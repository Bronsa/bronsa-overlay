# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-lisp/cl-asdf/cl-asdf-1.89.ebuild,v 1.7 2010/01/07 15:00:26 fauli Exp $
EAPI="2"
inherit eutils common-lisp-2

DESCRIPTION="ASDF is Another System Definition Facility for Common Lisp"
HOMEPAGE="http://packages.debian.org/unstable/devel/cl-asdf"
SRC_URI="http://ftp.de.debian.org/debian/pool/main/c/cl-asdf/cl-asdf_${PV}.orig.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="virtual/commonlisp"
PDEPEND="dev-lisp/asdf-install"

S="${WORKDIR}/cl-${P}"

src_prepare () {
	rm GNUmakefile
} 

src_install() {
	common-lisp-install {asdf,wild-modules}.lisp
	dodoc README
	docinto examples && dodoc test/* 
}
