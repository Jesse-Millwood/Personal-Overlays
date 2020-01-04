# Copyright 2019-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rpm

DESCRIPTION="Manage your dotfiles across multiple machines, securely."
HOMEPAGE="https://chezmoi.io/"


SRC_URI="https://github.com/twpayne/chezmoi/releases/download/v1.7.2/${P/-bin/}-1361-x86_64.rpm"


LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND=""
DEPEND="${RDEPEND}"

S="${WORKDIR}"

src_install()
{
	dobin usr/bin/chezmoi
	insinto /usr/share/bash-completion/completions
	doins usr/share/bash-completion/completions/chezmoi
	insinto /usr/share/zsh/site-functions
	doins usr/share/zsh/functions/_chezmoi
	insinto /usr/share/fish/completions
	doins usr/share/fish/completions/chezmoi.fish

}
