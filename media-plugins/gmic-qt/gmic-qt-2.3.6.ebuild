# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="G'MIC-Qt is a versatile front-end to the image processing framework G'MIC"
HOMEPAGE="https://github.com/c-koi/gmic-qt"
SLOT="0"
LICENSE="GPL V3"
KEYWORDS="~amd64"


inherit cmake-utils bash-completion-r1

if [[ ${PV} == "9999" ]]; then
	EGIT_REPO_URI="https://github.com/c-koi/gmic-qt.git"
	inherit git-r3
else
	SRC_URI="https://github.com/c-koi/gmic-qt/archive/v.${PV}.tar.gz -> ${PN}-${PV}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

IUSE="gimp krita"

# qt widgets and network
# -- The following OPTIONAL packages have been found:

#  * PkgConfig
#  * CURL
#  * OpenMP, A low-level parallel execution library, <http://openmp.org/wp/>
#    Optionally used by gmic-qt
#  * X11

# -- The following REQUIRED packages have been found:

#  * Qt5Core
#  * Qt5Gui
#  * Qt5Widgets
#  * Qt5Network
#  * Qt5 (required version >= 5.2.0)
#  * Qt5LinguistTools
#  * PNG
#  * ZLIB
#  * FFTW3

RDEPEND=""
DEPEND="${RDEPEND}"
COMMON_DEPEND="
	gimp? ( >=media-gfx/gimp-2.4.0 )
	krita? ( media-gfx/krita )
"

src_configure() {
	local mycmakeargs=(
		-DCMAKE_BUILD_TYPE="Release"
	)

	if use gimp; then
		mycmakeargs+=(-DGMIC_QT_HOST="gimp")
	elif use krita; then
		mycmakeargs+=(-DGMIC_QT_HOST="krita")
	else
		mycmakeargs+=(-DGMIC_QT_HOST="none")
	fi
	cmake-utils_src_configure
}

src_install() {
	cmake-utils_src_install

}
