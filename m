Return-Path: <linux-renesas-soc+bounces-28123-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iHZEJmoXi2ljPgAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28123-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Feb 2026 12:32:58 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A7BC11A320
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Feb 2026 12:32:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DDD80300F119
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Feb 2026 11:32:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE7B8318ED8;
	Tue, 10 Feb 2026 11:32:55 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD2BA188713;
	Tue, 10 Feb 2026 11:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770723175; cv=none; b=aNBSYtn3zLgUdEpE5A7Y0Mw/CuXIpYt5ee4o5PLgtQHU+ipfG5dS3BQDaeoQlfXI9w36hhCnf8/3ku2+mTFKIwxF/iSZodgVScRojgbftTF+tNRTp6BFG3ciW4m1gda4eoAQT3yp3PWq26w5KvMBh2cSAmyuu+ZM51Rw7MTm0Mk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770723175; c=relaxed/simple;
	bh=IJvZZ8db5S5XqVkL74rZm334capzMQJuYQhgTihpvWY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b+bbEFD5U1tRP+jfA323QJRt6NyeQoo3AKZZnl3QpTGNrCR0UVxJZr5eV567TgWH52dQ/8N9liaiX8qN4uIKKB4+SuWAGqhsLSzFMz3ICqj7pio2F7TU+IyfzHRP1WQnFe8mTwPISMffMlHnwX+Lax06BSvxs+AialANAjQRQkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: WZh6kUAhRWiJRl9rqP5nGQ==
X-CSE-MsgGUID: OaxGqN4WRCephFgDukyKUw==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 10 Feb 2026 20:32:52 +0900
Received: from ubuntu.adwin.renesas.com (unknown [10.226.92.55])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 6074D41A118C;
	Tue, 10 Feb 2026 20:32:47 +0900 (JST)
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
Subject: [PATCH v5 07/16] PCI: rzg3s-host: Make SYSC register offsets SoC-specific
Date: Tue, 10 Feb 2026 12:30:31 +0100
Message-ID: <20260210113041.138430-8-john.madieu.xa@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[renesas.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FREEMAIL_CC(0.00)[kernel.org,google.com,gmail.com,bp.renesas.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-28123-lists,linux-renesas-soc=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[john.madieu.xa@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	R_DKIM_NA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,renesas.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 7A7BC11A320
X-Rspamd-Action: no action

In preparation for adding RZ/G3E support, move the RST_RSM_B register
offset and mask into a SoC-specific data structure. Compared with RZ/G3S,
the RZ/G3E SYSC controls different functionalities for the PCIe controller.

Make SYSC operations conditional on the presence of register offset
information, allowing the driver to handle SoCs that don't use the
RST_RSM_B signal.

Reviewed-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
---

Changes:

v5: Collected Rb tag from Claudiu
v4: No changes
v3: No changes
v2: Address Claudiu's styling comment

 drivers/pci/controller/pcie-rzg3s-host.c | 92 +++++++++++++++++-------
 1 file changed, 66 insertions(+), 26 deletions(-)

diff --git a/drivers/pci/controller/pcie-rzg3s-host.c b/drivers/pci/controller/pcie-rzg3s-host.c
index 8ccf55d019cf..8f80484bb85e 100644
--- a/drivers/pci/controller/pcie-rzg3s-host.c
+++ b/drivers/pci/controller/pcie-rzg3s-host.c
@@ -159,10 +159,6 @@
 
 #define RZG3S_PCI_CFG_PCIEC			0x60
 
-/* System controller registers */
-#define RZG3S_SYS_PCIE_RST_RSM_B		0xd74
-#define RZG3S_SYS_PCIE_RST_RSM_B_MASK		BIT(0)
-
 /* Maximum number of windows */
 #define RZG3S_MAX_WINDOWS			8
 
@@ -174,6 +170,34 @@
 /* Timeouts experimentally determined */
 #define RZG3S_REQ_ISSUE_TIMEOUT_US		2500
 
+/**
+ * struct rzg3s_sysc_function - System Controller register function descriptor
+ * @offset: Register offset from the System Controller base address
+ * @mask: Bit mask for the function within the register
+ */
+struct rzg3s_sysc_function {
+	u32 offset;
+	u32 mask;
+};
+
+/**
+ * struct rzg3s_sysc_info - RZ/G3S System Controller function info
+ * @rst_rsm_b: Reset RSM_B function descriptor
+ */
+struct rzg3s_sysc_info {
+	struct rzg3s_sysc_function rst_rsm_b;
+};
+
+/**
+ * struct rzg3s_sysc - RZ/G3S System Controller descriptor
+ * @regmap: System controller regmap
+ * @info: System controller info
+ */
+struct rzg3s_sysc {
+	struct regmap *regmap;
+	const struct rzg3s_sysc_info *info;
+};
+
 /**
  * struct rzg3s_pcie_msi - RZ/G3S PCIe MSI data structure
  * @domain: IRQ domain
@@ -203,6 +227,7 @@ struct rzg3s_pcie_host;
  *                power-on
  * @cfg_resets: array with the resets that need to be de-asserted after
  *              configuration
+ * @sysc_info: SYSC functionalities
  * @num_power_resets: number of power resets
  * @num_cfg_resets: number of configuration resets
  */
@@ -210,6 +235,7 @@ struct rzg3s_pcie_soc_data {
 	int (*init_phy)(struct rzg3s_pcie_host *host);
 	const char * const *power_resets;
 	const char * const *cfg_resets;
+	struct rzg3s_sysc_info sysc_info;
 	u8 num_power_resets;
 	u8 num_cfg_resets;
 };
@@ -233,7 +259,7 @@ struct rzg3s_pcie_port {
  * @dev: struct device
  * @power_resets: reset control signals that should be set after power up
  * @cfg_resets: reset control signals that should be set after configuration
- * @sysc: SYSC regmap
+ * @sysc: SYSC descriptor
  * @intx_domain: INTx IRQ domain
  * @data: SoC specific data
  * @msi: MSI data structure
@@ -248,7 +274,7 @@ struct rzg3s_pcie_host {
 	struct device *dev;
 	struct reset_control_bulk_data *power_resets;
 	struct reset_control_bulk_data *cfg_resets;
-	struct regmap *sysc;
+	struct rzg3s_sysc *sysc;
 	struct irq_domain *intx_domain;
 	const struct rzg3s_pcie_soc_data *data;
 	struct rzg3s_pcie_msi msi;
@@ -1521,6 +1547,7 @@ static int rzg3s_pcie_probe(struct platform_device *pdev)
 	struct device_node *sysc_np __free(device_node) =
 		of_parse_phandle(np, "renesas,sysc", 0);
 	struct rzg3s_pcie_host *host;
+	struct rzg3s_sysc *sysc;
 	int ret;
 
 	bridge = devm_pci_alloc_host_bridge(dev, sizeof(*host));
@@ -1532,6 +1559,13 @@ static int rzg3s_pcie_probe(struct platform_device *pdev)
 	host->data = device_get_match_data(dev);
 	platform_set_drvdata(pdev, host);
 
+	host->sysc = devm_kzalloc(dev, sizeof(*host->sysc), GFP_KERNEL);
+	if (!host->sysc)
+		return -ENOMEM;
+
+	sysc = host->sysc;
+	sysc->info = &host->data->sysc_info;
+
 	host->axi = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(host->axi))
 		return PTR_ERR(host->axi);
@@ -1545,15 +1579,15 @@ static int rzg3s_pcie_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	host->sysc = syscon_node_to_regmap(sysc_np);
-	if (IS_ERR(host->sysc)) {
-		ret = PTR_ERR(host->sysc);
+	sysc->regmap = syscon_node_to_regmap(sysc_np);
+	if (IS_ERR(sysc->regmap)) {
+		ret = PTR_ERR(sysc->regmap);
 		goto port_refclk_put;
 	}
 
-	ret = regmap_update_bits(host->sysc, RZG3S_SYS_PCIE_RST_RSM_B,
-				 RZG3S_SYS_PCIE_RST_RSM_B_MASK,
-				 FIELD_PREP(RZG3S_SYS_PCIE_RST_RSM_B_MASK, 1));
+	ret = regmap_update_bits(sysc->regmap, sysc->info->rst_rsm_b.offset,
+				 sysc->info->rst_rsm_b.mask,
+				 field_prep(sysc->info->rst_rsm_b.mask, 1));
 	if (ret)
 		goto port_refclk_put;
 
@@ -1605,9 +1639,9 @@ static int rzg3s_pcie_probe(struct platform_device *pdev)
 	 * SYSC RST_RSM_B signal need to be asserted before turning off the
 	 * power to the PHY.
 	 */
-	regmap_update_bits(host->sysc, RZG3S_SYS_PCIE_RST_RSM_B,
-			   RZG3S_SYS_PCIE_RST_RSM_B_MASK,
-			   FIELD_PREP(RZG3S_SYS_PCIE_RST_RSM_B_MASK, 0));
+	regmap_update_bits(sysc->regmap, sysc->info->rst_rsm_b.offset,
+			   sysc->info->rst_rsm_b.mask,
+			   field_prep(sysc->info->rst_rsm_b.mask, 0));
 port_refclk_put:
 	clk_put(host->port.refclk);
 
@@ -1619,7 +1653,7 @@ static int rzg3s_pcie_suspend_noirq(struct device *dev)
 	struct rzg3s_pcie_host *host = dev_get_drvdata(dev);
 	const struct rzg3s_pcie_soc_data *data = host->data;
 	struct rzg3s_pcie_port *port = &host->port;
-	struct regmap *sysc = host->sysc;
+	struct rzg3s_sysc *sysc = host->sysc;
 	int ret;
 
 	ret = pm_runtime_put_sync(dev);
@@ -1638,9 +1672,9 @@ static int rzg3s_pcie_suspend_noirq(struct device *dev)
 	if (ret)
 		goto power_resets_restore;
 
-	ret = regmap_update_bits(sysc, RZG3S_SYS_PCIE_RST_RSM_B,
-				 RZG3S_SYS_PCIE_RST_RSM_B_MASK,
-				 FIELD_PREP(RZG3S_SYS_PCIE_RST_RSM_B_MASK, 0));
+	ret = regmap_update_bits(sysc->regmap, sysc->info->rst_rsm_b.offset,
+				 sysc->info->rst_rsm_b.mask,
+				 field_prep(sysc->info->rst_rsm_b.mask, 0));
 	if (ret)
 		goto cfg_resets_restore;
 
@@ -1663,12 +1697,12 @@ static int rzg3s_pcie_resume_noirq(struct device *dev)
 {
 	struct rzg3s_pcie_host *host = dev_get_drvdata(dev);
 	const struct rzg3s_pcie_soc_data *data = host->data;
-	struct regmap *sysc = host->sysc;
+	struct rzg3s_sysc *sysc = host->sysc;
 	int ret;
 
-	ret = regmap_update_bits(sysc, RZG3S_SYS_PCIE_RST_RSM_B,
-				 RZG3S_SYS_PCIE_RST_RSM_B_MASK,
-				 FIELD_PREP(RZG3S_SYS_PCIE_RST_RSM_B_MASK, 1));
+	ret = regmap_update_bits(sysc->regmap, sysc->info->rst_rsm_b.offset,
+				 sysc->info->rst_rsm_b.mask,
+				 field_prep(sysc->info->rst_rsm_b.mask, 1));
 	if (ret)
 		return ret;
 
@@ -1697,9 +1731,9 @@ static int rzg3s_pcie_resume_noirq(struct device *dev)
 	reset_control_bulk_assert(data->num_power_resets,
 				  host->power_resets);
 assert_rst_rsm_b:
-	regmap_update_bits(sysc, RZG3S_SYS_PCIE_RST_RSM_B,
-			   RZG3S_SYS_PCIE_RST_RSM_B_MASK,
-			   FIELD_PREP(RZG3S_SYS_PCIE_RST_RSM_B_MASK, 0));
+	regmap_update_bits(sysc->regmap, sysc->info->rst_rsm_b.offset,
+			   sysc->info->rst_rsm_b.mask,
+			   field_prep(sysc->info->rst_rsm_b.mask, 0));
 	return ret;
 }
 
@@ -1722,6 +1756,12 @@ static const struct rzg3s_pcie_soc_data rzg3s_soc_data = {
 	.cfg_resets = rzg3s_soc_cfg_resets,
 	.num_cfg_resets = ARRAY_SIZE(rzg3s_soc_cfg_resets),
 	.init_phy = rzg3s_soc_pcie_init_phy,
+	.sysc_info = {
+		.rst_rsm_b = {
+			.offset = 0xd74,
+			.mask = BIT(0),
+		},
+	},
 };
 
 static const struct of_device_id rzg3s_pcie_of_match[] = {
-- 
2.25.1


