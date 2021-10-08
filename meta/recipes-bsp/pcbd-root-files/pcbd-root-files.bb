DESCRIPTION = "Root filesystem customization"

LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

SRC_URI = "file://etc/issue"
SRC_URI += "file://etc/modprobe.d/local.conf"
SRC_URI += "file://etc/network/interfaces"
SRC_URI += "file://home/root/README.txt"

do_install() {
    install -d ${D}${sysconfdir}/modprobe.d
    install -d ${D}${sysconfdir}/network
    install -d ${D}/home/root

    install -m 755 ${WORKDIR}/etc/issue ${D}${sysconfdir}
    install -m 644 ${WORKDIR}/etc/modprobe.d/local.conf ${D}${sysconfdir}/modprobe.d/
    install -m 644 ${WORKDIR}/etc/network/interfaces ${D}${sysconfdir}/network/

    install -m 755 ${WORKDIR}/home/root/README.txt ${D}/home/root/
}

FILES_${PN} += "${sysconfdir}"
FILES_${PN} += "${sysconfdir}/modprobe.d"
FILES_${PN} += "${sysconfdir}/network"
FILES_${PN} += "/home/root"

RDEPENDS_${PN} += "bash"
