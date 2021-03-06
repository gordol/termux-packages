# Status: Termux currently uses openssl. Transitioning to libressl
#         is tempting, but on hold for now to see how widespread
#         the adoption of libressl in Linux distributions is.
TERMUX_PKG_HOMEPAGE=http://www.libressl.org/
TERMUX_PKG_DESCRIPTION="Library implementing the TLS protocol as well as general purpose cryptography functions"
TERMUX_PKG_DEPENDS="ca-certificates"
TERMUX_PKG_VERSION=2.5.1
TERMUX_PKG_SRCURL=http://ftp.openbsd.org/pub/OpenBSD/LibreSSL/libressl-${TERMUX_PKG_VERSION}.tar.gz
TERMUX_PKG_SHA256=f71ae0a824b78fb1a47ffa23c9c26e9d96c5c9b29234eacedce6b4c7740287cd
TERMUX_PKG_EXTRA_CONFIGURE_ARGS="--with-openssldir=$TERMUX_PREFIX/etc/tls"
TERMUX_PKG_CONFLICTS="openssl"
# etc/tls/cert.pem is provided by ca-certificates:
TERMUX_PKG_RM_AFTER_INSTALL="etc/tls/cert.pem"

termux_step_pre_configure() {
	CPPFLAGS+=" -DNO_SYSLOG"
}
