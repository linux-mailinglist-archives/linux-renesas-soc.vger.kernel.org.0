Return-Path: <linux-renesas-soc+bounces-28971-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gNoDEEvnqmkTYAEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28971-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 06 Mar 2026 15:40:11 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id E95A1222DEC
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 06 Mar 2026 15:40:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 181F43078F3D
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Mar 2026 14:36:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8ED833B52FF;
	Fri,  6 Mar 2026 14:35:59 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DA8E3A0B34;
	Fri,  6 Mar 2026 14:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772807759; cv=none; b=seqnQ9sAnMDcIjzxQY40e8cfONP+MOJZkDyMmfLGvxEBXnoZe9qyWEBE1Yk1orbOpr5vvCOcOrdbLYhlX37Ve5sxo3pOATz0MR2D6W9iJDj2qAq6V8Pqe6fDSBzTRqrQzNQJYvX0mg3PUohSWv6NM5FbVvRCU1HCbneLnCVvKz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772807759; c=relaxed/simple;
	bh=w1A/0K8MLrAtWFhNrLB+9O+GLKsi0zuBCRlGOWyXsH0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SiMA++nyMPfDrl47XZKStmNWgxasbNCwKzaPHucUz7ls48edwFjdMOJBuRUxzQh0A93n7rY2gLEsoeHLrfI4I1t0cXhzMbleHUyMenp6LMVuNFojojwh/6QlbeOgL/bpOZr5Oo9rV70OFfJyvyS7V60Kpmry6Ret8RkpENxJofs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: p+bXngRMR+OyOW3s7P3aDA==
X-CSE-MsgGUID: 3CknNAKfSMGoLKtCLE7qIQ==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 06 Mar 2026 23:35:57 +0900
Received: from ubuntu.adwin.renesas.com (unknown [10.226.92.98])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id BBDCB4008546;
	Fri,  6 Mar 2026 23:35:51 +0900 (JST)
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
Subject: [PATCH v8 12/15] PCI: rzg3s-host: Add support for RZ/G3E PCIe controller
Date: Fri,  6 Mar 2026 15:34:19 +0100
Message-ID: <20260306143423.19562-13-john.madieu.xa@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260306143423.19562-1-john.madieu.xa@bp.renesas.com>
References: <20260306143423.19562-1-john.madieu.xa@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: E95A1222DEC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.64 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[renesas.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-28971-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FREEMAIL_CC(0.00)[kernel.org,google.com,gmail.com,bp.renesas.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.988];
	FROM_NEQ_ENVFROM(0.00)[john.madieu.xa@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,renesas.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Action: no action

Add support for the PCIe controller found in RZ/G3E SoCs to the existing
RZ/G3S PCIe host driver. The RZ/G3E PCIe controller is similar to the
RZ/G3S's, with the following key differences:

 - Supports PCIe Gen3 (8.0 GT/s) link speeds alongside Gen2 (5.0 GT/s)
 - Uses a different reset control mechanism via AXI registers instead
   of the Linux reset framework
 - Requires specific SYSC configuration for link state control and
   Root Complex mode selection

Reviewed-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
---

Changes:

v8: Collected Claudiu's Rb tag

v7:
 - Renamed RZG3E_PCI_RESET* defines to RZG3S_PCI_RESET* as these
   registers are shared with upcoming SoCs (RZ/V2H, RZ/T2N, RZ/N2H),
   dropped associated "RZ/G3E specific registers" comment
 - Dropped "RZ/G3E SoC-specific config implementations" comment
 - Unified function naming to rzg3e_pcie_config_{pre_init,post_init,
   deinit}() and rzg3s_pcie_config_{post_init,deinit}()
 - Simplified comments as per Claudiu's suggestions
 - Used local mask variables for compactness within 80-char limit
 - Fixed L1_ALLOW error path: goto config_deinit_and_refclk since
   port refclk is already enabled
 - Fixed resume: reordered MODE before RST_RSM_B to match probe
   sequence, fixing error path handling

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

 drivers/pci/controller/pcie-rzg3s-host.c | 90 ++++++++++++++++++++++++
 1 file changed, 90 insertions(+)

diff --git a/drivers/pci/controller/pcie-rzg3s-host.c b/drivers/pci/controller/pcie-rzg3s-host.c
index 44ce056d62c6..b7f92f5aee4a 100644
--- a/drivers/pci/controller/pcie-rzg3s-host.c
+++ b/drivers/pci/controller/pcie-rzg3s-host.c
@@ -111,6 +111,15 @@
 #define RZG3S_PCI_PERM_CFG_HWINIT_EN		BIT(2)
 #define RZG3S_PCI_PERM_PIPE_PHY_REG_EN		BIT(1)
 
+#define RZG3S_PCI_RESET				0x310
+#define RZG3S_PCI_RESET_RST_OUT_B		BIT(6)
+#define RZG3S_PCI_RESET_RST_PS_B		BIT(5)
+#define RZG3S_PCI_RESET_RST_LOAD_B		BIT(4)
+#define RZG3S_PCI_RESET_RST_CFG_B		BIT(3)
+#define RZG3S_PCI_RESET_RST_RSM_B		BIT(2)
+#define RZG3S_PCI_RESET_RST_GP_B		BIT(1)
+#define RZG3S_PCI_RESET_RST_B			BIT(0)
+
 #define RZG3S_PCI_MSIRE(id)			(0x600 + (id) * 0x10)
 #define RZG3S_PCI_MSIRE_ENA			BIT(0)
 
@@ -183,10 +192,14 @@ struct rzg3s_sysc_function {
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
 
@@ -1151,6 +1164,42 @@ static int rzg3s_pcie_config_deinit(struct rzg3s_pcie_host *host)
 					 host->cfg_resets);
 }
 
+static void rzg3e_pcie_config_pre_init(struct rzg3s_pcie_host *host)
+{
+	u32 mask = RZG3S_PCI_RESET_RST_LOAD_B | RZG3S_PCI_RESET_RST_CFG_B;
+
+	/* De-assert LOAD_B and CFG_B */
+	rzg3s_pcie_update_bits(host->axi, RZG3S_PCI_RESET, mask, mask);
+}
+
+static int rzg3e_pcie_config_deinit(struct rzg3s_pcie_host *host)
+{
+	writel_relaxed(0, host->axi + RZG3S_PCI_RESET);
+	return 0;
+}
+
+static int rzg3e_pcie_config_post_init(struct rzg3s_pcie_host *host)
+{
+	u32 mask = RZG3S_PCI_RESET_RST_PS_B | RZG3S_PCI_RESET_RST_GP_B |
+		   RZG3S_PCI_RESET_RST_B;
+
+	/* De-assert PS_B, GP_B, RST_B */
+	rzg3s_pcie_update_bits(host->axi, RZG3S_PCI_RESET, mask, mask);
+
+	/*
+	 * According to the RZ/G3E HW manual (Rev.1.15, Table 6.6-130
+	 * Initialization Procedure (RC)), hardware requires >= 500us delay
+	 * before final reset deassert.
+	 */
+	fsleep(500);
+
+	/* De-assert OUT_B and RSM_B */
+	mask = RZG3S_PCI_RESET_RST_OUT_B | RZG3S_PCI_RESET_RST_RSM_B;
+	rzg3s_pcie_update_bits(host->axi, RZG3S_PCI_RESET, mask, mask);
+
+	return 0;
+}
+
 static void rzg3s_pcie_irq_init(struct rzg3s_pcie_host *host)
 {
 	/*
@@ -1311,6 +1360,12 @@ static int rzg3s_pcie_host_init(struct rzg3s_pcie_host *host)
 	if (ret)
 		goto config_deinit;
 
+	/* Enable ASPM L1 transition for SoCs that use it */
+	ret = rzg3s_sysc_config_func(host->sysc,
+				     RZG3S_SYSC_FUNC_ID_L1_ALLOW, 1);
+	if (ret)
+		goto config_deinit_and_refclk;
+
 	/* Initialize the interrupts */
 	rzg3s_pcie_irq_init(host);
 
@@ -1658,6 +1713,11 @@ static int rzg3s_pcie_probe(struct platform_device *pdev)
 		goto port_refclk_put;
 	}
 
+	/* Put controller in RC mode */
+	ret = rzg3s_sysc_config_func(sysc, RZG3S_SYSC_FUNC_ID_MODE, 1);
+	if (ret)
+		goto port_refclk_put;
+
 	ret = rzg3s_sysc_config_func(sysc, RZG3S_SYSC_FUNC_ID_RST_RSM_B, 1);
 	if (ret)
 		goto port_refclk_put;
@@ -1768,6 +1828,10 @@ static int rzg3s_pcie_resume_noirq(struct device *dev)
 	struct rzg3s_sysc *sysc = host->sysc;
 	int ret;
 
+	ret = rzg3s_sysc_config_func(sysc, RZG3S_SYSC_FUNC_ID_MODE, 1);
+	if (ret)
+		return ret;
+
 	ret = rzg3s_sysc_config_func(sysc, RZG3S_SYSC_FUNC_ID_RST_RSM_B, 1);
 	if (ret)
 		return ret;
@@ -1832,11 +1896,37 @@ static const struct rzg3s_pcie_soc_data rzg3s_soc_data = {
 	},
 };
 
+static const char * const rzg3e_soc_power_resets[] = { "aresetn" };
+
+static const struct rzg3s_pcie_soc_data rzg3e_soc_data = {
+	.power_resets = rzg3e_soc_power_resets,
+	.num_power_resets = ARRAY_SIZE(rzg3e_soc_power_resets),
+	.config_pre_init = rzg3e_pcie_config_pre_init,
+	.config_post_init = rzg3e_pcie_config_post_init,
+	.config_deinit = rzg3e_pcie_config_deinit,
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


