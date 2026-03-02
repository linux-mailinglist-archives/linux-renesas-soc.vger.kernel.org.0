Return-Path: <linux-renesas-soc+bounces-28619-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MGcAMdtgpWlX/AUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28619-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 02 Mar 2026 11:05:15 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F01A1D6025
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 02 Mar 2026 11:05:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BB98430495EE
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 Mar 2026 10:00:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB0EA3939C6;
	Mon,  2 Mar 2026 10:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c+MpGq1d"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AF4F38F93E;
	Mon,  2 Mar 2026 10:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772445602; cv=none; b=GW1V+9RpID5bVMh2K1U3SAwpAi5KLT2pRjdCZl6StuWb3V9ehS5dKRT+8rNwhzeVRhlMQ91ZYGq7YDOg0PZaNhavzQIZ5BQob4TSpzvlobaIjeeXqJqTeNuHPyPaP3UuN33k1rakg+c5jQNjJVdjRFmEvxEs6SfKgkJuHfu2GNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772445602; c=relaxed/simple;
	bh=IoPwRnzhcjgMfGxBVDJ5aughrS0y6ra32/Xy0hY7TLw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=l1J78x2352vmpvXR7l19zFyy+tqrwninm5tZPspj00iT1gHoJTf6+REcM1mAZypvr3gEOYIIY//NhM4yyenPtftgydsyShf1fmlURHHHB6oDaHidB+TOf5twX4y9+NnxBRMXL6VmGUn7GiF+C0hSLv8sbt+ASsG1mi0RxeNNeXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c+MpGq1d; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1A15C19423;
	Mon,  2 Mar 2026 09:59:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772445602;
	bh=IoPwRnzhcjgMfGxBVDJ5aughrS0y6ra32/Xy0hY7TLw=;
	h=From:To:Cc:Subject:Date:From;
	b=c+MpGq1dnuTjUI7f0FrIbg04S4ve5/201mDbKqansVCUw6ROye6c/d1QelKslSjbF
	 nba0cVLK3eHGlu7U4FA/t8bBHPJoMpo73cDxG0l8/SCtcSRTaEkNqbuzWgwdMpTYRZ
	 Lg/THWXWHObfMlWayI3hhx+JkkDlWbVyNZyrBMWUSnXauUHohb7Y878keSZs/kSMUM
	 48PxGoCsSYXBKycQxMj0s4ihGAHFiYZxyv2Ki8nhknqS7avD0DtBgGwMAJOw7zi0tC
	 8vlwUS9HXOWiK1eYWUSuxV1u1QJgKxdXP1R9e4c0vILJtRJUDRweH2sW7Q7QOaigUI
	 4V9PxzbbkBD/Q==
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
Subject: [PATCH v3 0/9] PCI: endpoint: Differentiate between disabled and reserved BARs
Date: Mon,  2 Mar 2026 10:59:12 +0100
Message-ID: <20260302095913.48155-11-cassel@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2516; i=cassel@kernel.org; h=from:subject; bh=IoPwRnzhcjgMfGxBVDJ5aughrS0y6ra32/Xy0hY7TLw=; b=owGbwMvMwCV2MsVw8cxjvkWMp9WSGDKXxheqFho7TVV4vZNPP2u59rS1LzakLTaM+X7/asqxv n3T7iV86yhlYRDjYpAVU2Tx/eGyv7jbfcpxxTs2MHNYmUCGMHBxCsBElIMYGd7tY5/em1zZdO3m KzvfZ+eOlx/NEF/1eubppbbZQi1PLHgY/mmxcaU+WXH5k4/jHZ8DVSILb83YIv9r9unVb5p6300 KuckHAA==
X-Developer-Key: i=cassel@kernel.org; a=openpgp; fpr=5ADE635C0E631CBBD5BE065A352FE6582ED9B5DA
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-28619-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,arndb.de,linuxfoundation.org,ti.com,google.com,nxp.com,pengutronix.de,gmail.com,axis.com,sntech.de,intel.com,renesas.com,glider.be,foss.st.com,nvidia.com,socionext.com];
	RCVD_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cassel@kernel.org,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_GT_50(0.00)[51];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	NEURAL_HAM(-0.00)[-0.999];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 6F01A1D6025
X-Rspamd-Action: no action

Hello all,

This series was originally written in response to the patch series from
Manikanta Maddireddy that was posted here:
https://lore.kernel.org/linux-pci/291dab65-3fa6-4fc8-90a2-4ad608ca015c@nvidia.com/T/#t

Manikanta has reviewed V1 and will send a small series on top of this one.


Changes since v2:
-Picked up tags from Frank and Koichiro (thank you)
-Fixed a comment in pcie-dw-rockchip.c to no longer reflect the old
 definition of BAR_RESERVED.

Link to v2:
https://lore.kernel.org/linux-pci/20260225170324.4033466-11-cassel@kernel.org/


Koichiro Den (2):
  PCI: endpoint: Describe reserved subregions within BARs
  PCI: dw-rockchip: Describe RK3588 BAR4 DMA ctrl window

Niklas Cassel (7):
  PCI: endpoint: Introduce pci_epc_bar_type BAR_64BIT_UPPER
  PCI: endpoint: Introduce pci_epc_bar_type BAR_DISABLED
  PCI: dwc: Replace certain BAR_RESERVED with BAR_DISABLED in glue
    drivers
  PCI: dwc: Disable BARs in common code instead of in each glue driver
  PCI: endpoint: pci-epf-test: Advertise reserved BARs
  misc: pci_endpoint_test: Give reserved BARs a distinct error code
  selftests: pci_endpoint: Skip reserved BARs

 drivers/misc/pci_endpoint_test.c              | 21 ++++++++-
 drivers/pci/controller/dwc/pci-dra7xx.c       |  4 --
 drivers/pci/controller/dwc/pci-imx6.c         | 22 +++------
 drivers/pci/controller/dwc/pci-keystone.c     | 12 +++++
 .../pci/controller/dwc/pci-layerscape-ep.c    |  8 +---
 drivers/pci/controller/dwc/pcie-artpec6.c     |  4 --
 .../pci/controller/dwc/pcie-designware-ep.c   | 24 ++++++++++
 .../pci/controller/dwc/pcie-designware-plat.c | 10 -----
 drivers/pci/controller/dwc/pcie-dw-rockchip.c | 23 ++++++----
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
 20 files changed, 175 insertions(+), 128 deletions(-)


base-commit: 36bfc3642b19a98f1302aed4437c331df9b481f0
-- 
2.53.0


