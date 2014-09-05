# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

CMAKE_MIN_VERSION="2.8"

inherit cmake-utils

DESCRIPTION="PhotoQt is a fast and highly configurable image viewer with a simple and nice interface"
HOMEPAGE="http://photoqt.org"
SRC_URI="${HOMEPAGE}/pkgs/${P}.tar.gz"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"


IUSE="+exiv2 +graphicsmagick +phonon qtonly"
########
# exiv2 - Use exiv2 library
# graphicsmagick - Use graphicsmagick library
# phonon - Use Phonon
# qtonly - ONLY USE QT-ONLY FEATURES
REQUIRED_USE="qtonly? ( !exiv2 !graphicsmagick !phonon )"

DEPEND=">=dev-qt/qtcore-4.7:4
    >=dev-qt/qtgui-4.7:4
    >=dev-qt/qtsql-4.7:4
    exiv2? ( media-gfx/exiv2 )
    graphicsmagick? ( media-gfx/graphicsmagick )
    phonon? ( dev-qt/qtphonon )"
RDEPEND="${DEPEND}"

src_configure() {
    local mycmakeargs=(
	$(cmake-utils_use exiv2 EXIV2)
	$(cmake-utils_use graphicsmagick GM)
	$(cmake-utils_use phonon PHONON)
	$(cmake-utils_use qtonly QTONLY)
    )
    cmake-utils_src_configure
}
