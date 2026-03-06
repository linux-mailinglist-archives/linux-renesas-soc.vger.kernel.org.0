Return-Path: <linux-renesas-soc+bounces-28966-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qAUHMgDqqmmOYAEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28966-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 06 Mar 2026 15:51:44 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A9712231A7
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 06 Mar 2026 15:51:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AC20C30672ED
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Mar 2026 14:36:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 110943ACA4B;
	Fri,  6 Mar 2026 14:35:29 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2452239C637;
	Fri,  6 Mar 2026 14:35:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772807729; cv=none; b=MNFIwG4FdEm7bLgY4MxoEZ4BQISWTdedAkK3On/JA2SNWqVtU/amw1DCQlzZRvr5pBv2+5yF6Lhy56VULPZHGVOEe5DROaXFkY8ZT+xzKiszPenFTjiDEKhv0CdnOQVuWZsetlU/hJFJSKnzQEiJDqc/qcKvwqxrM+CpGWjsfk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772807729; c=relaxed/simple;
	bh=Gu6yDvxha6937r20VsTxU2cER+60WsfWh3kGAIa1mtw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TmLx5dbGavv9PfWjOMKm/PA+KKcvMe60OkFgxvf9cOltluZLCSg9s36k/hoMr3sTW/c+2uthsx0grye9cIgF2cXe25U+ZlsULHYRHgdD7fnfaQ/QJFuvjdzjU8o+f7MP14xj4h0f5kISaczxieSwBFKUHJhzkzB69IoG22bp8NM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: y7rM1pdyQryQ0HlUylPilQ==
X-CSE-MsgGUID: Rc1GeCXuQNiPoV69JwX+YA==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 06 Mar 2026 23:35:26 +0900
Received: from ubuntu.adwin.renesas.com (unknown [10.226.92.98])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id D44944008546;
	Fri,  6 Mar 2026 23:35:20 +0900 (JST)
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
Subject: [PATCH v8 07/15] PCI: rzg3s-host: Make SYSC register offsets SoC-specific
Date: Fri,  6 Mar 2026 15:34:14 +0100
Message-ID: <20260306143423.19562-8-john.madieu.xa@bp.renesas.com>
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
X-Rspamd-Queue-Id: 2A9712231A7
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
	TAGGED_FROM(0.00)[bounces-28966-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,bp.renesas.com:mid,renesas.com:email]
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

v8: No changes
v7:
 - Cleaned up documentation comments and formatting as per
   Claudiu's suggestions
 - Dropped kerneldoc from rzg3s_sysc_config_func()
 - Moved rzg3s_sysc_config_func() before rzg3s_pcie_update_bits()
   to keep rzg3s_pcie_host_parse_port() and
   rzg3s_pcie_host_init_port() close together

v6:
 - Introduce enum rzg3s_sysc_func_id and rzg3s_sysc_config_func() as
   suggested by Claudiu. This replaces direct regmap calls and drops
   the -1 skip pattern.
 - Removed Rb tag from Claudiu

v5: No changes
v4: No changes
v3: No changes
v2: Collected tag.

 drivers/pci/controller/pcie-rzg3s-host.c | 111 +++++++++++++++++------
 1 file changed, 85 insertions(+), 26 deletions(-)

diff --git a/drivers/pci/controller/pcie-rzg3s-host.c b/drivers/pci/controller/pcie-rzg3s-host.c
index 7f5ffc5c218a..b8a3abf7b6cc 100644
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
 
@@ -174,6 +170,44 @@
 /* Timeouts experimentally determined */
 #define RZG3S_REQ_ISSUE_TIMEOUT_US		2500
 
+/**
+ * struct rzg3s_sysc_function - System Controller function descriptor
+ * @offset: Register offset from the System Controller base address
+ * @mask: Bit mask for the function within the register
+ */
+struct rzg3s_sysc_function {
+	u32 offset;
+	u32 mask;
+};
+
+/**
+ * enum rzg3s_sysc_func_id - System controller function IDs
+ * @RZG3S_SYSC_FUNC_ID_RST_RSM_B: RST_RSM_B SYSC function ID
+ * @RZG3S_SYSC_FUNC_ID_MAX: Max SYSC function ID
+ */
+enum rzg3s_sysc_func_id {
+	RZG3S_SYSC_FUNC_ID_RST_RSM_B,
+	RZG3S_SYSC_FUNC_ID_MAX,
+};
+
+/**
+ * struct rzg3s_sysc_info - RZ/G3S System Controller info
+ * @functions: SYSC function descriptors array
+ */
+struct rzg3s_sysc_info {
+	const struct rzg3s_sysc_function functions[RZG3S_SYSC_FUNC_ID_MAX];
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
@@ -203,6 +237,7 @@ struct rzg3s_pcie_host;
  *                power-on
  * @cfg_resets: array with the resets that need to be de-asserted after
  *              configuration
+ * @sysc_info: SYSC info
  * @num_power_resets: number of power resets
  * @num_cfg_resets: number of configuration resets
  */
@@ -210,6 +245,7 @@ struct rzg3s_pcie_soc_data {
 	int (*init_phy)(struct rzg3s_pcie_host *host);
 	const char * const *power_resets;
 	const char * const *cfg_resets;
+	struct rzg3s_sysc_info sysc_info;
 	u8 num_power_resets;
 	u8 num_cfg_resets;
 };
@@ -233,7 +269,7 @@ struct rzg3s_pcie_port {
  * @dev: struct device
  * @power_resets: reset control signals that should be set after power up
  * @cfg_resets: reset control signals that should be set after configuration
- * @sysc: SYSC regmap
+ * @sysc: SYSC descriptor
  * @intx_domain: INTx IRQ domain
  * @data: SoC specific data
  * @msi: MSI data structure
@@ -248,7 +284,7 @@ struct rzg3s_pcie_host {
 	struct device *dev;
 	struct reset_control_bulk_data *power_resets;
 	struct reset_control_bulk_data *cfg_resets;
-	struct regmap *sysc;
+	struct rzg3s_sysc *sysc;
 	struct irq_domain *intx_domain;
 	const struct rzg3s_pcie_soc_data *data;
 	struct rzg3s_pcie_msi msi;
@@ -260,6 +296,23 @@ struct rzg3s_pcie_host {
 
 #define rzg3s_msi_to_host(_msi)	container_of(_msi, struct rzg3s_pcie_host, msi)
 
+static int rzg3s_sysc_config_func(struct rzg3s_sysc *sysc,
+				  enum rzg3s_sysc_func_id fid, u32 val)
+{
+	const struct rzg3s_sysc_info *info = sysc->info;
+	const struct rzg3s_sysc_function *functions = info->functions;
+
+	if (fid >= RZG3S_SYSC_FUNC_ID_MAX)
+		return -EINVAL;
+
+	if (!functions[fid].mask)
+		return 0;
+
+	return regmap_update_bits(sysc->regmap, functions[fid].offset,
+				  functions[fid].mask,
+				  field_prep(functions[fid].mask, val));
+}
+
 static void rzg3s_pcie_update_bits(void __iomem *base, u32 offset, u32 mask,
 				   u32 val)
 {
@@ -1521,6 +1574,7 @@ static int rzg3s_pcie_probe(struct platform_device *pdev)
 	struct device_node *sysc_np __free(device_node) =
 		of_parse_phandle(np, "renesas,sysc", 0);
 	struct rzg3s_pcie_host *host;
+	struct rzg3s_sysc *sysc;
 	int ret;
 
 	bridge = devm_pci_alloc_host_bridge(dev, sizeof(*host));
@@ -1532,6 +1586,13 @@ static int rzg3s_pcie_probe(struct platform_device *pdev)
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
@@ -1545,15 +1606,13 @@ static int rzg3s_pcie_probe(struct platform_device *pdev)
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
+	ret = rzg3s_sysc_config_func(sysc, RZG3S_SYSC_FUNC_ID_RST_RSM_B, 1);
 	if (ret)
 		goto port_refclk_put;
 
@@ -1605,9 +1664,7 @@ static int rzg3s_pcie_probe(struct platform_device *pdev)
 	 * SYSC RST_RSM_B signal need to be asserted before turning off the
 	 * power to the PHY.
 	 */
-	regmap_update_bits(host->sysc, RZG3S_SYS_PCIE_RST_RSM_B,
-			   RZG3S_SYS_PCIE_RST_RSM_B_MASK,
-			   FIELD_PREP(RZG3S_SYS_PCIE_RST_RSM_B_MASK, 0));
+	rzg3s_sysc_config_func(sysc, RZG3S_SYSC_FUNC_ID_RST_RSM_B, 0);
 port_refclk_put:
 	clk_put(host->port.refclk);
 
@@ -1619,7 +1676,7 @@ static int rzg3s_pcie_suspend_noirq(struct device *dev)
 	struct rzg3s_pcie_host *host = dev_get_drvdata(dev);
 	const struct rzg3s_pcie_soc_data *data = host->data;
 	struct rzg3s_pcie_port *port = &host->port;
-	struct regmap *sysc = host->sysc;
+	struct rzg3s_sysc *sysc = host->sysc;
 	int ret;
 
 	ret = pm_runtime_put_sync(dev);
@@ -1638,9 +1695,7 @@ static int rzg3s_pcie_suspend_noirq(struct device *dev)
 	if (ret)
 		goto cfg_resets_restore;
 
-	ret = regmap_update_bits(sysc, RZG3S_SYS_PCIE_RST_RSM_B,
-				 RZG3S_SYS_PCIE_RST_RSM_B_MASK,
-				 FIELD_PREP(RZG3S_SYS_PCIE_RST_RSM_B_MASK, 0));
+	ret = rzg3s_sysc_config_func(sysc, RZG3S_SYSC_FUNC_ID_RST_RSM_B, 0);
 	if (ret)
 		goto power_resets_restore;
 
@@ -1663,12 +1718,10 @@ static int rzg3s_pcie_resume_noirq(struct device *dev)
 {
 	struct rzg3s_pcie_host *host = dev_get_drvdata(dev);
 	const struct rzg3s_pcie_soc_data *data = host->data;
-	struct regmap *sysc = host->sysc;
+	struct rzg3s_sysc *sysc = host->sysc;
 	int ret;
 
-	ret = regmap_update_bits(sysc, RZG3S_SYS_PCIE_RST_RSM_B,
-				 RZG3S_SYS_PCIE_RST_RSM_B_MASK,
-				 FIELD_PREP(RZG3S_SYS_PCIE_RST_RSM_B_MASK, 1));
+	ret = rzg3s_sysc_config_func(sysc, RZG3S_SYSC_FUNC_ID_RST_RSM_B, 1);
 	if (ret)
 		return ret;
 
@@ -1697,9 +1750,7 @@ static int rzg3s_pcie_resume_noirq(struct device *dev)
 	reset_control_bulk_assert(data->num_power_resets,
 				  host->power_resets);
 assert_rst_rsm_b:
-	regmap_update_bits(sysc, RZG3S_SYS_PCIE_RST_RSM_B,
-			   RZG3S_SYS_PCIE_RST_RSM_B_MASK,
-			   FIELD_PREP(RZG3S_SYS_PCIE_RST_RSM_B_MASK, 0));
+	rzg3s_sysc_config_func(sysc, RZG3S_SYSC_FUNC_ID_RST_RSM_B, 0);
 	return ret;
 }
 
@@ -1722,6 +1773,14 @@ static const struct rzg3s_pcie_soc_data rzg3s_soc_data = {
 	.cfg_resets = rzg3s_soc_cfg_resets,
 	.num_cfg_resets = ARRAY_SIZE(rzg3s_soc_cfg_resets),
 	.init_phy = rzg3s_soc_pcie_init_phy,
+	.sysc_info = {
+		.functions = {
+			[RZG3S_SYSC_FUNC_ID_RST_RSM_B] = {
+				.offset = 0xd74,
+				.mask = BIT(0),
+			},
+		},
+	},
 };
 
 static const struct of_device_id rzg3s_pcie_of_match[] = {
-- 
2.25.1


