Return-Path: <linux-renesas-soc+bounces-29274-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6IyQOzS6smmvPAAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29274-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Mar 2026 14:05:57 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A21A272413
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Mar 2026 14:05:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 723913070966
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Mar 2026 13:02:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7B1D3C3456;
	Thu, 12 Mar 2026 13:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l9mus12T"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90A03377ECC;
	Thu, 12 Mar 2026 13:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773320576; cv=none; b=lRlznHGw4aUMA9kRRQWnyhZB662HD8HwDjVhs0DqqsFieSHTe6Gq9qa/xKAl2DJmxJFhAFEpAE5wDGFYYEiKT4NOlybPDpgfvy1AMRiijKsUnu8mDY+ELN2n9ISR8eNfvt5RoemCzjUluoIniMAme7DUuNb+Tzq174PbA35xGws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773320576; c=relaxed/simple;
	bh=TgSk+4s2logLCJYw1/1V/0WBGOGe8vlm4vuaxQUrDRo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bYRuPA+V6rXKfyCSQ+gVF39F26Ec3n3UpEZpBlbHInyPCh5S7tVkMOLPGuW98kqrFMWrV3WCnGr1LGR+bG23Sz4GJLplVlI8kp/utXiJEdaASqhkREOEVKZ8kjPtMttWNaYEGZHJ/GoMvMQkNy5hYga6jPSK4mqMWDbyQcSezes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l9mus12T; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AB65C4CEF7;
	Thu, 12 Mar 2026 13:02:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773320576;
	bh=TgSk+4s2logLCJYw1/1V/0WBGOGe8vlm4vuaxQUrDRo=;
	h=From:To:Cc:Subject:Date:From;
	b=l9mus12TCdN4ONMZHKmRMj7JZrcmLc6V/uu15lWYvKQwiyXIeEccIOyh9QWblL840
	 XKM9Xj20k3BUXAaQOUbsjssa36sXddRoOn+uRISawFuV/ynuA8loLqmzVY9HKBy8Bo
	 OjxdKGCE0Bfv/BXS+gzNCxBUQFPqi9bwEC9IWLa50KFU/wHaTQiY0fQ+Fnyb1zQd+j
	 qMeTgvH6J3q+E9LZyxMAdMjNGGxOVx0WqEKl4wo6QB3VrnwudN4kwgt/eKKj1CqQJ5
	 p7QaIEBtR82xTJJxeiMar/y7cMH4nNfKM+k8CkFlOsZ2HuDTwU4gBQ2ce0bX39jILm
	 3gn4Z9eMAEnSw==
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
Subject: [PATCH v4 00/10] PCI: endpoint: Differentiate between disabled and reserved BARs
Date: Thu, 12 Mar 2026 14:02:28 +0100
Message-ID: <20260312130229.2282001-12-cassel@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2686; i=cassel@kernel.org; h=from:subject; bh=TgSk+4s2logLCJYw1/1V/0WBGOGe8vlm4vuaxQUrDRo=; b=owGbwMvMwCV2MsVw8cxjvkWMp9WSGDI37UzN2dLNHDzr3bFkpbmbuvLOSQax7F/j874n3+aSi KahfSdLRykLgxgXg6yYIovvD5f9xd3uU44r3rGBmcPKBDKEgYtTACbydSYjw1PmY1NLXJUtzn+R 6X1joBrv12+ZfCb7h5VwRsB0F9bjFxkZVoT+ns4Zd255TqnKJrPrnfdf5v57cd3wNjOP3VTX8r9 LGAA=
X-Developer-Key: i=cassel@kernel.org; a=openpgp; fpr=5ADE635C0E631CBBD5BE065A352FE6582ED9B5DA
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-29274-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,arndb.de,linuxfoundation.org,ti.com,google.com,nxp.com,pengutronix.de,gmail.com,axis.com,sntech.de,intel.com,renesas.com,glider.be,foss.st.com,nvidia.com,socionext.com];
	RCVD_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cassel@kernel.org,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_GT_50(0.00)[51];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 7A21A272413
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello all,

This series was originally written in response to the patch series from
Manikanta Maddireddy that was posted here:
https://lore.kernel.org/linux-pci/291dab65-3fa6-4fc8-90a2-4ad608ca015c@nvidia.com/T/#t

Manikanta has reviewed this series and will send a small series on top of
this one.


Changes since v3:
-Modified patch 1 to simply drop BAR_RESERVED for a BAR following an
 only_64bit BAR (Manivannan).
-Added a patch from Manikanta, to make his follow-up series smaller,
 since this series touches the same lines anyway.

Link to v3:
https://lore.kernel.org/linux-pci/20260302095913.48155-11-cassel@kernel.org/


Koichiro Den (2):
  PCI: endpoint: Describe reserved subregions within BARs
  PCI: dw-rockchip: Describe RK3588 BAR4 DMA ctrl window

Manikanta Maddireddy (1):
  PCI: endpoint: Allow only_64bit on BAR_RESERVED

Niklas Cassel (7):
  PCI: endpoint: Do not mark the BAR succeeding a 64-bit BAR as
    BAR_RESERVED
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
 .../pci/controller/dwc/pci-layerscape-ep.c    |  6 ---
 drivers/pci/controller/dwc/pcie-artpec6.c     |  4 --
 .../pci/controller/dwc/pcie-designware-ep.c   | 24 ++++++++++
 .../pci/controller/dwc/pcie-designware-plat.c | 10 ----
 drivers/pci/controller/dwc/pcie-dw-rockchip.c | 23 ++++++----
 drivers/pci/controller/dwc/pcie-keembay.c     |  3 --
 drivers/pci/controller/dwc/pcie-qcom-ep.c     | 12 -----
 drivers/pci/controller/dwc/pcie-rcar-gen4.c   | 16 ++-----
 drivers/pci/controller/dwc/pcie-stm32-ep.c    | 10 ----
 drivers/pci/controller/dwc/pcie-tegra194.c    | 19 ++------
 drivers/pci/controller/dwc/pcie-uniphier-ep.c | 19 +-------
 drivers/pci/controller/pcie-rcar-ep.c         |  3 --
 drivers/pci/endpoint/functions/pci-epf-test.c | 24 ++++++++++
 drivers/pci/endpoint/pci-epc-core.c           |  5 +-
 include/linux/pci-epc.h                       | 46 +++++++++++++++----
 .../pci_endpoint/pci_endpoint_test.c          |  4 ++
 20 files changed, 154 insertions(+), 133 deletions(-)


base-commit: 0b74f7d72399d4c4422ed3d68ef28b3612f71e74
-- 
2.53.0


