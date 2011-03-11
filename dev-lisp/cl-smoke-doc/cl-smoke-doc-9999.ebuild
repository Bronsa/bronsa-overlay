# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit darcs eutils

DESCRIPTION="Common Lisp bindings for Qt and KDE using Smoke"
HOMEPAGE="http://tobias.rautenkranz.ch/lisp/cl-smoke/"
EDARCS_REPOSITORY="http://tobias.rautenkranz.ch/lisp/cl-smoke/doc"

LICENSE="GPL"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""
FEREND="dev-libs/libxml2\
	dev-java/saxon\
	app-text/docbook-xml-dtd\
	dev-libs/libxslt"
RDEPEND="${DEPEND}"

src_install () {
		dohtml manual.html index.html
}
