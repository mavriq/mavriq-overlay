# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="Limit a process's absolute execution time"
HOMEPAGE="http://devel.ringlet.net/sysutils/${PN}"
SRC_URI="${HOMEPAGE}/${P}.tar.gz"
LICENSE="as-is"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~m68k ~mips ~ppc ~ppc64 ~s390 ~sh ~sparc ~x86"
IUSE=""
SLOT="0"
DEPEND=""
src_install() {
	dobin timelimit || die "make bin failed"
	doman timelimit.1 || die "make man failed"
	dodoc NEWS || die "make doc failed"
}
