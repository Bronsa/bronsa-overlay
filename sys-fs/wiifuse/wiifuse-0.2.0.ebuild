# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

DESCRIPTION="Wiifuse allows you to mount a Gamecube or Wii DVD disc image as a read-only part of the file system on you computer."
HOMEPAGE="http://wiibrew.org/wiki/Wiifuse"
SRC_URI="http://wiibrew.org/w/images/0/04/Wiifuse-${PV}.tgz"

LICENSE="AS-IS"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="sys-fs/fuse
dev-libs/openssl"
RDEPEND="${DEPEND}"

src_install () {
	dobin wiifuse
}
