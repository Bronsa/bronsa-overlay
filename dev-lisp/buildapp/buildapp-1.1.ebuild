# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit common-lisp-2 eutils

DESCRIPTION="Buildapp is an application for SBCL that configures and saves an executable Common Lisp image"
HOMEPAGE="http://www.xach.com/lisp/buildapp/"
SRC_URI="https://github.com/xach/buildapp/tarball/release-1.1 ->
buildapp-1.1.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
IUSE="source"

QA_EXECSTACK="usr/bin/buildapp"

DEPEND="dev-lisp/sbcl"
RDEPEND="${DEPEND}"


S=${WORKDIR}/xach-buildapp-67f57dc

src_install () {
	dobin buildapp
	dodoc doc/*

	if use source ; then
		common-lisp-install *.{lisp,asd}
		common-lisp-symlink-asdf
	fi

}
