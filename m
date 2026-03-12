Return-Path: <linux-renesas-soc+bounces-29277-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6OTXCqq5smmvPAAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29277-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Mar 2026 14:03:38 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 24610272302
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Mar 2026 14:03:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 18F823009F35
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Mar 2026 13:03:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A4523C3448;
	Thu, 12 Mar 2026 13:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dga9SbPU"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35782322DAF;
	Thu, 12 Mar 2026 13:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773320611; cv=none; b=grO/f+JlgUisFsTqMy/jjcLhRFaEnjCUKr0ap0n5oEPUtcoQso22oHUuj2C0xwXdkaksJKrLvrkWpmKW1Gh1jr7rqQoxYH5crJ3PrQZB6y98hiLWh5x4G2ME3fFDNJwlMqCw9rliukxrz09imTO4paVkVGAyTZyBwCZX5BpWz7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773320611; c=relaxed/simple;
	bh=cLLB+ArEeENMZGpIDLQlTmrUuEp9zeYLFbaAzoRdvnQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nWjytnN0trtokAAybOJcKuVD16RmzHIHSKk8AJ2iWwMI8YwUEQhcMp3WfLj4fSLmMR3N2+T5cAVtbz5N/BmnL7TpsJzpY+/fKDd5OOFmQqMnJfZXcpmxKZudWYR+EmKdekow28qK2AfA94cmUDQmfOoG4G5qO5wPQViVf7It8vo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dga9SbPU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 687ACC2BC86;
	Thu, 12 Mar 2026 13:03:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773320610;
	bh=cLLB+ArEeENMZGpIDLQlTmrUuEp9zeYLFbaAzoRdvnQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dga9SbPUmz60pqdgwRKKbOvq5SYcJ6bJXbCNpuJr0sb/LBM3GqBqQSSfpDGhuD/ko
	 vVA9GNkq9tS4i9n46wr5wb90ZIt1krUCuBQQJHu8bPqUlIajYtpCiR++vhy9r42mEm
	 JcrIMwTaGwi3JoxOPc3DtBNWpqIS8DWmsxifngnTa+t2nU3a5/F1wg3jVO5PRYlwq7
	 wwmTX9g3tBj1A6tmnxJRi1dLG6DF1rn/egoN5WHN8XP1ZYP+FuZ2OITvYyFmHR6K+k
	 PvaVrBMg1yLIyiLlhtpzgFgv2pHyY1p0frEBQ+p1tWvzoEZZrJ925lJHLqo5plb8lb
	 Aats8f8gcs4uw==
From: Niklas Cassel <cassel@kernel.org>
To: Vignesh Raghavendra <vigneshr@ti.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
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
	Masami Hiramatsu <mhiramat@kernel.org>
Cc: Manikanta Maddireddy <mmaddireddy@nvidia.com>,
	Koichiro Den <den@valinux.co.jp>,
	Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>,
	linux-omap@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@axis.com,
	linux-rockchip@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-tegra@vger.kernel.org
Subject: [PATCH v4 07/10] PCI: dwc: Disable BARs in common code instead of in each glue driver
Date: Thu, 12 Mar 2026 14:02:35 +0100
Message-ID: <20260312130229.2282001-19-cassel@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260312130229.2282001-12-cassel@kernel.org>
References: <20260312130229.2282001-12-cassel@kernel.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=14065; i=cassel@kernel.org; h=from:subject; bh=cLLB+ArEeENMZGpIDLQlTmrUuEp9zeYLFbaAzoRdvnQ=; b=owGbwMvMwCV2MsVw8cxjvkWMp9WSGDI37czr7/IXq7xobHTdYUtA8xe7m1M13t5lTv76y+JhJ Zfa/HmsHaUsDGJcDLJiiiy+P1z2F3e7TzmueMcGZg4rE8gQBi5OAZjIjyeMDJc8vmrNkdaJPCOn 0a507IaKwd+XyUtYfWZeuGFhbmCcF8vIcFes/fXXVe3z8u4p8EpnHvy0MoL74P706W/6wpb/PTF NnBUA
X-Developer-Key: i=cassel@kernel.org; a=openpgp; fpr=5ADE635C0E631CBBD5BE065A352FE6582ED9B5DA
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[45];
	FREEMAIL_TO(0.00)[ti.com,kernel.org,google.com,nxp.com,pengutronix.de,gmail.com,axis.com,sntech.de,renesas.com,glider.be,foss.st.com,nvidia.com,socionext.com];
	TAGGED_FROM(0.00)[bounces-29277-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cassel@kernel.org,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,valinux.co.jp:email,nvidia.com:email,nxp.com:email]
X-Rspamd-Queue-Id: 24610272302
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The current EPC core design relies on an EPC driver disabling all BARs by
default. An EPF driver will then enable the BARs that it wants to enabled.

This design is there because there is no epc->ops->disable_bar().
(There is a epc->ops->clear_bar(), but that is only to disable a BAR that
has been enabled using epc->ops->set_bar() first.)

By default, an EPF driver will not be able to get/enable BARs that are
marked as BAR_RESERVED or BAR_DISABLED (see pci_epc_get_next_free_bar()).

Since the current EPC code design requires an EPC driver to disable all
BARs by default, let's move this to DWC common code from each glue driver.

BAR_RESERVED BARs are not disabled by default because these BARs are
hardware backed, and should only be disabled explicitly by an EPF driver
if absolutely necessary for the EPF driver to function correctly.
(This is similar to how e.g. NVMe may have vendor specific BARs outside of
the mandatory BAR0 which contains the NVMe registers.)

Note that there is currently no EPC operation to disable a BAR that has not
first been programmed using pci_epc_set_bar(). If an EPF driver ever wants
to disable a BAR marked as BAR_RESERVED, a disable_bar() operation would
have to be added first.

No functional changes intended.

Tested-by: Manikanta Maddireddy <mmaddireddy@nvidia.com>
Reviewed-by: Manikanta Maddireddy <mmaddireddy@nvidia.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Tested-by: Koichiro Den <den@valinux.co.jp>
Signed-off-by: Niklas Cassel <cassel@kernel.org>
---
 drivers/pci/controller/dwc/pci-dra7xx.c       |  4 ----
 drivers/pci/controller/dwc/pci-imx6.c         | 10 --------
 .../pci/controller/dwc/pci-layerscape-ep.c    |  4 ----
 drivers/pci/controller/dwc/pcie-artpec6.c     |  4 ----
 .../pci/controller/dwc/pcie-designware-ep.c   | 24 +++++++++++++++++++
 .../pci/controller/dwc/pcie-designware-plat.c | 10 --------
 drivers/pci/controller/dwc/pcie-dw-rockchip.c |  8 +------
 drivers/pci/controller/dwc/pcie-qcom-ep.c     | 10 --------
 drivers/pci/controller/dwc/pcie-rcar-gen4.c   | 10 --------
 drivers/pci/controller/dwc/pcie-stm32-ep.c    | 10 --------
 drivers/pci/controller/dwc/pcie-tegra194.c    | 10 --------
 drivers/pci/controller/dwc/pcie-uniphier-ep.c | 10 --------
 12 files changed, 25 insertions(+), 89 deletions(-)

diff --git a/drivers/pci/controller/dwc/pci-dra7xx.c b/drivers/pci/controller/dwc/pci-dra7xx.c
index d5d26229063f..cd904659c321 100644
--- a/drivers/pci/controller/dwc/pci-dra7xx.c
+++ b/drivers/pci/controller/dwc/pci-dra7xx.c
@@ -378,10 +378,6 @@ static void dra7xx_pcie_ep_init(struct dw_pcie_ep *ep)
 {
 	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
 	struct dra7xx_pcie *dra7xx = to_dra7xx_pcie(pci);
-	enum pci_barno bar;
-
-	for (bar = 0; bar < PCI_STD_NUM_BARS; bar++)
-		dw_pcie_ep_reset_bar(pci, bar);
 
 	dra7xx_pcie_enable_wrapper_interrupts(dra7xx);
 }
diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
index ec1e3557ca53..f5fe5cfc46c7 100644
--- a/drivers/pci/controller/dwc/pci-imx6.c
+++ b/drivers/pci/controller/dwc/pci-imx6.c
@@ -1401,15 +1401,6 @@ static const struct dw_pcie_ops dw_pcie_ops = {
 	.stop_link = imx_pcie_stop_link,
 };
 
-static void imx_pcie_ep_init(struct dw_pcie_ep *ep)
-{
-	enum pci_barno bar;
-	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
-
-	for (bar = BAR_0; bar <= BAR_5; bar++)
-		dw_pcie_ep_reset_bar(pci, bar);
-}
-
 static int imx_pcie_ep_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
 				  unsigned int type, u16 interrupt_num)
 {
@@ -1478,7 +1469,6 @@ imx_pcie_ep_get_features(struct dw_pcie_ep *ep)
 }
 
 static const struct dw_pcie_ep_ops pcie_ep_ops = {
-	.init = imx_pcie_ep_init,
 	.raise_irq = imx_pcie_ep_raise_irq,
 	.get_features = imx_pcie_ep_get_features,
 };
diff --git a/drivers/pci/controller/dwc/pci-layerscape-ep.c b/drivers/pci/controller/dwc/pci-layerscape-ep.c
index 79d226e0cc80..8936975ff104 100644
--- a/drivers/pci/controller/dwc/pci-layerscape-ep.c
+++ b/drivers/pci/controller/dwc/pci-layerscape-ep.c
@@ -152,15 +152,11 @@ static void ls_pcie_ep_init(struct dw_pcie_ep *ep)
 	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
 	struct ls_pcie_ep *pcie = to_ls_pcie_ep(pci);
 	struct dw_pcie_ep_func *ep_func;
-	enum pci_barno bar;
 
 	ep_func = dw_pcie_ep_get_func_from_ep(ep, 0);
 	if (!ep_func)
 		return;
 
-	for (bar = 0; bar < PCI_STD_NUM_BARS; bar++)
-		dw_pcie_ep_reset_bar(pci, bar);
-
 	pcie->ls_epc->msi_capable = ep_func->msi_cap ? true : false;
 	pcie->ls_epc->msix_capable = ep_func->msix_cap ? true : false;
 }
diff --git a/drivers/pci/controller/dwc/pcie-artpec6.c b/drivers/pci/controller/dwc/pcie-artpec6.c
index e994b75986c3..55cb957ae1f3 100644
--- a/drivers/pci/controller/dwc/pcie-artpec6.c
+++ b/drivers/pci/controller/dwc/pcie-artpec6.c
@@ -340,15 +340,11 @@ static void artpec6_pcie_ep_init(struct dw_pcie_ep *ep)
 {
 	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
 	struct artpec6_pcie *artpec6_pcie = to_artpec6_pcie(pci);
-	enum pci_barno bar;
 
 	artpec6_pcie_assert_core_reset(artpec6_pcie);
 	artpec6_pcie_init_phy(artpec6_pcie);
 	artpec6_pcie_deassert_core_reset(artpec6_pcie);
 	artpec6_pcie_wait_for_phy(artpec6_pcie);
-
-	for (bar = 0; bar < PCI_STD_NUM_BARS; bar++)
-		dw_pcie_ep_reset_bar(pci, bar);
 }
 
 static int artpec6_pcie_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
diff --git a/drivers/pci/controller/dwc/pcie-designware-ep.c b/drivers/pci/controller/dwc/pcie-designware-ep.c
index 295076cf70de..386bfb7b2bf6 100644
--- a/drivers/pci/controller/dwc/pcie-designware-ep.c
+++ b/drivers/pci/controller/dwc/pcie-designware-ep.c
@@ -1114,6 +1114,28 @@ static void dw_pcie_ep_init_non_sticky_registers(struct dw_pcie *pci)
 	dw_pcie_dbi_ro_wr_dis(pci);
 }
 
+static void dw_pcie_ep_disable_bars(struct dw_pcie_ep *ep)
+{
+	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
+	enum pci_epc_bar_type bar_type;
+	enum pci_barno bar;
+
+	for (bar = 0; bar < PCI_STD_NUM_BARS; bar++) {
+		bar_type = dw_pcie_ep_get_bar_type(ep, bar);
+
+		/*
+		 * Reserved BARs should not get disabled by default. All other
+		 * BAR types are disabled by default.
+		 *
+		 * This is in line with the current EPC core design, where all
+		 * BARs are disabled by default, and then the EPF driver enables
+		 * the BARs it wishes to use.
+		 */
+		if (bar_type != BAR_RESERVED)
+			dw_pcie_ep_reset_bar(pci, bar);
+	}
+}
+
 /**
  * dw_pcie_ep_init_registers - Initialize DWC EP specific registers
  * @ep: DWC EP device
@@ -1196,6 +1218,8 @@ int dw_pcie_ep_init_registers(struct dw_pcie_ep *ep)
 	if (ep->ops->init)
 		ep->ops->init(ep);
 
+	dw_pcie_ep_disable_bars(ep);
+
 	/*
 	 * PCIe r6.0, section 7.9.15 states that for endpoints that support
 	 * PTM, this capability structure is required in exactly one
diff --git a/drivers/pci/controller/dwc/pcie-designware-plat.c b/drivers/pci/controller/dwc/pcie-designware-plat.c
index 8530746ec5cb..d103ab759c4e 100644
--- a/drivers/pci/controller/dwc/pcie-designware-plat.c
+++ b/drivers/pci/controller/dwc/pcie-designware-plat.c
@@ -32,15 +32,6 @@ struct dw_plat_pcie_of_data {
 static const struct dw_pcie_host_ops dw_plat_pcie_host_ops = {
 };
 
-static void dw_plat_pcie_ep_init(struct dw_pcie_ep *ep)
-{
-	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
-	enum pci_barno bar;
-
-	for (bar = 0; bar < PCI_STD_NUM_BARS; bar++)
-		dw_pcie_ep_reset_bar(pci, bar);
-}
-
 static int dw_plat_pcie_ep_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
 				     unsigned int type, u16 interrupt_num)
 {
@@ -73,7 +64,6 @@ dw_plat_pcie_get_features(struct dw_pcie_ep *ep)
 }
 
 static const struct dw_pcie_ep_ops pcie_ep_ops = {
-	.init = dw_plat_pcie_ep_init,
 	.raise_irq = dw_plat_pcie_ep_raise_irq,
 	.get_features = dw_plat_pcie_get_features,
 };
diff --git a/drivers/pci/controller/dwc/pcie-dw-rockchip.c b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
index ecc28093c589..8db27199cfa6 100644
--- a/drivers/pci/controller/dwc/pcie-dw-rockchip.c
+++ b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
@@ -361,13 +361,9 @@ static void rockchip_pcie_ep_hide_broken_ats_cap_rk3588(struct dw_pcie_ep *ep)
 static void rockchip_pcie_ep_init(struct dw_pcie_ep *ep)
 {
 	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
-	enum pci_barno bar;
 
 	rockchip_pcie_enable_l0s(pci);
 	rockchip_pcie_ep_hide_broken_ats_cap_rk3588(ep);
-
-	for (bar = 0; bar < PCI_STD_NUM_BARS; bar++)
-		dw_pcie_ep_reset_bar(pci, bar);
 };
 
 static int rockchip_pcie_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
@@ -415,9 +411,7 @@ static const struct pci_epc_bar_rsvd_region rk3588_bar4_rsvd[] = {
 /*
  * BAR4 on rk3588 exposes the ATU Port Logic Structure to the host regardless of
  * iATU settings for BAR4. This means that BAR4 cannot be used by an EPF driver,
- * so mark it as RESERVED. (rockchip_pcie_ep_init() will disable all BARs by
- * default.) If the host could write to BAR4, the iATU settings (for all other
- * BARs) would be overwritten, resulting in (all other BARs) no longer working.
+ * so mark it as RESERVED.
  */
 static const struct pci_epc_features rockchip_pcie_epc_features_rk3588 = {
 	DWC_EPC_COMMON_FEATURES,
diff --git a/drivers/pci/controller/dwc/pcie-qcom-ep.c b/drivers/pci/controller/dwc/pcie-qcom-ep.c
index ffb4409c0468..8e8c58a42bc3 100644
--- a/drivers/pci/controller/dwc/pcie-qcom-ep.c
+++ b/drivers/pci/controller/dwc/pcie-qcom-ep.c
@@ -859,17 +859,7 @@ qcom_pcie_epc_get_features(struct dw_pcie_ep *pci_ep)
 	return &qcom_pcie_epc_features;
 }
 
-static void qcom_pcie_ep_init(struct dw_pcie_ep *ep)
-{
-	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
-	enum pci_barno bar;
-
-	for (bar = BAR_0; bar <= BAR_5; bar++)
-		dw_pcie_ep_reset_bar(pci, bar);
-}
-
 static const struct dw_pcie_ep_ops pci_ep_ops = {
-	.init = qcom_pcie_ep_init,
 	.raise_irq = qcom_pcie_ep_raise_irq,
 	.get_features = qcom_pcie_epc_get_features,
 };
diff --git a/drivers/pci/controller/dwc/pcie-rcar-gen4.c b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
index 9dd05bac22b9..1198ddc1752c 100644
--- a/drivers/pci/controller/dwc/pcie-rcar-gen4.c
+++ b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
@@ -386,15 +386,6 @@ static void rcar_gen4_pcie_ep_pre_init(struct dw_pcie_ep *ep)
 	writel(PCIEDMAINTSTSEN_INIT, rcar->base + PCIEDMAINTSTSEN);
 }
 
-static void rcar_gen4_pcie_ep_init(struct dw_pcie_ep *ep)
-{
-	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
-	enum pci_barno bar;
-
-	for (bar = 0; bar < PCI_STD_NUM_BARS; bar++)
-		dw_pcie_ep_reset_bar(pci, bar);
-}
-
 static void rcar_gen4_pcie_ep_deinit(struct rcar_gen4_pcie *rcar)
 {
 	writel(0, rcar->base + PCIEDMAINTSTSEN);
@@ -449,7 +440,6 @@ static unsigned int rcar_gen4_pcie_ep_get_dbi2_offset(struct dw_pcie_ep *ep,
 
 static const struct dw_pcie_ep_ops pcie_ep_ops = {
 	.pre_init = rcar_gen4_pcie_ep_pre_init,
-	.init = rcar_gen4_pcie_ep_init,
 	.raise_irq = rcar_gen4_pcie_ep_raise_irq,
 	.get_features = rcar_gen4_pcie_ep_get_features,
 	.get_dbi_offset = rcar_gen4_pcie_ep_get_dbi_offset,
diff --git a/drivers/pci/controller/dwc/pcie-stm32-ep.c b/drivers/pci/controller/dwc/pcie-stm32-ep.c
index c1944b40ce02..a7988dff1045 100644
--- a/drivers/pci/controller/dwc/pcie-stm32-ep.c
+++ b/drivers/pci/controller/dwc/pcie-stm32-ep.c
@@ -28,15 +28,6 @@ struct stm32_pcie {
 	unsigned int perst_irq;
 };
 
-static void stm32_pcie_ep_init(struct dw_pcie_ep *ep)
-{
-	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
-	enum pci_barno bar;
-
-	for (bar = 0; bar < PCI_STD_NUM_BARS; bar++)
-		dw_pcie_ep_reset_bar(pci, bar);
-}
-
 static int stm32_pcie_start_link(struct dw_pcie *pci)
 {
 	struct stm32_pcie *stm32_pcie = to_stm32_pcie(pci);
@@ -82,7 +73,6 @@ stm32_pcie_get_features(struct dw_pcie_ep *ep)
 }
 
 static const struct dw_pcie_ep_ops stm32_pcie_ep_ops = {
-	.init = stm32_pcie_ep_init,
 	.raise_irq = stm32_pcie_raise_irq,
 	.get_features = stm32_pcie_get_features,
 };
diff --git a/drivers/pci/controller/dwc/pcie-tegra194.c b/drivers/pci/controller/dwc/pcie-tegra194.c
index 61b9771004da..6881f0b94c73 100644
--- a/drivers/pci/controller/dwc/pcie-tegra194.c
+++ b/drivers/pci/controller/dwc/pcie-tegra194.c
@@ -1923,15 +1923,6 @@ static irqreturn_t tegra_pcie_ep_pex_rst_irq(int irq, void *arg)
 	return IRQ_HANDLED;
 }
 
-static void tegra_pcie_ep_init(struct dw_pcie_ep *ep)
-{
-	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
-	enum pci_barno bar;
-
-	for (bar = 0; bar < PCI_STD_NUM_BARS; bar++)
-		dw_pcie_ep_reset_bar(pci, bar);
-};
-
 static int tegra_pcie_ep_raise_intx_irq(struct tegra_pcie_dw *pcie, u16 irq)
 {
 	/* Tegra194 supports only INTA */
@@ -2007,7 +1998,6 @@ tegra_pcie_ep_get_features(struct dw_pcie_ep *ep)
 }
 
 static const struct dw_pcie_ep_ops pcie_ep_ops = {
-	.init = tegra_pcie_ep_init,
 	.raise_irq = tegra_pcie_ep_raise_irq,
 	.get_features = tegra_pcie_ep_get_features,
 };
diff --git a/drivers/pci/controller/dwc/pcie-uniphier-ep.c b/drivers/pci/controller/dwc/pcie-uniphier-ep.c
index d6ec6823e180..89fb78200222 100644
--- a/drivers/pci/controller/dwc/pcie-uniphier-ep.c
+++ b/drivers/pci/controller/dwc/pcie-uniphier-ep.c
@@ -203,15 +203,6 @@ static void uniphier_pcie_stop_link(struct dw_pcie *pci)
 	uniphier_pcie_ltssm_enable(priv, false);
 }
 
-static void uniphier_pcie_ep_init(struct dw_pcie_ep *ep)
-{
-	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
-	enum pci_barno bar;
-
-	for (bar = BAR_0; bar <= BAR_5; bar++)
-		dw_pcie_ep_reset_bar(pci, bar);
-}
-
 static int uniphier_pcie_ep_raise_intx_irq(struct dw_pcie_ep *ep)
 {
 	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
@@ -283,7 +274,6 @@ uniphier_pcie_get_features(struct dw_pcie_ep *ep)
 }
 
 static const struct dw_pcie_ep_ops uniphier_pcie_ep_ops = {
-	.init = uniphier_pcie_ep_init,
 	.raise_irq = uniphier_pcie_ep_raise_irq,
 	.get_features = uniphier_pcie_get_features,
 };
-- 
2.53.0


