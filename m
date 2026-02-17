Return-Path: <linux-renesas-soc+bounces-28289-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gGbTNlLdlGn4IQIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28289-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Feb 2026 22:27:46 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 421C0150C22
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Feb 2026 22:27:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 01BDF301E965
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Feb 2026 21:27:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 583EA2F5A36;
	Tue, 17 Feb 2026 21:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HZ+UvMiP"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30612271450;
	Tue, 17 Feb 2026 21:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771363660; cv=none; b=mQPTpkrlOSZi2zuVGFa8PcDCLUSYtv9aDitTCAPuCqb1CRKlOexhCgrZDK1bFSbLzssSaw7apvwhatIUwnIorZpSDn7qRbBowABC0X+RXUOJINu4es3lH+tEsFDtQluKPOZe+xxYh86rUDQ/O3g+WcjU2snVapZeJ6gSfU0NBFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771363660; c=relaxed/simple;
	bh=qNdMPHb96ahPcc/FeBg2GRFGtCGsjvYyDufUCB6E5Ho=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mUlmMdEoq5LZf8EtJS16x30JIQyljvqDeFFX4I/I8OjpeNQJWLHdurtuVo7t5zD/6qe4T8mRRKVW6Ncp61+J5ptMs2hl9AROASv8KBVnhQe5p+w36BbZQh6/VVNi61NQMW0rGr78X7qAU4KrCr4ANgt7soTLOCUKH94ZFvXTbRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HZ+UvMiP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 434F1C19425;
	Tue, 17 Feb 2026 21:27:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771363659;
	bh=qNdMPHb96ahPcc/FeBg2GRFGtCGsjvYyDufUCB6E5Ho=;
	h=From:To:Cc:Subject:Date:From;
	b=HZ+UvMiPz7y6Wfbsg5SRIDmn+CDWDBq3WDUKPIFYPfrmgDfHjQ7tHHZYvBxWMJPsB
	 c/PD0XktfttvuKxs+WJlENDTRUP8uJUYdvpCSgzgXvAFzPfb1B0rOK7s3NAuWfL7OM
	 PDp3ZyEtU/CFNB0WzAkeTuWX12cuXeEN250jg2mphb4+0a1UOP9URjezN/AWag41Q0
	 roA2SWQuJbNqVoB7NWp23sapC1Dm1S393B1Qqcg98UxhXC9rBuSiwP8ArfAEkppYLo
	 6sj4h5uEjhL1y9XxP5IphJD17zDcGD3gK+k+4gZR6DYzXHK6BRPDR/D2adYfFq7DLA
	 JcoQPGf6g5NxA==
From: Niklas Cassel <cassel@kernel.org>
To: Manivannan Sadhasivam <mani@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Richard Zhu <hongxing.zhu@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Minghuan Lian <minghuan.Lian@nxp.com>,
	Mingkai Hu <mingkai.hu@nxp.com>,
	Roy Zang <roy.zang@nxp.com>,
	Jesper Nilsson <jesper.nilsson@axis.com>,
	Jingoo Han <jingoohan1@gmail.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Srikanth Thokala <srikanth.thokala@intel.com>,
	Marek Vasut <marek.vasut+renesas@gmail.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Christian Bruel <christian.bruel@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Shuah Khan <shuah@kernel.org>
Cc: Manikanta Maddireddy <mmaddireddy@nvidia.com>,
	Koichiro Den <den@valinux.co.jp>,
	Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>,
	linux-pci@vger.kernel.org,
	linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@axis.com,
	linux-rockchip@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-tegra@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH 0/9] PCI: endpoint differentiate between disabled and reserved BARs
Date: Tue, 17 Feb 2026 22:27:06 +0100
Message-ID: <20260217212707.2450423-11-cassel@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4061; i=cassel@kernel.org; h=from:subject; bh=qNdMPHb96ahPcc/FeBg2GRFGtCGsjvYyDufUCB6E5Ho=; b=owGbwMvMwCV2MsVw8cxjvkWMp9WSGDKn3NV+yyX95M1+T1HDqxGLE9Ks+cRk7p+2exh8+ZCxj pjCijkGHaUsDGJcDLJiiiy+P1z2F3e7TzmueMcGZg4rE8gQBi5OAZhI+E5GhguPHi2/Xb/y3DHB AIf6hAuN+VPmNN0usdy7vDq+avG27bYM/5S3MBlKbLy8vGB/jfcrobctfIebJrjrnqw9slP/atc TAw4A
X-Developer-Key: i=cassel@kernel.org; a=openpgp; fpr=5ADE635C0E631CBBD5BE065A352FE6582ED9B5DA
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-28289-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,arndb.de,linuxfoundation.org,ti.com,google.com,nxp.com,pengutronix.de,gmail.com,axis.com,sntech.de,intel.com,renesas.com,glider.be,foss.st.com,nvidia.com,socionext.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cassel@kernel.org,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_GT_50(0.00)[51];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 421C0150C22
X-Rspamd-Action: no action

Hello all,

This series is written in response to the patch series from
Manikanta Maddireddy that was posted here:
https://lore.kernel.org/linux-pci/291dab65-3fa6-4fc8-90a2-4ad608ca015c@nvidia.com/T/#t

The reasons why I decided to post this a new series was because the series
above:

1) Adds PCI device and vendor specific code to
drivers/misc/pci_endpoint_test.c. We've worked hard to make sure that
device specific quirks/limitations are communicated via the Capabilities
register, so let's do the same for reserved BARs.

2) My review comment which suggested to convert all uses of BAR_RESERVED
to BAR_DISABLED (except for pci-keystone.c) was ignored.

3) Koichiro has posted a series that allows an EPC driver to define exactly
which hardware backed resources are provided in a BAR_RESERVED BAR. Yet,
this nice improvement was not incorporated. (While Mankata was part of the
discussion, he was not CC:d on the patches that actually implemented this.)

4) The selftests should return skip instead of silent success for a
reserved BAR.

5) As Mankata points out, but did not address, BAR_RESERVED is quite
ambiguous, so it is better to introduce a new BAR_64BIT_UPPER to more
clearly mark the upper part of a 64-bit BAR as this, rather than reuse
BAR_RESERVED.

6) It is possible to remove all the dw_pcie_ep_reset_bar() calls in the
DWC based glue drivers and move it to DWC common code.


Because of all of the above, I thought it was just easier to post a series
with all of the above addressed, as it seemed easier to just show what I
meant rather than to try to explain things with words.

The thing that is missing is to add a patch for pcie-tegra194.c which
converts the BARs to BAR_RESERVED.
Please see patch "PCI: dw-rockchip: Describe RK3588 BAR4 DMA ctrl window"
and do something similar to pcie-tegra194.c.

If we are missing some resources (right now we only have
PCI_EPC_BAR_RSVD_DMA_CTRL_MMIO), then I think we should simple add that
(e.g. PCI_EPC_BAR_RSVD_MSIX).

Mankata, it would be nice if you could test this series, and if you could
provide a pcie-tegra194.c patch that adds the sizes of the eDMA regs +
MSI-X table in BAR_2 and BAR_4.


Kind regards,
Niklas


Koichiro Den (2):
  PCI: endpoint: Describe reserved subregions within BARs
  PCI: dw-rockchip: Describe RK3588 BAR4 DMA ctrl window

Niklas Cassel (7):
  PCI: endpoint: Introduce pci_epc_bar_type BAR_64BIT_UPPER
  PCI: endpoint: Introduce pci_epc_bar_type BAR_DISABLED
  PCI: dwc: Replace BAR_RESERVED with BAR_DISABLED in glue drivers
  PCI: dwc: Disable BARs in common code instead of in each glue driver
  PCI: endpoint: pci-epf-test: Advertise reserved BARs
  misc: pci_endpoint_test: Give reserved BARs a distinct error code
  selftests: pci_endpoint: Skip reserved BARs

 drivers/misc/pci_endpoint_test.c              | 32 ++++++++++++-
 drivers/pci/controller/dwc/pci-dra7xx.c       |  4 --
 drivers/pci/controller/dwc/pci-imx6.c         | 22 +++------
 .../pci/controller/dwc/pci-layerscape-ep.c    |  8 +---
 drivers/pci/controller/dwc/pcie-artpec6.c     |  4 --
 .../pci/controller/dwc/pcie-designware-ep.c   | 24 ++++++++++
 .../pci/controller/dwc/pcie-designware-plat.c | 10 -----
 drivers/pci/controller/dwc/pcie-dw-rockchip.c | 19 +++++---
 drivers/pci/controller/dwc/pcie-keembay.c     |  6 +--
 drivers/pci/controller/dwc/pcie-qcom-ep.c     | 14 +-----
 drivers/pci/controller/dwc/pcie-rcar-gen4.c   | 16 ++-----
 drivers/pci/controller/dwc/pcie-stm32-ep.c    | 10 -----
 drivers/pci/controller/dwc/pcie-tegra194.c    | 20 +++------
 drivers/pci/controller/dwc/pcie-uniphier-ep.c | 24 +++-------
 drivers/pci/controller/pcie-rcar-ep.c         |  6 +--
 drivers/pci/endpoint/functions/pci-epf-test.c | 24 ++++++++++
 drivers/pci/endpoint/pci-epc-core.c           |  6 ++-
 include/linux/pci-epc.h                       | 45 +++++++++++++++++--
 .../pci_endpoint/pci_endpoint_test.c          |  4 ++
 19 files changed, 173 insertions(+), 125 deletions(-)

-- 
2.53.0


