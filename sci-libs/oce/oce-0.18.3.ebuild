# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="Open CASCADE Community Edition: patches/improvements/experiments contributed by users over the official Open CASCADE library."
HOMEPAGE="http://groups.google.com/group/oce-dev"
SRC_URI="https://github.com/tpaviot/oce/archive/${P}.tar.gz"
LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64"
IUSE="tbb openmp shared"
RDEPEND=""
DEPEND="${RDEPEND}"

inherit cmake-utils

src_unpack() {
	if [ "${A}" != "" ]; then
		unpack ${A}
	fi
	S=${WORKDIR}/oce-OCE-${PV}
}


src_prepare() {
	cmake-utils_src_prepare
}

src_configure() {
	local mycmakeargs=(
		-DOCE_BUILD_SHARED_LIB="$(usex shared)"
		-DOCE_DATAEXCHANGE=ON
		-DOCE_DRAW=OFF
		-DOCE_INSTALL_PREFIX=/usr/local
		-DOCE_MODEL=ON
		-DOCE_OCAF=ON
		-DOCE_VISUALISATION=ON
		-DOCE_WITH_FREEIMAGE=OFF
		-DOCE_WITH_GL2PS=OFF
	)
	if use tbb; then
		mycmakeargs+=(-DOCE_MULTITHREAD_LIBRARY:STRING=TBB)
	elif use openmp; then
		mycmakeargs+=(-DOCE_MULTITHREAD_LIBRARY:STRING=OPENMP)
	fi

	cmake-utils_src_configure
}

src_compile() {
	cmake-utils_src_compile
}

src_install() {
	cmake-utils_src_install
}
