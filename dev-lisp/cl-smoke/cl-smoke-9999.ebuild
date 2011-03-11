# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

DESCRIPTION="Common Lisp bindings for Qt and KDE using Smoke"
HOMEPAGE="http://tobias.rautenkranz.ch/lisp/cl-smoke/"

LICENSE="GPL"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="+gui commonqt kde +dbus examples +network opengl phonon webkit +repl doc"

DEPEND="dev-lisp/cl-smoke-core\
	dev-lisp/cl-smoke-qt-core\
	gui? ( dev-lisp/cl-smoke-qt-gui )\
	gui? ( dev-lisp/cl-smoke-qt-uitools )\
	kde? ( dev-lisp/cl-smoke-kde-core )\
	kde? ( gui? ( dev-lisp/cl-smoke-kde-ui ) )\
	dbus? ( dev-lisp/cl-smoke-qt-dbus )\
	examples? ( dev-lisp/cl-smoke-qt-examples )\
	doc? ( dev-lisp/cl-smoke-doc )\
	commonqt? ( dev-lisp/cl-smoke-commonqt )\
	repl? ( dev-lisp/cl-smoke-repl )\
	network? ( dev-lisp/cl-smoke-qt-network )\
	opengl? ( dev-lisp/cl-smoke-qt-opengl )\
	phonon? ( dev-lisp/cl-smoke-qt-phonon )\
	webkit? ( dev-lisp/cl-smoke-qt-webkit )"

RDEPEND="${DEPEND}"
