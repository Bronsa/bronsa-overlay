# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit common-lisp-2 git

EGIT_REPO_URI="git://common-lisp.net/projects/qitab/command-line-arguments.git"

DESCRIPTION="COMMAND-LINE-ARGUMENTS is a simple library to help you get and parse command-line arguments"
HOMEPAGE="http://common-lisp.net/project/qitab/"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="virtual/commonlisp"
RDEPEND="${DEPEND}"
