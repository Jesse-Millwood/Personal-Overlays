# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit git-r3

DESCRIPTION=""
HOMEPAGE=""

EGIT_REPO_URI="https://github.com/cseed/${PN}.git"

LICENSE="ISC"
SLOT="0"
IUSE=""
REQUIRED_USE=""

# python3
RDEPEND="sci-electronics/iverilog"
DEPEND="${RDEPEND}"
KEYWORDS="~amd64"
