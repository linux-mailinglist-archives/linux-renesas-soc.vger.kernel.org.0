Return-Path: <linux-renesas-soc+bounces-34854-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id m1seOmQmTmqdEAIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34854-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Jul 2026 12:28:52 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D5C4724526
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Jul 2026 12:28:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34854-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34854-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6FCE831265A2
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Jul 2026 10:15:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89B253A3E9A;
	Wed,  8 Jul 2026 10:15:33 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27A153947AE;
	Wed,  8 Jul 2026 10:15:31 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783505733; cv=none; b=TTwMW2uKg1PtkH62cHrDmDwToJ3SPNodgLbOPpeGk5JodQpvzozB8OoyP0/ClGdrBQoebsrH5N6vXBqQApE5OXmskyR2ScbxZrFaQDOFftN2SGZR5Ip2O+VweITL9rtKIyI3+A06B/WxUrQcCAgU5Ard8+PyWastfz5dIQlAiCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783505733; c=relaxed/simple;
	bh=lbE9O3MMZEoAf6yRhz1T5H2wkCa/2i/ZQcShqsQrbHU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gSrlQXL9aQbdk3cn7O3Xb4ZuszWeRhDIz+OVRiX1KRiHd1AIsKvQYEsdksRpmpQP/7rXYyR4naMyj4/VkD9Pbgv47iGupaR2j7lVS6VVeBOqO0ERFgRSFpoZPGjKt6OpnGXtfZGpUTQSKqd7qLbtIuuXJJ1fvntYM8kO1eHiB50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6852E1F000E9;
	Wed,  8 Jul 2026 10:15:28 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Ulf Hansson <ulfh@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 3/6] clk: renesas: Add R-Car X5H CPG driver
Date: Wed,  8 Jul 2026 12:15:08 +0200
Message-ID: <50f5804f00c55cd60604d00da1bf1f1dc912ba8d.1783505142.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1783505142.git.geert+renesas@glider.be>
References: <cover.1783505142.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[glider.be];
	TAGGED_FROM(0.00)[bounces-34854-lists,linux-renesas-soc=lfdr.de,renesas];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[geert@glider.be,linux-renesas-soc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:ulfh@kernel.org,m:p.zabel@pengutronix.de,m:wsa+renesas@sang-engineering.com,m:marek.vasut+renesas@mailbox.org,m:kuninori.morimoto.gx@renesas.com,m:devicetree@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:geert+renesas@glider.be,m:krzk@kernel.org,m:conor@kernel.org,m:wsa@sang-engineering.com,m:marek.vasut@mailbox.org,m:geert@glider.be,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@glider.be,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,glider.be:from_mime,glider.be:email,glider.be:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4D5C4724526

Add a minimal Clock Pulse Generator driver for the R-Car X5H (R8A78000)
SoC.  For now this supports just the few fixed-rate clocks that are
needed by the current minimal DTS.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - Spin off from "clk: renesas: Add R-Car X5H CPG SCMI remapping
    driver",
  - Add default support not using SCMI,
  - Drop all SCMI remapping support,
  - Document use of -1 as a sentinel,
  - Document use of FIXED_CLK() IDs.
---
 drivers/clk/renesas/Kconfig        |   4 +
 drivers/clk/renesas/Makefile       |   1 +
 drivers/clk/renesas/r8a78000-cpg.c | 216 +++++++++++++++++++++++++++++
 3 files changed, 221 insertions(+)
 create mode 100644 drivers/clk/renesas/r8a78000-cpg.c

diff --git a/drivers/clk/renesas/Kconfig b/drivers/clk/renesas/Kconfig
index 0203ecbb38825f13..f0482bdfc4616cfa 100644
--- a/drivers/clk/renesas/Kconfig
+++ b/drivers/clk/renesas/Kconfig
@@ -34,6 +34,7 @@ config CLK_RENESAS
 	select CLK_R8A779F0 if ARCH_R8A779F0
 	select CLK_R8A779G0 if ARCH_R8A779G0
 	select CLK_R8A779H0 if ARCH_R8A779H0
+	select CLK_R8A78000 if ARCH_R8A78000
 	select CLK_R9A06G032 if ARCH_R9A06G032
 	select CLK_R9A07G043 if ARCH_R9A07G043
 	select CLK_R9A07G044 if ARCH_R9A07G044
@@ -176,6 +177,9 @@ config CLK_R8A779H0
 	bool "R-Car V4M clock support" if COMPILE_TEST
 	select CLK_RCAR_GEN4_CPG
 
+config CLK_R8A78000
+	bool "R-Car X5H clock support" if COMPILE_TEST
+
 config CLK_R9A06G032
 	bool "RZ/N1D clock support" if COMPILE_TEST
 
diff --git a/drivers/clk/renesas/Makefile b/drivers/clk/renesas/Makefile
index bd2bed91ab291d72..4f76f8c402ffe9a3 100644
--- a/drivers/clk/renesas/Makefile
+++ b/drivers/clk/renesas/Makefile
@@ -31,6 +31,7 @@ obj-$(CONFIG_CLK_R8A779A0)		+= r8a779a0-cpg-mssr.o
 obj-$(CONFIG_CLK_R8A779F0)		+= r8a779f0-cpg-mssr.o
 obj-$(CONFIG_CLK_R8A779G0)		+= r8a779g0-cpg-mssr.o
 obj-$(CONFIG_CLK_R8A779H0)		+= r8a779h0-cpg-mssr.o
+obj-$(CONFIG_CLK_R8A78000)		+= r8a78000-cpg.o
 obj-$(CONFIG_CLK_R9A06G032)		+= r9a06g032-clocks.o
 obj-$(CONFIG_CLK_R9A07G043)		+= r9a07g043-cpg.o
 obj-$(CONFIG_CLK_R9A07G044)		+= r9a07g044-cpg.o
diff --git a/drivers/clk/renesas/r8a78000-cpg.c b/drivers/clk/renesas/r8a78000-cpg.c
new file mode 100644
index 0000000000000000..c53d8f33ee88b339
--- /dev/null
+++ b/drivers/clk/renesas/r8a78000-cpg.c
@@ -0,0 +1,216 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * R-Car X5H Clock Pulse Generator
+ *
+ * Copyright (C) 2026 Glider bv
+ */
+
+#include <linux/clk.h>
+#include <linux/clk-provider.h>
+#include <linux/dev_printk.h>
+#include <linux/module.h>
+#include <linux/mod_devicetable.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+
+#include <dt-bindings/clock/renesas,r8a78000-cpg.h>
+
+struct clk_map_in {
+	int dt_id;		/* DT binding clock ID or -1 sentinel */
+	u32 fw_id;		/* FIXED_CLK() ID */
+};
+
+struct clk_map {
+	int dt_id;		/* DT binding clock ID or -1 sentinel */
+	u32 fw_id;		/* FIXED_CLK() ID */
+	struct clk_hw *hw;
+};
+
+enum fixed_clk {
+	FIXED_CLK_66M,
+	FIXED_CLK_266M,
+	NUM_FIXED_CLKS
+};
+
+static const unsigned long fixed_clk_rates[NUM_FIXED_CLKS] = {
+	[FIXED_CLK_66M] = 66666000,
+	[FIXED_CLK_266M] = 266660000,
+};
+
+#define FIXED_CLK(rate)		FIXED_CLK_ ## rate
+
+/**
+ * struct r8a78000_cpg_priv - Clock Pulse Generator Private Data
+ *
+ * @dev: CPG device
+ * @map: Mapping from DT clock IDs
+ * @fixed_hws: Fixed rate clocks
+ */
+struct r8a78000_cpg_priv {
+	struct device *dev;
+	const struct clk_map *map;
+	struct clk_hw *fixed_hws[NUM_FIXED_CLKS];
+};
+
+static const struct clk_map *clk_map_find(const struct clk_map *map, u32 id)
+{
+	if (!map)
+		return NULL;
+
+	for (; map->dt_id >= 0; map++) {
+		if (map->dt_id == id)
+			return map;
+	}
+
+	return NULL;
+}
+
+static struct clk_hw *r8a78000_clk_get(struct of_phandle_args *spec,
+				      void *data)
+{
+	struct r8a78000_cpg_priv *priv = data;
+	struct device *dev = priv->dev;
+	const struct clk_map *map;
+	struct clk_hw *hw;
+	u32 id;
+
+	if (spec->args_count != 1)
+		return ERR_PTR(-EINVAL);
+
+	id = spec->args[0];
+
+	map = clk_map_find(priv->map, id);
+	if (!map) {
+		dev_err(dev, "Unknown clock %u\n", id);
+		return ERR_PTR(-ENOENT);
+	}
+
+	dev_dbg(dev, "Mapping DT clock %u to fixed clock %u\n", id, map->fw_id);
+
+	hw = map->hw;
+
+	dev_dbg(dev, "clock %u is %s at %lu Hz\n", id, clk_hw_get_name(hw),
+		clk_hw_get_rate(hw));
+
+	return hw;
+}
+
+static void unregister_fixed_clks(void *data)
+{
+	struct r8a78000_cpg_priv *priv = data;
+
+	for (unsigned int i = 0; i < ARRAY_SIZE(priv->fixed_hws); i++)
+		clk_hw_unregister_fixed_rate(priv->fixed_hws[i]);
+}
+
+static int register_fixed_clks(struct r8a78000_cpg_priv *priv)
+{
+	struct device *dev = priv->dev;
+	unsigned long rate;
+	struct clk_hw *hw;
+	const char *name;
+
+	for (unsigned int i = 0; i < ARRAY_SIZE(fixed_clk_rates); i++) {
+		rate = fixed_clk_rates[i];
+		name = devm_kasprintf(dev, GFP_KERNEL, "cpg-%lu", rate);
+		if (!name)
+			return -ENOMEM;
+
+		hw = clk_hw_register_fixed_rate(dev, name, NULL, 0, rate);
+		if (IS_ERR(hw)) {
+			while (i-- > 0)
+				clk_hw_unregister_fixed_rate(priv->fixed_hws[i]);
+			return PTR_ERR(hw);
+		}
+
+		priv->fixed_hws[i] = hw;
+	}
+
+	return devm_add_action_or_reset(dev, unregister_fixed_clks, priv);
+}
+
+static const struct clk_map *fill_clk_map(struct r8a78000_cpg_priv *priv,
+					  const struct clk_map_in *map_in)
+{
+	struct device *dev = priv->dev;
+	struct clk_map *map;
+	unsigned int i;
+
+	for (i = 0; map_in[i].dt_id >= 0; i++) { }
+
+	map = devm_kcalloc(dev, i + 1, sizeof(*map), GFP_KERNEL);
+	if (!map)
+		return ERR_PTR(-ENOMEM);
+
+	for (i = 0; ; i++) {
+		map[i].dt_id = map_in[i].dt_id;
+		if (map[i].dt_id < 0)
+			break;
+
+		map[i].fw_id = map_in[i].fw_id;
+		map[i].hw = priv->fixed_hws[map[i].fw_id];
+		continue;
+	}
+
+	return map;
+}
+
+static int r8a78000_cpg_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct r8a78000_cpg_priv *priv;
+	const struct clk_map_in *map;
+	int ret;
+
+	map = of_device_get_match_data(dev);
+	if (!map)
+		return -ENODEV;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->dev = dev;
+
+	ret = register_fixed_clks(priv);
+	if (ret)
+		return ret;
+
+	/*
+	 * We cannot do lazy look-up in r8a78000_clk_get(), as that function is
+	 * called with of_clk_mutex already held.
+	 */
+	priv->map = fill_clk_map(priv, map);
+	if (IS_ERR(priv->map))
+		return PTR_ERR(priv->map);
+
+	return devm_of_clk_add_hw_provider(dev, r8a78000_clk_get, priv);
+}
+
+static const struct clk_map_in r8a78000_cpg_default[] = {
+	{ R8A78000_CPG_SGASYNCD4_PERW_BUS,	FIXED_CLK(266M) },
+	{ R8A78000_CPG_SGASYNCD16_PERW_BUS,	FIXED_CLK(66M) },
+	{ -1 }
+};
+
+static const struct of_device_id r8a78000_cpg_match[] = {
+	{
+		.compatible = "renesas,r8a78000-cpg",
+		.data = &r8a78000_cpg_default,
+	},
+	{ /* sentinel */ }
+};
+
+static struct platform_driver r8a78000_cpg_driver = {
+	.probe = r8a78000_cpg_probe,
+	.driver = {
+		.name = "r8a78000-cpg",
+		.of_match_table = r8a78000_cpg_match,
+		.suppress_bind_attrs = true,
+	},
+};
+
+builtin_platform_driver(r8a78000_cpg_driver)
+
+MODULE_DESCRIPTION("R-Car X5H CPG Driver");
-- 
2.43.0


