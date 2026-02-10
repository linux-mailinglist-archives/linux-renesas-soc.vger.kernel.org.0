Return-Path: <linux-renesas-soc+bounces-28129-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8HmwNY8Xi2m3PwAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28129-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Feb 2026 12:33:35 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BC4811A412
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Feb 2026 12:33:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6F86B3036E91
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Feb 2026 11:33:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F9323195F9;
	Tue, 10 Feb 2026 11:33:32 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CDAC318BAF;
	Tue, 10 Feb 2026 11:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770723212; cv=none; b=eXjM2K2O0EVn6zJNvbFkmXm03LZgGrQA4HoVdhvYRJICorTlro2B8ebHABRw0w8z5SCgJ0Xt44TeeuWaB3zc2UqmGo6XNDyOGd9iO3C4/I1dKRjQHgRwiIvsifpQ9YGIWyAIhO17w7697pjx7D9TeK3OC5aDhDC+jBD3MPq/+iI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770723212; c=relaxed/simple;
	bh=DSMgdRPtg6TSqtdGbc/DLpA50jTB6vLb/P/wf4ev1dk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hteXmtPsMTkevENc4U2y1vj3A4rVRo9TJjKnZNpar1jCcGNg0DRmxm57keY5SXIn5s0+k+UGDkP9GxXlLGGfu/Nf0uadnxkUPPG9nblC0YTlG+GxTVuCIu1QIrOQDFLnLWGyuITOBeoEoWh4MXt0ao8Py+JEN13ijqVolWME+5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: OlIdxtJXRFGx7SP7gYcaDg==
X-CSE-MsgGUID: 66UGISzaQe+eDVRaK3V5Lg==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 10 Feb 2026 20:33:30 +0900
Received: from ubuntu.adwin.renesas.com (unknown [10.226.92.55])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 070CF41A1194;
	Tue, 10 Feb 2026 20:33:24 +0900 (JST)
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
Subject: [PATCH v5 13/16] PCI: rzg3s-host: Add support for RZ/G3E PCIe controller
Date: Tue, 10 Feb 2026 12:30:37 +0100
Message-ID: <20260210113041.138430-14-john.madieu.xa@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260210113041.138430-1-john.madieu.xa@bp.renesas.com>
References: <20260210113041.138430-1-john.madieu.xa@bp.renesas.com>
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
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[renesas.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FREEMAIL_CC(0.00)[kernel.org,google.com,gmail.com,bp.renesas.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-28129-lists,linux-renesas-soc=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[john.madieu.xa@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	R_DKIM_NA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,renesas.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 7BC4811A412
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

v5:
 - Introduce rzg3s_sysc_config() helper for sys configuration

v4: No changes
v3: No changes
v2: Collected tag.

 drivers/pci/controller/pcie-rzg3s-host.c | 152 ++++++++++++++++++++---
 1 file changed, 137 insertions(+), 15 deletions(-)

diff --git a/drivers/pci/controller/pcie-rzg3s-host.c b/drivers/pci/controller/pcie-rzg3s-host.c
index 22858a876fd8..77313cc01c02 100644
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
@@ -1266,6 +1323,47 @@ static int rzg3s_pcie_host_init_port(struct rzg3s_pcie_host *host)
 	return ret;
 }
 
+/**
+ * rzg3s_sysc_config - Configure SYSC registers for PCIe
+ * @sysc: SYSC descriptor
+ * @mode: Mode value to set (-1 to skip)
+ * @rsm_b: RST_RSM_B value to set (-1 to skip)
+ * @l1_allow: L1_ALLOW value to set (-1 to skip)
+ *
+ * Return: 0 on success, negative error code on failure
+ */
+static int rzg3s_sysc_config(struct rzg3s_sysc *sysc, int mode, int rsm_b,
+			     int l1_allow)
+{
+	const struct rzg3s_sysc_info *info = sysc->info;
+	int ret;
+
+	if (mode >= 0 && info->mode.mask) {
+		ret = regmap_write(sysc->regmap, info->mode.offset,
+				   field_prep(info->mode.mask, mode));
+		if (ret)
+			return ret;
+	}
+
+	if (rsm_b >= 0 && info->rst_rsm_b.mask) {
+		ret = regmap_update_bits(sysc->regmap, info->rst_rsm_b.offset,
+					 info->rst_rsm_b.mask,
+					 field_prep(info->rst_rsm_b.mask, rsm_b));
+		if (ret)
+			return ret;
+	}
+
+	if (l1_allow >= 0 && info->l1_allow.mask) {
+		ret = regmap_update_bits(sysc->regmap, info->l1_allow.offset,
+					 info->l1_allow.mask,
+					 field_prep(info->l1_allow.mask, l1_allow));
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
 static int rzg3s_pcie_host_init(struct rzg3s_pcie_host *host)
 {
 	u32 val;
@@ -1284,6 +1382,11 @@ static int rzg3s_pcie_host_init(struct rzg3s_pcie_host *host)
 	if (ret)
 		goto config_deinit;
 
+	/* Enable ASPM L1 transition for SoCs that use it */
+	ret = rzg3s_sysc_config(host->sysc, -1, -1, 1);
+	if (ret)
+		goto config_deinit;
+
 	/* Initialize the interrupts */
 	rzg3s_pcie_irq_init(host);
 
@@ -1631,9 +1734,12 @@ static int rzg3s_pcie_probe(struct platform_device *pdev)
 		goto port_refclk_put;
 	}
 
-	ret = regmap_update_bits(sysc->regmap, sysc->info->rst_rsm_b.offset,
-				 sysc->info->rst_rsm_b.mask,
-				 field_prep(sysc->info->rst_rsm_b.mask, 1));
+	/*
+	 * Put controller in RC (Root Complex) mode for SoCs that
+	 * support it. These can operate in either EP or RC mode.
+	 * While at it, do also de-assert RST_RSM_B.
+	 */
+	ret = rzg3s_sysc_config(sysc, 1, 1, -1);
 	if (ret)
 		goto port_refclk_put;
 
@@ -1685,9 +1791,7 @@ static int rzg3s_pcie_probe(struct platform_device *pdev)
 	 * SYSC RST_RSM_B signal need to be asserted before turning off the
 	 * power to the PHY.
 	 */
-	regmap_update_bits(sysc->regmap, sysc->info->rst_rsm_b.offset,
-			   sysc->info->rst_rsm_b.mask,
-			   field_prep(sysc->info->rst_rsm_b.mask, 0));
+	rzg3s_sysc_config(sysc, -1, 0, -1);
 port_refclk_put:
 	clk_put(host->port.refclk);
 
@@ -1718,9 +1822,7 @@ static int rzg3s_pcie_suspend_noirq(struct device *dev)
 	if (ret)
 		goto config_reinit;
 
-	ret = regmap_update_bits(sysc->regmap, sysc->info->rst_rsm_b.offset,
-				 sysc->info->rst_rsm_b.mask,
-				 field_prep(sysc->info->rst_rsm_b.mask, 0));
+	ret = rzg3s_sysc_config(sysc, -1, 0, -1);
 	if (ret)
 		goto power_resets_restore;
 
@@ -1745,9 +1847,7 @@ static int rzg3s_pcie_resume_noirq(struct device *dev)
 	struct rzg3s_sysc *sysc = host->sysc;
 	int ret;
 
-	ret = regmap_update_bits(sysc->regmap, sysc->info->rst_rsm_b.offset,
-				 sysc->info->rst_rsm_b.mask,
-				 field_prep(sysc->info->rst_rsm_b.mask, 1));
+	ret = rzg3s_sysc_config(sysc, 1, 1, -1);
 	if (ret)
 		return ret;
 
@@ -1776,9 +1876,7 @@ static int rzg3s_pcie_resume_noirq(struct device *dev)
 	reset_control_bulk_assert(data->num_power_resets,
 				  host->power_resets);
 assert_rst_rsm_b:
-	regmap_update_bits(sysc->regmap, sysc->info->rst_rsm_b.offset,
-			   sysc->info->rst_rsm_b.mask,
-			   field_prep(sysc->info->rst_rsm_b.mask, 0));
+	rzg3s_sysc_config(sysc, -1, 0, -1);
 	return ret;
 }
 
@@ -1811,11 +1909,35 @@ static const struct rzg3s_pcie_soc_data rzg3s_soc_data = {
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


