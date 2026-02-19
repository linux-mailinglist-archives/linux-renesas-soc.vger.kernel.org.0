Return-Path: <linux-renesas-soc+bounces-28328-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ECbRNNOQl2mR0gIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28328-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Feb 2026 23:38:11 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 70A7D163464
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Feb 2026 23:38:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 10C7A302528C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Feb 2026 22:37:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 528AE32C926;
	Thu, 19 Feb 2026 22:37:20 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A9222EDD52;
	Thu, 19 Feb 2026 22:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771540640; cv=none; b=PViRX8++q1iokYg0XrwnKVaSmfqfrveVMR4I1jGcmxhmhRWevNf+W3Jr77s8taz3U1q3F7Lj/lrkGdnnZXcvKjJtN9bhVcDAznJzt+zZvISapVzHiLrCKMBlyxs54jhnU4k3k5fSZYZnFE5Y6X1fiVD6kzq5Hk/QoQX5vGqNa74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771540640; c=relaxed/simple;
	bh=qkIgsdJ0u0LTDJLeUY/eCgs/LQqcmGfsUF+7Oi1KYpU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ty1iS+l4rvkffsoTGPi6z+z5P2OKnP9Hz0ixB+1UcuXec3vseFyel/YFXEijHc0emp2chHc5Nwys8/lLKMz+4TlMmLd6CnDFPuSJtbY2d1x2MJOJVza2WBAXPSdwdy4TbCrJiVylw+POTIUBI9U7P5sLSY2W99whkbRD5lbwhBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: f2w25FvjSk+s/a+pPpuzEw==
X-CSE-MsgGUID: RfQkhIdGSFGXsqIRZxS8JQ==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 20 Feb 2026 07:37:18 +0900
Received: from ubuntu.adwin.renesas.com (unknown [10.24.0.22])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 1216C4006196;
	Fri, 20 Feb 2026 07:37:12 +0900 (JST)
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
Subject: [PATCH v6 13/16] PCI: rzg3s-host: Add support for RZ/G3E PCIe controller
Date: Thu, 19 Feb 2026 23:35:39 +0100
Message-ID: <20260219223542.6364-14-john.madieu.xa@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260219223542.6364-1-john.madieu.xa@bp.renesas.com>
References: <20260219223542.6364-1-john.madieu.xa@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[renesas.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-28328-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FREEMAIL_CC(0.00)[kernel.org,google.com,gmail.com,bp.renesas.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.970];
	FROM_NEQ_ENVFROM(0.00)[john.madieu.xa@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,bp.renesas.com:mid]
X-Rspamd-Queue-Id: 70A7D163464
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

v6:
  - Use rzg3s_sysc_config_func() with per-function calls instead of
    rzg3s_sysc_config() with -1 skip pattern, as suggested by Claudiu
  - Extend enum rzg3s_sysc_func_id with L1_ALLOW and MODE entries
  - Use regmap_update_bits() consistently for all SYSC accesses
  - Shorten comment to "Put controller in RC mode and de-assert RST_RSM_B."
  - Drop "Enable ASPM L1 transition" comment (function ID is self-documenting)

v5:
  - Introduce rzg3s_sysc_config() helper for sys configuration

v4: No changes
v3: No changes

 drivers/pci/controller/pcie-rzg3s-host.c | 98 ++++++++++++++++++++++++
 1 file changed, 98 insertions(+)

diff --git a/drivers/pci/controller/pcie-rzg3s-host.c b/drivers/pci/controller/pcie-rzg3s-host.c
index 413978feba1a..021b01746157 100644
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
 
@@ -184,10 +194,14 @@ struct rzg3s_sysc_function {
 /**
  * enum rzg3s_sysc_func_id - System controller function IDs
  * @RZG3S_SYSC_FUNC_ID_RST_RSM_B: RST_RSM_B SYSC function ID
+ * @RZG3S_SYSC_FUNC_ID_L1_ALLOW: L1 allow SYSC function ID
+ * @RZG3S_SYSC_FUNC_ID_MODE: Mode SYSC function ID
  * @RZG3S_SYSC_FUNC_ID_MAX: Max SYSC function ID
  */
 enum rzg3s_sysc_func_id {
 	RZG3S_SYSC_FUNC_ID_RST_RSM_B,
+	RZG3S_SYSC_FUNC_ID_L1_ALLOW,
+	RZG3S_SYSC_FUNC_ID_MODE,
 	RZG3S_SYSC_FUNC_ID_MAX,
 };
 
@@ -1135,6 +1149,49 @@ static int rzg3s_config_deinit(struct rzg3s_pcie_host *host)
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
@@ -1320,6 +1377,12 @@ static int rzg3s_pcie_host_init(struct rzg3s_pcie_host *host)
 	if (ret)
 		goto config_deinit;
 
+	/* Enable ASPM L1 transition for SoCs that use it */
+	ret = rzg3s_sysc_config_func(host->sysc,
+				     RZG3S_SYSC_FUNC_ID_L1_ALLOW, 1);
+	if (ret)
+		goto config_deinit;
+
 	/* Initialize the interrupts */
 	rzg3s_pcie_irq_init(host);
 
@@ -1667,6 +1730,11 @@ static int rzg3s_pcie_probe(struct platform_device *pdev)
 		goto port_refclk_put;
 	}
 
+	/* Put controller in RC mode and de-assert RST_RSM_B. */
+	ret = rzg3s_sysc_config_func(sysc, RZG3S_SYSC_FUNC_ID_MODE, 1);
+	if (ret)
+		goto port_refclk_put;
+
 	ret = rzg3s_sysc_config_func(sysc, RZG3S_SYSC_FUNC_ID_RST_RSM_B, 1);
 	if (ret)
 		goto port_refclk_put;
@@ -1781,6 +1849,10 @@ static int rzg3s_pcie_resume_noirq(struct device *dev)
 	if (ret)
 		return ret;
 
+	ret = rzg3s_sysc_config_func(sysc, RZG3S_SYSC_FUNC_ID_MODE, 1);
+	if (ret)
+		return ret;
+
 	ret = rzg3s_pcie_power_resets_deassert(host);
 	if (ret)
 		goto assert_rst_rsm_b;
@@ -1841,11 +1913,37 @@ static const struct rzg3s_pcie_soc_data rzg3s_soc_data = {
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
+		.functions = {
+			[RZG3S_SYSC_FUNC_ID_L1_ALLOW] = {
+				.offset = 0x1020,
+				.mask = BIT(0),
+			},
+			[RZG3S_SYSC_FUNC_ID_MODE] = {
+				.offset = 0x1024,
+				.mask = BIT(0),
+			},
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


