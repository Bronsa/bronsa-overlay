# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $ stumpwm-9999

EGIT_REPO_URI="git://git.savannah.nongnu.org/stumpwm.git"

EAPI=2
inherit common-lisp-2 common-lisp-3 glo-utils eutils elisp-common git autotools

DESCRIPTION="Stumpwm is a tiling, keyboard driven X11 Window Manager written entirely in Common Lisp."
HOMEPAGE="http://www.nongnu.org/stumpwm/"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~ppc ~sparc"
IUSE="doc stumpish contrib source emacs"

RESTRICT="strip mirror"
QA_EXECSTACK="usr/bin/stumpwm"

RDEPEND="dev-lisp/cl-ppcre
		>=dev-lisp/clx-0.7.3-r1 
		>=dev-lisp/sbcl-1.0.32
		emacs? ( virtual/emacs app-emacs/slime )"
		#dev-lisp/buildapp"
DEPEND="${RDEPEND}
		sys-apps/texinfo
		doc? ( virtual/texi2dvi )"

SITEFILE=70${PN}-gentoo.el

src_prepare() {

	rm -rf .git

	cp "${FILESDIR}"/contrib/*.lisp contrib/

	mv contrib/notifications.lisp contrib/notification.lisp
	for i in "${FILESDIR}"/${PV}-*.patch ; do
		epatch $i
	done
	eautoreconf
}

src_configure() {

	ECONF_OPTS="--with-lisp=sbcl"
	if use contrib ; then
		ECONF_OPTS="${ECONF_OPTS} --with-contrib-dir=${CLSOURCEROOT}/${PN}/contrib"
	fi
	econf ${ECONF_OPTS}
}

src_compile() {

	if use emacs ; then
		elisp-compile contrib/*.el || die "Cannot compile contrib Elisp files"
	fi

	makeinfo ${PN}.texi || die "Cannot build info focs"
	if use doc ; then
		VARTEXFONTS="${T}"/fonts \
			texi2pdf ${PN}.texi || die "Cannot build PDF docs"
	fi

	common-lisp-export-impl-args sbcl

	if [ -a /usr/share/common-lisp/systems/stumpwm.asd ] ; then
		addwrite /usr/share/common-lisp/systems/
		rm -rf /usr/share/common-lisp/systems/stumpwm.asd
	fi

	addwrite /var/cache/
	umask g+w
	sbcl --noinform --disable-ldb --lose-on-corruption \
		--sysinit /etc/gentoo-init.lisp --disable-debugger --load make-image.lisp \
		|| die "Cannot create stumpwm binary"
	#buildapp --output stumpwm --load-system stumpwm\
#		--eval '(defun main (args) (declare (ignore args)) (stumpwm:stumpwm ":0"))' --entry main \
#	|| die "Cannot create stumpwm binary"
}

src_install() {

	dobin stumpwm
	make_session_desktop StumpWM /usr/bin/stumpwm
	if use emacs; then
		elisp-install ${PN} contrib/*.el{,c} || die "Cannot install	contrib Elisp files"
		elisp-site-file-install "${FILESDIR}"/${SITEFILE} \
			|| die "elisp-site-file-install failed"
	fi

	cp "${FILESDIR}"/README.Gentoo . && sed -i "s:@VERSION@:${PV}:" README.Gentoo
	dodoc NEWS README README.Gentoo
	doinfo ${PN}.info
	use doc && dodoc ${PN}.pdf

	docinto examples ;
	insinto /etc/
	newins sample-stumpwmrc.lisp stumpwmrc
	rm sample-stumpwmrc.lisp


	if use stumpish; then
		dobin contrib/stumpish
	fi

	if use contrib; then
		common-lisp-install contrib/*.lisp
	fi
	if use source ; then
		common-lisp-install *.{lisp,asd}
		common-lisp-symlink-asdf
	fi
}

pkg_postinst() {
	use emacs && elisp-site-regen
}

pkg_postrm() {
	use emacs && elisp-site-regen
}

