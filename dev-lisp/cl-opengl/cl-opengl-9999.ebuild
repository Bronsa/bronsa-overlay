# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit git common-lisp-2

DESCRIPTION="A set of CFFI bindings to the OpenGL, GLU and GLUT APIs."
HOMEPAGE="http://common-lisp.net/project/cl-opengl/"
EGIT_REPO_URI="https://github.com/3b/cl-opengl.git"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~sparc ~x86"
IUSE=""

RDEPEND="dev-lisp/cffi
		 media-libs/freeglut"

CLSYSTEMS="cl-opengl cl-glu cl-glut cl-glut-examples"

src_compile() {
	:
}

src_install() {
	common-lisp-install *.asd gl glu glut examples
	common-lisp-symlink-asdf
	dodoc README
}
