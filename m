Return-Path: <linux-renesas-soc+bounces-27539-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MCRXE5gMemlo2AEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27539-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Jan 2026 14:18:16 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 8020AA1F28
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Jan 2026 14:18:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id CEE0B3001393
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Jan 2026 13:18:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D430E350A10;
	Wed, 28 Jan 2026 13:18:11 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2182225408;
	Wed, 28 Jan 2026 13:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769606291; cv=none; b=tAZzDyWc5mJ3bMrVIwZy0excpj8Yc1BccX3SwVdwpsJ6qtaHJ3YwqaQuQIF6cavgp53G8iGCV655QOinJX8rEg/5bwdEf+1bZAQsri9HzaGY+jzn5oR4GOkj0K3z8Wh2iZk5W61MSYkkW7nZ9kw86w2+Oj9nE/4D7IeaRly+0R0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769606291; c=relaxed/simple;
	bh=wbTWixDhnC1D/LcW3GKlJ/vbz7wyjVC2Lbrh0usc7QA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oPDwL6dNikG5GNPIhYMiYuUu2T4Tm7tT7yApnKUxXcVZPCE2ZDPwVN/ViEA14xK81i1wKDajALErJOj1I599sUbUPORgXTmM591S9sXcG5YqTRMLYzFHzEnB5JQ7V6nCo1aCbc3/fQfIH8cFLGNZr6bpZRJKlxKlQ3yon6+CBP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: y8CtlZKgQsySoJAEPBU8EA==
X-CSE-MsgGUID: U5vf4Lv7TKSimhaK0Avs1Q==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 28 Jan 2026 22:18:09 +0900
Received: from ubuntu.adwin.renesas.com (unknown [10.226.93.11])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id CB4DE41665EF;
	Wed, 28 Jan 2026 22:18:03 +0900 (JST)
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
Subject: [PATCH v3 09/15] PCI: rzg3s-host: Add SoC-specific configuration and initialization callbacks
Date: Wed, 28 Jan 2026 14:16:40 +0100
Message-ID: <20260128131647.120511-10-john.madieu.xa@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[renesas.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-27539-lists,linux-renesas-soc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[john.madieu.xa@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.878];
	FREEMAIL_CC(0.00)[kernel.org,google.com,gmail.com,bp.renesas.com,vger.kernel.org];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,renesas.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8020AA1F28
X-Rspamd-Action: no action

Add optional cfg_pre_init, cfg_post_init, and cfg_deinit callbacks
to handle SoC-specific configuration methods. While RZ/G3S uses the Linux
reset framework with dedicated reset lines, other SoC variants like RZ/G3E
control configuration resets through PCIe AXI registers.

As Linux reset bulk API gracefully handles optional NULL reset lines
(num_cfg_resets = 0 for RZ/G3E), the driver continues to use the standard
reset framework when reset lines are available, while custom callbacks
are only invoked when provided.

This provides a balanced pattern where:
- RZ/G3S: Uses reset framework only, no callbacks needed
- RZ/G3E: Sets num_cfg_resets=0, provides cfg_pre_init/cfg_post_init/cfg_deinit
- In addition to that, RZ/G3E requires explicit cfg reset and clock turned off
  to put the PCIe IP in a known state.

Add cfg_pre_init, cfg_post_init, and cfg_deinit callbacks to support
custom configuration mechanism in preparation to RZ/G3E PCIe support.

Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
---

Changes:

v3: No changes

v2:
 - Renamed callbacks as per Claudiu's comments
 - Reworded goto labels to be consistents with callbacks

 drivers/pci/controller/pcie-rzg3s-host.c | 66 +++++++++++++++++-------
 1 file changed, 46 insertions(+), 20 deletions(-)

diff --git a/drivers/pci/controller/pcie-rzg3s-host.c b/drivers/pci/controller/pcie-rzg3s-host.c
index a6fb2ec4a341..15ccd9095a3e 100644
--- a/drivers/pci/controller/pcie-rzg3s-host.c
+++ b/drivers/pci/controller/pcie-rzg3s-host.c
@@ -223,6 +223,9 @@ struct rzg3s_pcie_host;
 /**
  * struct rzg3s_pcie_soc_data - SoC specific data
  * @init_phy: PHY initialization function
+ * @config_pre_init: Optional callback for SoC-specific pre-configuration
+ * @config_post_init: Callback for SoC-specific post-configuration
+ * @config_deinit: Callback for SoC-specific de-initialization
  * @power_resets: array with the resets that need to be de-asserted after
  *                power-on
  * @cfg_resets: array with the resets that need to be de-asserted after
@@ -233,6 +236,9 @@ struct rzg3s_pcie_host;
  */
 struct rzg3s_pcie_soc_data {
 	int (*init_phy)(struct rzg3s_pcie_host *host);
+	void (*config_pre_init)(struct rzg3s_pcie_host *host);
+	int (*config_post_init)(struct rzg3s_pcie_host *host);
+	int (*config_deinit)(struct rzg3s_pcie_host *host);
 	const char * const *power_resets;
 	const char * const *cfg_resets;
 	struct rzg3s_sysc_info sysc_info;
@@ -1082,6 +1088,18 @@ static int rzg3s_pcie_config_init(struct rzg3s_pcie_host *host)
 	return 0;
 }
 
+static int rzg3s_config_post_init(struct rzg3s_pcie_host *host)
+{
+	return reset_control_bulk_deassert(host->data->num_cfg_resets,
+					   host->cfg_resets);
+}
+
+static int rzg3s_config_deinit(struct rzg3s_pcie_host *host)
+{
+	return reset_control_bulk_assert(host->data->num_cfg_resets,
+					 host->cfg_resets);
+}
+
 static void rzg3s_pcie_irq_init(struct rzg3s_pcie_host *host)
 {
 	/*
@@ -1229,20 +1247,24 @@ static int rzg3s_pcie_host_init(struct rzg3s_pcie_host *host)
 	u32 val;
 	int ret;
 
+	/* SoC-specific pre-configuration */
+	if (host->data->config_pre_init)
+		host->data->config_pre_init(host);
+
 	/* Initialize the PCIe related registers */
 	ret = rzg3s_pcie_config_init(host);
 	if (ret)
-		return ret;
+		goto config_deinit;
 
 	ret = rzg3s_pcie_host_init_port(host);
 	if (ret)
-		return ret;
+		goto config_deinit;
 
 	/* Initialize the interrupts */
 	rzg3s_pcie_irq_init(host);
 
-	ret = reset_control_bulk_deassert(host->data->num_cfg_resets,
-					  host->cfg_resets);
+	/* SoC-specific post-configuration */
+	ret = host->data->config_post_init(host);
 	if (ret)
 		goto disable_port_refclk;
 
@@ -1253,19 +1275,22 @@ static int rzg3s_pcie_host_init(struct rzg3s_pcie_host *host)
 				 PCIE_LINK_WAIT_SLEEP_MS * MILLI *
 				 PCIE_LINK_WAIT_MAX_RETRIES);
 	if (ret)
-		goto cfg_resets_deassert;
+		goto config_deinit_post;
 
 	val = readl_relaxed(host->axi + RZG3S_PCI_PCSTAT2);
 	dev_info(host->dev, "PCIe link status [0x%x]\n", val);
 
 	return 0;
 
-cfg_resets_deassert:
-	reset_control_bulk_assert(host->data->num_cfg_resets,
-				  host->cfg_resets);
+config_deinit_post:
+	host->data->config_deinit(host);
 disable_port_refclk:
 	clk_disable_unprepare(host->port.refclk);
 	return ret;
+
+config_deinit:
+	host->data->config_deinit(host);
+	return ret;
 }
 
 static void rzg3s_pcie_set_inbound_window(struct rzg3s_pcie_host *host,
@@ -1631,7 +1656,7 @@ static int rzg3s_pcie_probe(struct platform_device *pdev)
 
 host_probe_teardown:
 	rzg3s_pcie_teardown_irqdomain(host);
-	reset_control_bulk_assert(host->data->num_cfg_resets, host->cfg_resets);
+	host->data->config_deinit(host);
 rpm_put:
 	pm_runtime_put_sync(dev);
 rpm_disable:
@@ -1666,32 +1691,31 @@ static int rzg3s_pcie_suspend_noirq(struct device *dev)
 
 	clk_disable_unprepare(port->refclk);
 
-	ret = reset_control_bulk_assert(data->num_power_resets,
-					host->power_resets);
+	/* SoC-specific de-initialization */
+	ret = data->config_deinit(host);
 	if (ret)
-		goto refclk_restore;
+		goto config_reinit;
 
-	ret = reset_control_bulk_assert(data->num_cfg_resets,
-					host->cfg_resets);
+	ret = reset_control_bulk_assert(data->num_power_resets,
+					host->power_resets);
 	if (ret)
-		goto power_resets_restore;
+		goto config_reinit;
 
 	ret = regmap_update_bits(sysc->regmap, sysc->info->rst_rsm_b.offset,
 				 sysc->info->rst_rsm_b.mask,
 				 field_prep(sysc->info->rst_rsm_b.mask, 0));
 	if (ret)
-		goto cfg_resets_restore;
+		goto power_resets_restore;
 
 	return 0;
 
 	/* Restore the previous state if any error happens */
-cfg_resets_restore:
-	reset_control_bulk_deassert(data->num_cfg_resets,
-				    host->cfg_resets);
 power_resets_restore:
 	reset_control_bulk_deassert(data->num_power_resets,
 				    host->power_resets);
-refclk_restore:
+config_reinit:
+	data->config_post_init(host);
+
 	clk_prepare_enable(port->refclk);
 	pm_runtime_resume_and_get(dev);
 	return ret;
@@ -1759,6 +1783,8 @@ static const struct rzg3s_pcie_soc_data rzg3s_soc_data = {
 	.num_power_resets = ARRAY_SIZE(rzg3s_soc_power_resets),
 	.cfg_resets = rzg3s_soc_cfg_resets,
 	.num_cfg_resets = ARRAY_SIZE(rzg3s_soc_cfg_resets),
+	.config_post_init = rzg3s_config_post_init,
+	.config_deinit = rzg3s_config_deinit,
 	.init_phy = rzg3s_soc_pcie_init_phy,
 	.sysc_info = {
 		.rst_rsm_b = {
-- 
2.25.1


