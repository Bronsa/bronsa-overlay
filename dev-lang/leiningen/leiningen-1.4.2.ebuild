
# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="Leiningen is a build utility for clojure projects."
HOMEPAGE="http://github.com/technomancy/leiningen/"
SRC_URI="https://github.com/technomancy/leiningen/blob/1.4.2/bin/lein"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"

IUSE=""

RDEPEND=">=virtual/jre-1.5"
DEPEND=">=virtual/jdk-1.5"

SITEFILE="70${PN}-gentoo.el"
src_unpack() {
	cp $ROOT/usr/portage/distfiles/${A} ${WORKDIR}
}

src_install() {
	dobin lein
}
