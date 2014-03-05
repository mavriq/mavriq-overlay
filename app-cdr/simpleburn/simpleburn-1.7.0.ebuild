# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

inherit cmake-utils versionator

DESCRIPTION="A basic application for burning CDs and DVDs"
HOMEPAGE="http://simpleburn.tuxfamily.org"
SRC_URI="http://${PN}.tuxfamily.org/IMG/bz2/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="x11-libs/gtk+:3"
RDEPEND="${DEPEND}
	app-cdr/cdrtools"

src_prepare(){
	default
	sed -e 's/^Categories=AudioVideo$/Categories=GTK;AudioVideo;DiscBurning;/' -i src/simpleburn.desktop
	sed -re 's:^(install \(DIRECTORY doc/ DESTINATION doc/.+\))$:# \1:' -i CMakeLists.txt
}

src_install(){
	cmake-utils_src_install
	dodoc doc/*
}