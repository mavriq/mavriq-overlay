# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit user systemd

MY_PN=${PN/-bin/}

DESCRIPTION="Scalable datastore for metrics, events, and real-time analytics"
HOMEPAGE="http://influxdb.com"
SRC_URI="
    amd64? ( https://dl.influxdata.com/${MY_PN}/releases/${MY_PN}-${PV}_linux_amd64.tar.gz )
    arm? ( https://dl.influxdata.com/${MY_PN}/releases/${MY_PN}-${PV}_linux_armhf.tar.gz )
    x86? ( https://dl.influxdata.com/${MY_PN}/releases/${MY_PN}-${PV}_linux_i386.tar.gz )
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"

DEPEND=""
RDEPEND="${DEPEND}"
#RESTRICT="strip"

S="${WORKDIR}/${MY_PN}-${PV}-1"

pkg_setup() {
    ebegin "Creating ${MY_PN} user and group"
    enewgroup ${MY_PN}
    enewuser ${MY_PN} -1 -1 "/var/lib/${MY_PN}" ${MY_PN}
    eend $?
}

src_install() {
    dobin usr/bin/*

    keepdir /etc/${MY_PN}
    insinto /etc/${MY_PN}
    newins etc/${MY_PN}/${MY_PN}.conf ${MY_PN}.conf

    insinto /etc/logrotate.d
    newins etc/logrotate.d/${MY_PN} ${MY_PN}

    newinitd "${FILESDIR}/${MY_PN}.initd" "${MY_PN}"
    newconfd "${FILESDIR}/${MY_PN}.confd" "${MY_PN}"
    systemd_dounit usr/lib/${MY_PN}/scripts/${MY_PN}.service

    keepdir /var/lib/${MY_PN} /var/log/${MY_PN}
    fowners -R ${MY_PN}:${MY_PN} /var/lib/${MY_PN} /var/log/${MY_PN}

    doman usr/share/man/man[0-9]*/*
}

pkg_postinst() {
    local name=InfluxDB
    elog "The ${name} Shell (CLI) is always included within the main package."
    elog "Executing 'influx' will start the CLI and automatically connect to"
    elog "the local InfluxDB instance. The InfluxDB Shell stores that last 1000"
    elog "commands in your home directory in a file called .influx_history."
    elog
    source "${FILESDIR}/postinst-message-auth"
    elog
    source "${FILESDIR}/postinst-message-statistic"
}
