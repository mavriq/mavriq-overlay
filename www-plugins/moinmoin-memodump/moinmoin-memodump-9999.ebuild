# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=( python2_7 )

DESCRIPTION="${PN} is a simple MoinMoin theme based on Twitter Bootstrap."
HOMEPAGE="https://github.com/dossist/${PN}"
LICENSE="GPL MIT"
SLOT="0"
KEYWORDS="~*"
RDEPEND="www-apps/moinmoin"

MY_PN=memodump

DOCS=( README.md )

if [[ "${PV/9999}" != "${PV}" ]]; then
	inherit eutils distutils-r1 git-2
	EGIT_REPO_URI="https://github.com/dossist/${PN}.git git@github.com:dossist/${PN}.git"
	SRC_URI=""
	KEYWORDS=""
else
	inherit eutils distutils-r1
	SRC_URI="https://github.com/dossist/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="*"
fi

src_compile(){ :; }

distutils-r1_python_install() {
	insinto "${PORTAGE_PYTHONPATH}/MoinMoin/theme"
	doins ${MY_PN}.py || die
	insinto "${PORTAGE_PYTHONPATH}/MoinMoin/web/static/htdocs"
	doins -r ${MY_PN} || die
	python_optimize	 "${ED}/${PORTAGE_PYTHONPATH}"
}
