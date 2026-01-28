Return-Path: <linux-renesas-soc+bounces-27542-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uNx6E78Memlo2AEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27542-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Jan 2026 14:18:55 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 61CA7A1FC6
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Jan 2026 14:18:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 96B09300BE30
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Jan 2026 13:18:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3780A350D4B;
	Wed, 28 Jan 2026 13:18:29 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3293E225390;
	Wed, 28 Jan 2026 13:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769606309; cv=none; b=Ci+PJQg1B9HMomV4ZjonhCO1YLhHcdZ1LqS6UmxjnnaJa7bAAVvMBAkmgWe7I6JYEZ3LrnUBxZC5tZHx9mRuobtd/nwzIY+/Trp0M43mtN4MMnST10p3vMqPta7lyUsUc0CEhsGimIHZEDggtDDDB2YwZJRz2Kom5GOsjTJ34iM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769606309; c=relaxed/simple;
	bh=IxJmnEiqZgNKfH/klTE+4YEoJB/E7EkvMU7LkHCt9bA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MPa91q9eh7u1UqDRrUSO/m44a0RmjSoOWjEt0bzJ6D+XiOeYsNjdpM6TOQzNHM9NIA8rNfpfBndP0RwkGW3S/sw6cxqfIfVkRvMSa6rojnlbY2bcMXiy4ws0zv8Sp0atzq7KwloNpua7DimP9DU3DB7AFwXWccZ0dYK24rLNgPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: XlERi0gaTmWL4zdyxoj6sw==
X-CSE-MsgGUID: GtdhqjtbSiC0q/C8DdsF9w==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 28 Jan 2026 22:18:26 +0900
Received: from ubuntu.adwin.renesas.com (unknown [10.226.93.11])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 2D74E4166997;
	Wed, 28 Jan 2026 22:18:20 +0900 (JST)
From: John Madieu <john.madieu.xa@bp.renesas.com>
To: claudiu.beznea.uj@bp.renesas.com,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	geert+renesas@glider.be,
	krzk+dt@kernel.org
Cc: robh@kernel.org,
	bhelgaas@google.com,
	conor+dt@kernel.org,
	magnus.damm@gmail.com,
	biju.das.jz@bp.renesas.com,
	linux-pci@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	john.madieu@gmail.com,
	John Madieu <john.madieu.xa@bp.renesas.com>
Subject: [PATCH v3 12/15] PCI: rzg3s-host: Add support for RZ/G3E PCIe controller
Date: Wed, 28 Jan 2026 14:16:43 +0100
Message-ID: <20260128131647.120511-13-john.madieu.xa@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260128131647.120511-1-john.madieu.xa@bp.renesas.com>
References: <20260128131647.120511-1-john.madieu.xa@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.64 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[renesas.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-27542-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FREEMAIL_CC(0.00)[kernel.org,google.com,gmail.com,bp.renesas.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.870];
	FROM_NEQ_ENVFROM(0.00)[john.madieu.xa@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,renesas.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 61CA7A1FC6
X-Rspamd-Action: no action

Add support for the PCIe controller found in RZ/G3E SoCs to the existing
RZ/G3S PCIe host driver. The RZ/G3E PCIe controller is similar to the
RZ/G3S's, with the following key differences:

 - Supports PCIe Gen3 (8.0 GT/s) link speeds alongside Gen2 (5.0 GT/s)
 - Uses a different reset control mechanism via AXI registers instead
   of the Linux reset framework
 - Requires specific SYSC configuration for link state control and
   Root Complex mode selection

Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
---

Changes:

v3: No changes

v2:
 - Restructure as per Claudiu's comments
 - Properly wrap multi-line statements
 - Removed driver-specif code for init-off reset. This is now Document
   from CPG driver.

 drivers/pci/controller/pcie-rzg3s-host.c | 167 ++++++++++++++++++++---
 1 file changed, 146 insertions(+), 21 deletions(-)

diff --git a/drivers/pci/controller/pcie-rzg3s-host.c b/drivers/pci/controller/pcie-rzg3s-host.c
index 985414076a85..240635dafe69 100644
--- a/drivers/pci/controller/pcie-rzg3s-host.c
+++ b/drivers/pci/controller/pcie-rzg3s-host.c
@@ -111,6 +111,16 @@
 #define RZG3S_PCI_PERM_CFG_HWINIT_EN		BIT(2)
 #define RZG3S_PCI_PERM_PIPE_PHY_REG_EN		BIT(1)
 
+/* RZ/G3E specific registers */
+#define RZG3E_PCI_RESET				0x310
+#define RZG3E_PCI_RESET_RST_OUT_B		BIT(6)
+#define RZG3E_PCI_RESET_RST_PS_B		BIT(5)
+#define RZG3E_PCI_RESET_RST_LOAD_B		BIT(4)
+#define RZG3E_PCI_RESET_RST_CFG_B		BIT(3)
+#define RZG3E_PCI_RESET_RST_RSM_B		BIT(2)
+#define RZG3E_PCI_RESET_RST_GP_B		BIT(1)
+#define RZG3E_PCI_RESET_RST_B			BIT(0)
+
 #define RZG3S_PCI_MSIRE(id)			(0x600 + (id) * 0x10)
 #define RZG3S_PCI_MSIRE_ENA			BIT(0)
 
@@ -183,9 +193,13 @@ struct rzg3s_sysc_function {
 /**
  * struct rzg3s_sysc_info - RZ/G3S System Controller function info
  * @rst_rsm_b: Reset RSM_B function descriptor
+ * @l1_allow: L1 power state management function descriptor
+ * @mode: Mode configuration function descriptor
  */
 struct rzg3s_sysc_info {
 	struct rzg3s_sysc_function rst_rsm_b;
+	struct rzg3s_sysc_function l1_allow;
+	struct rzg3s_sysc_function mode;
 };
 
 /**
@@ -1124,6 +1138,49 @@ static int rzg3s_config_deinit(struct rzg3s_pcie_host *host)
 					 host->cfg_resets);
 }
 
+/* RZ/G3E SoC-specific config implementations */
+static void rzg3e_pcie_config_pre_init(struct rzg3s_pcie_host *host)
+{
+	/*
+	 * De-assert LOAD_B and CFG_B during configuration phase.
+	 * These are part of the RZ/G3E reset register, not reset framework.
+	 * Other reset bits remain asserted until config_post_init.
+	 */
+	rzg3s_pcie_update_bits(host->axi, RZG3E_PCI_RESET,
+			       RZG3E_PCI_RESET_RST_LOAD_B | RZG3E_PCI_RESET_RST_CFG_B,
+			       RZG3E_PCI_RESET_RST_LOAD_B | RZG3E_PCI_RESET_RST_CFG_B);
+}
+
+static int rzg3e_config_deinit(struct rzg3s_pcie_host *host)
+{
+	writel_relaxed(0, host->axi + RZG3E_PCI_RESET);
+	return 0;
+}
+
+static int rzg3e_config_post_init(struct rzg3s_pcie_host *host)
+{
+	/* De-assert PS_B, GP_B, RST_B */
+	rzg3s_pcie_update_bits(host->axi, RZG3E_PCI_RESET,
+			       RZG3E_PCI_RESET_RST_PS_B | RZG3E_PCI_RESET_RST_GP_B |
+			       RZG3E_PCI_RESET_RST_B,
+			       RZG3E_PCI_RESET_RST_PS_B | RZG3E_PCI_RESET_RST_GP_B |
+			       RZG3E_PCI_RESET_RST_B);
+
+	/*
+	 * According to the RZ/G3E HW manual (Rev.1.15, Table 6.6-130
+	 * Initialization Procedure (RC)), hardware requires >= 500us delay
+	 * before final reset deassert.
+	 */
+	fsleep(500);
+
+	/* De-assert OUT_B and RSM_B to complete reset sequence */
+	rzg3s_pcie_update_bits(host->axi, RZG3E_PCI_RESET,
+			       RZG3E_PCI_RESET_RST_OUT_B | RZG3E_PCI_RESET_RST_RSM_B,
+			       RZG3E_PCI_RESET_RST_OUT_B | RZG3E_PCI_RESET_RST_RSM_B);
+
+	return 0;
+}
+
 static void rzg3s_pcie_irq_init(struct rzg3s_pcie_host *host)
 {
 	/*
@@ -1268,6 +1325,7 @@ static int rzg3s_pcie_host_init_port(struct rzg3s_pcie_host *host)
 
 static int rzg3s_pcie_host_init(struct rzg3s_pcie_host *host)
 {
+	const struct rzg3s_sysc_info *sysc_info = host->sysc->info;
 	u32 val;
 	int ret;
 
@@ -1284,6 +1342,16 @@ static int rzg3s_pcie_host_init(struct rzg3s_pcie_host *host)
 	if (ret)
 		goto config_deinit;
 
+	/* Enable ASPM L1 transition for SoCs that use it */
+	if (sysc_info->l1_allow.mask) {
+		ret = regmap_update_bits(host->sysc->regmap,
+					 sysc_info->l1_allow.offset,
+					 sysc_info->l1_allow.mask,
+					 field_prep(sysc_info->l1_allow.mask, 1));
+		if (ret)
+			goto config_deinit;
+	}
+
 	/* Initialize the interrupts */
 	rzg3s_pcie_irq_init(host);
 
@@ -1636,11 +1704,25 @@ static int rzg3s_pcie_probe(struct platform_device *pdev)
 		goto port_refclk_put;
 	}
 
-	ret = regmap_update_bits(sysc->regmap, sysc->info->rst_rsm_b.offset,
-				 sysc->info->rst_rsm_b.mask,
-				 field_prep(sysc->info->rst_rsm_b.mask, 1));
-	if (ret)
-		goto port_refclk_put;
+	/*
+	 * Put controller in RC (Root Complex) mode for SoCs that
+	 * support it. These can operate in either EP or RC mode.
+	 */
+	if (sysc->info->mode.mask) {
+		ret = regmap_write(sysc->regmap, sysc->info->mode.offset,
+				   sysc->info->mode.mask);
+		if (ret)
+			goto port_refclk_put;
+	}
+
+	if (sysc->info->rst_rsm_b.mask) {
+		ret = regmap_update_bits(sysc->regmap,
+					 sysc->info->rst_rsm_b.offset,
+					 sysc->info->rst_rsm_b.mask,
+					 field_prep(sysc->info->rst_rsm_b.mask, 1));
+		if (ret)
+			goto port_refclk_put;
+	}
 
 	ret = rzg3s_pcie_resets_prepare_and_get(host);
 	if (ret)
@@ -1690,9 +1772,12 @@ static int rzg3s_pcie_probe(struct platform_device *pdev)
 	 * SYSC RST_RSM_B signal need to be asserted before turning off the
 	 * power to the PHY.
 	 */
-	regmap_update_bits(sysc->regmap, sysc->info->rst_rsm_b.offset,
-			   sysc->info->rst_rsm_b.mask,
-			   field_prep(sysc->info->rst_rsm_b.mask, 0));
+	if (sysc->info->rst_rsm_b.mask) {
+		regmap_update_bits(sysc->regmap,
+				   sysc->info->rst_rsm_b.offset,
+				   sysc->info->rst_rsm_b.mask,
+				   field_prep(sysc->info->rst_rsm_b.mask, 0));
+	}
 port_refclk_put:
 	clk_put(host->port.refclk);
 
@@ -1723,11 +1808,14 @@ static int rzg3s_pcie_suspend_noirq(struct device *dev)
 	if (ret)
 		goto config_reinit;
 
-	ret = regmap_update_bits(sysc->regmap, sysc->info->rst_rsm_b.offset,
-				 sysc->info->rst_rsm_b.mask,
-				 field_prep(sysc->info->rst_rsm_b.mask, 0));
-	if (ret)
-		goto power_resets_restore;
+	if (sysc->info->rst_rsm_b.mask) {
+		ret = regmap_update_bits(sysc->regmap,
+					 sysc->info->rst_rsm_b.offset,
+					 sysc->info->rst_rsm_b.mask,
+					 field_prep(sysc->info->rst_rsm_b.mask, 0));
+		if (ret)
+			goto power_resets_restore;
+	}
 
 	return 0;
 
@@ -1750,11 +1838,21 @@ static int rzg3s_pcie_resume_noirq(struct device *dev)
 	struct rzg3s_sysc *sysc = host->sysc;
 	int ret;
 
-	ret = regmap_update_bits(sysc->regmap, sysc->info->rst_rsm_b.offset,
-				 sysc->info->rst_rsm_b.mask,
-				 field_prep(sysc->info->rst_rsm_b.mask, 1));
-	if (ret)
-		return ret;
+	if (sysc->info->mode.mask) {
+		ret = regmap_write(sysc->regmap, sysc->info->mode.offset,
+				   sysc->info->mode.mask);
+		if (ret)
+			return ret;
+	}
+
+	if (sysc->info->rst_rsm_b.mask) {
+		ret = regmap_update_bits(sysc->regmap,
+					 sysc->info->rst_rsm_b.offset,
+					 sysc->info->rst_rsm_b.mask,
+					 field_prep(sysc->info->rst_rsm_b.mask, 1));
+		if (ret)
+			return ret;
+	}
 
 	ret = rzg3s_pcie_power_resets_deassert(host);
 	if (ret)
@@ -1781,9 +1879,12 @@ static int rzg3s_pcie_resume_noirq(struct device *dev)
 	reset_control_bulk_assert(data->num_power_resets,
 				  host->power_resets);
 assert_rst_rsm_b:
-	regmap_update_bits(sysc->regmap, sysc->info->rst_rsm_b.offset,
-			   sysc->info->rst_rsm_b.mask,
-			   field_prep(sysc->info->rst_rsm_b.mask, 0));
+	if (sysc->info->rst_rsm_b.mask) {
+		regmap_update_bits(sysc->regmap,
+				   sysc->info->rst_rsm_b.offset,
+				   sysc->info->rst_rsm_b.mask,
+				   field_prep(sysc->info->rst_rsm_b.mask, 0));
+	}
 	return ret;
 }
 
@@ -1816,11 +1917,35 @@ static const struct rzg3s_pcie_soc_data rzg3s_soc_data = {
 	},
 };
 
+static const char * const rzg3e_soc_power_resets[] = { "aresetn" };
+
+static const struct rzg3s_pcie_soc_data rzg3e_soc_data = {
+	.power_resets = rzg3e_soc_power_resets,
+	.num_power_resets = ARRAY_SIZE(rzg3e_soc_power_resets),
+	.config_pre_init = rzg3e_pcie_config_pre_init,
+	.config_post_init = rzg3e_config_post_init,
+	.config_deinit = rzg3e_config_deinit,
+	.sysc_info = {
+		.l1_allow = {
+			.offset = 0x1020,
+			.mask = BIT(0),
+		},
+		.mode = {
+			.offset = 0x1024,
+			.mask = BIT(0),
+		},
+	},
+};
+
 static const struct of_device_id rzg3s_pcie_of_match[] = {
 	{
 		.compatible = "renesas,r9a08g045-pcie",
 		.data = &rzg3s_soc_data,
 	},
+	{
+		.compatible = "renesas,r9a09g047-pcie",
+		.data = &rzg3e_soc_data,
+	},
 	{}
 };
 
-- 
2.25.1


