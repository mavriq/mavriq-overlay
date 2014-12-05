# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
inherit eutils

SLOT=0
KEYWORDS="~x86 ~amd64"
HOMEPAGE="http://www.jetbrains.com/pycharm/"
SRC_URI="http://download-cf.jetbrains.com/python/${P}.tar.gz"

if [[ "${PN}" == "pycharm-community" ]]; then
	DESCRIPTION="PyCharm Community Edition"
	LICENSE="Apache-2.0"
elif [[ "${PN}" == "pycharm-professional" ]]; then
	DESCRIPTION="PyCharm Professional Edition"
	S="${WORKDIR}/pycharm-${PV}"
else
	die "Unknown PN=\"${PN}\""
fi

RDEPEND=">=virtual/jre-1.6"

src_install() {
	insinto /opt/${PN}
	doins -r *
	fperms a+x /opt/${PN}/bin/{fsnotifier{,64},pycharm.sh,inspect.sh}
	dosym /opt/${PN}/bin/pycharm.sh /usr/bin/${PN}
	newicon bin/pycharm.png ${PN}.png
	cat <<-EOF > "${T}/${PN}.desktop"
	[Desktop Entry]
	Name=${PN}
	Type=Application
	Comment=${DESCRIPTION}
	Exec=/usr/bin/${PN}
	Icon=${PN}
	Categories=Development;
	EOF
	domenu "${T}/${PN}.desktop"
}
