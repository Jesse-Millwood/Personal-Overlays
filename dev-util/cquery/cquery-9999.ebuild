# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit git-r3 cmake-utils

DESCRIPTION="C/C++ language server supporting multi-million line code base, powered by libclang. Emacs, Vim, VSCode, and others with language server protocol support. Cross references, completion, diagnostics, semantic highlighting and more "
HOMEPAGE="https://github.com/cquery-project/cquery"
EGIT_REPO_URI="https://github.com/cquery-project/cquery.git"
#SRC_URI="https://github.com/cquery-project/${PN}/archive/v${PV}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="system-llvm"
RDEPEND=""
DEPEND="${RDEPEND}"

src_configure(){
	local mycmakeargs=(-DSYSTEM_CLAN=ON)
	# if use system-llvm; then
	# 	mycmakeargs+=(
	# 		-DSYSTEM_CLANG=ON
	# 	)
	# else
	# 	mycmakeargs+=(
	# 		-DSYSTEM_CLANG=OFF
	# 	)
	# fi

	cmake-utils_src_configure
}
