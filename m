Return-Path: <linux-renesas-soc+bounces-28291-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cMnCNYPdlGn4IQIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28291-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Feb 2026 22:28:35 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B598150C9C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Feb 2026 22:28:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 60566302410F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Feb 2026 21:28:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E07E2F617F;
	Tue, 17 Feb 2026 21:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dFAPruJ7"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 579AD28C006;
	Tue, 17 Feb 2026 21:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771363681; cv=none; b=T5OTc2QQUvx82HrBTBtFg1bOCp1SWaCW9GwSKj0/tzVEENpX915Ndrz9WkBHgkKLnNB/H6q6XnHikZZSlo2J1kf8Z4gJTWIvwoS/PT4H8P2Rae+YCm/ZJK88AmHPa5gnvE7pfwxTyhPoguvsADOJKTZ8h6cRb4tGy1ll8NC+cU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771363681; c=relaxed/simple;
	bh=DLNJ6thciQ1FKfVLXLBIkij44la3XwigLb80Cl2oDMM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YnQGVYxfRs849f8qhJbX1ffv+CAUJlND1hhLu3rlrOlFaF+oQSz0ZiazbEh7uafAbIzEN2hU/xGd2B2Dylh2t6Wzk5w1Y6ZBk3rSsdcRWIwf95xEu2Z53E96iAGJaBNQZ6DHlwU0BH2x14UUGhspQbENuIxEq8kXgjafmqlHI8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dFAPruJ7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5605C4CEF7;
	Tue, 17 Feb 2026 21:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771363681;
	bh=DLNJ6thciQ1FKfVLXLBIkij44la3XwigLb80Cl2oDMM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dFAPruJ7oNmB/6OQ2buMqtV2VMS9EVMtiTfMkhszpe1fAfZXUoCT9eLz0e2a4qtd2
	 SmaahcBBn74i2BHuv+RpTlb4Okud8413t0Y1CfJ6g+CUNG7nO1bawQekMUSdSLlAhP
	 BNIZxANMEfkRq+OidscQlDaHXTsGqlN1IjKa0YoePQElNH8pPYRyy1UPID+ud1FC/8
	 9iCHg/2yCGtzLvGDj9RIIAPrZSyHGDw38gAHXMOdd5dsn94JyfO9/LPfr7OeJ+XxMD
	 zTWEt/iw0XvgHJvDC/xi8AE41mPAv5F6USPv04JG6Z6mgLAwzCd2IKkOYPGJ6t/VVU
	 YOOUSmCHFLLpg==
From: Niklas Cassel <cassel@kernel.org>
To: Richard Zhu <hongxing.zhu@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Marek Vasut <marek.vasut+renesas@gmail.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>
Cc: Manikanta Maddireddy <mmaddireddy@nvidia.com>,
	Koichiro Den <den@valinux.co.jp>,
	Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>,
	linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	linux-renesas-soc@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH 5/9] PCI: dwc: Replace BAR_RESERVED with BAR_DISABLED in glue drivers
Date: Tue, 17 Feb 2026 22:27:11 +0100
Message-ID: <20260217212707.2450423-16-cassel@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260217212707.2450423-11-cassel@kernel.org>
References: <20260217212707.2450423-11-cassel@kernel.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4691; i=cassel@kernel.org; h=from:subject; bh=DLNJ6thciQ1FKfVLXLBIkij44la3XwigLb80Cl2oDMM=; b=owGbwMvMwCV2MsVw8cxjvkWMp9WSGDKn3NX7eofZL7l0boT87F2/nh3pD4+584evSZ7tm97N1 4Zrf7O+6ChlYRDjYpAVU2Tx/eGyv7jbfcpxxTs2MHNYmUCGMHBxCsBE5G8w/M/7lBqTn/vUik+u 87b5OW2efJFlp5dvk2nZ7cF6INMw/g4jww6Xu419J9mSrokUP75pFvxIVW2FfN0hF9Xnxzk55qV VMgAA
X-Developer-Key: i=cassel@kernel.org; a=openpgp; fpr=5ADE635C0E631CBBD5BE065A352FE6582ED9B5DA
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-28291-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[nxp.com,pengutronix.de,kernel.org,google.com,gmail.com,renesas.com,glider.be,nvidia.com,socionext.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cassel@kernel.org,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 7B598150C9C
X-Rspamd-Action: no action

Most DWC based EPC glue drivers that have BARs marked as BAR_RESERVED in
epc_features also call dw_pcie_ep_reset_bar() for these reserved BARs in
ep->ops->init().

An EPF driver will be able to get/enable BARs that have been disabled/reset
unless they are marked as BAR_RESERVED (see pci_epc_get_next_free_bar()).

Thus all EPC drivers that have a BAR marked as BAR_RESERVED in epc_features
AND call dw_pcie_ep_reset_bar() should really be marked as BAR_DISABLED.

BARs that are marked as BAR_RESERVED in epc_features but for which
dw_pcie_ep_reset_bar() is not called in ep->ops->init() are still kept as
BAR_RESERVED.

No EPC drivers outside drivers/pci/controllers/dwc mark their BARs as
BAR_RESERVED, so there is nothing to do in non-DWC based EPC drivers.

Signed-off-by: Niklas Cassel <cassel@kernel.org>
---
 drivers/pci/controller/dwc/pci-imx6.c         | 12 ++++++------
 drivers/pci/controller/dwc/pcie-rcar-gen4.c   |  6 +++---
 drivers/pci/controller/dwc/pcie-tegra194.c    |  8 ++++----
 drivers/pci/controller/dwc/pcie-uniphier-ep.c |  4 ++--
 4 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
index a5b8d0b71677..ec1e3557ca53 100644
--- a/drivers/pci/controller/dwc/pci-imx6.c
+++ b/drivers/pci/controller/dwc/pci-imx6.c
@@ -1433,19 +1433,19 @@ static int imx_pcie_ep_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
 static const struct pci_epc_features imx8m_pcie_epc_features = {
 	DWC_EPC_COMMON_FEATURES,
 	.msi_capable = true,
-	.bar[BAR_1] = { .type = BAR_RESERVED, },
-	.bar[BAR_3] = { .type = BAR_RESERVED, },
+	.bar[BAR_1] = { .type = BAR_DISABLED, },
+	.bar[BAR_3] = { .type = BAR_DISABLED, },
 	.bar[BAR_4] = { .type = BAR_FIXED, .fixed_size = SZ_256, },
-	.bar[BAR_5] = { .type = BAR_RESERVED, },
+	.bar[BAR_5] = { .type = BAR_DISABLED, },
 	.align = SZ_64K,
 };
 
 static const struct pci_epc_features imx8q_pcie_epc_features = {
 	DWC_EPC_COMMON_FEATURES,
 	.msi_capable = true,
-	.bar[BAR_1] = { .type = BAR_RESERVED, },
-	.bar[BAR_3] = { .type = BAR_RESERVED, },
-	.bar[BAR_5] = { .type = BAR_RESERVED, },
+	.bar[BAR_1] = { .type = BAR_DISABLED, },
+	.bar[BAR_3] = { .type = BAR_DISABLED, },
+	.bar[BAR_5] = { .type = BAR_DISABLED, },
 	.align = SZ_64K,
 };
 
diff --git a/drivers/pci/controller/dwc/pcie-rcar-gen4.c b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
index a6912e85e4dd..9dd05bac22b9 100644
--- a/drivers/pci/controller/dwc/pcie-rcar-gen4.c
+++ b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
@@ -422,10 +422,10 @@ static int rcar_gen4_pcie_ep_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
 static const struct pci_epc_features rcar_gen4_pcie_epc_features = {
 	DWC_EPC_COMMON_FEATURES,
 	.msi_capable = true,
-	.bar[BAR_1] = { .type = BAR_RESERVED, },
-	.bar[BAR_3] = { .type = BAR_RESERVED, },
+	.bar[BAR_1] = { .type = BAR_DISABLED, },
+	.bar[BAR_3] = { .type = BAR_DISABLED, },
 	.bar[BAR_4] = { .type = BAR_FIXED, .fixed_size = 256 },
-	.bar[BAR_5] = { .type = BAR_RESERVED, },
+	.bar[BAR_5] = { .type = BAR_DISABLED, },
 	.align = SZ_1M,
 };
 
diff --git a/drivers/pci/controller/dwc/pcie-tegra194.c b/drivers/pci/controller/dwc/pcie-tegra194.c
index 31aa9a494dbc..9f9453e8cd23 100644
--- a/drivers/pci/controller/dwc/pcie-tegra194.c
+++ b/drivers/pci/controller/dwc/pcie-tegra194.c
@@ -1994,10 +1994,10 @@ static const struct pci_epc_features tegra_pcie_epc_features = {
 	.bar[BAR_0] = { .type = BAR_FIXED, .fixed_size = SZ_1M,
 			.only_64bit = true, },
 	.bar[BAR_1] = { .type = BAR_64BIT_UPPER, },
-	.bar[BAR_2] = { .type = BAR_RESERVED, },
-	.bar[BAR_3] = { .type = BAR_RESERVED, },
-	.bar[BAR_4] = { .type = BAR_RESERVED, },
-	.bar[BAR_5] = { .type = BAR_RESERVED, },
+	.bar[BAR_2] = { .type = BAR_DISABLED, },
+	.bar[BAR_3] = { .type = BAR_DISABLED, },
+	.bar[BAR_4] = { .type = BAR_DISABLED, },
+	.bar[BAR_5] = { .type = BAR_DISABLED, },
 	.align = SZ_64K,
 };
 
diff --git a/drivers/pci/controller/dwc/pcie-uniphier-ep.c b/drivers/pci/controller/dwc/pcie-uniphier-ep.c
index f873a1659592..5bde3ee682b5 100644
--- a/drivers/pci/controller/dwc/pcie-uniphier-ep.c
+++ b/drivers/pci/controller/dwc/pcie-uniphier-ep.c
@@ -429,8 +429,8 @@ static const struct uniphier_pcie_ep_soc_data uniphier_pro5_data = {
 		.bar[BAR_1] = { .type = BAR_64BIT_UPPER, },
 		.bar[BAR_2] = { .only_64bit = true, },
 		.bar[BAR_3] = { .type = BAR_64BIT_UPPER, },
-		.bar[BAR_4] = { .type = BAR_RESERVED, },
-		.bar[BAR_5] = { .type = BAR_RESERVED, },
+		.bar[BAR_4] = { .type = BAR_DISABLED, },
+		.bar[BAR_5] = { .type = BAR_DISABLED, },
 	},
 };
 
-- 
2.53.0


