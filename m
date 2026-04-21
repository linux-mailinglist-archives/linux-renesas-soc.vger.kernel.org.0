Return-Path: <linux-renesas-soc+bounces-31473-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wEU5DKO/52l4AQIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31473-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Apr 2026 20:19:15 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BD9943E99D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Apr 2026 20:19:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4E29730CB5DE
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Apr 2026 18:13:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4BE63D1719;
	Tue, 21 Apr 2026 18:12:53 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 960A33A9DA9;
	Tue, 21 Apr 2026 18:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776795173; cv=none; b=eZLaNSrXcJAz3o+IUMjJvZp3KlfH6d8ICinXmmH0LJ2UBfmuEMwPzMiXwvfy55P8Ih/aPvhkv5ssQlqiSkn2fdp3TcsrUNAADZaZtXSpLjbLjkF2XUY8FfGuYqoM7hHCQN7y3XC5wUwCWZsUYAUBxD7Ej9yjiltQgZA2pzZHgfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776795173; c=relaxed/simple;
	bh=6pRZnJIC94Jf+41v26DXBQWXtwH5INF5YRQAL64SmLI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=deEK6aJ37dbvT+vnzDCKR8u5qHnsJHduSmjFCDl/GnT6HT2YCznEXjfeE1wz4TRVQetnF7DRItlY4CuAOgpm+DCIBuCgVpPgErMqaVr6f4nK0grlUc3A/cIxuoJsNYGCS6lh6XJ+VWDaNb5SlObV2vw/o7h7kJU7UbR1dkc9rgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAD1BC2BCB0;
	Tue, 21 Apr 2026 18:12:48 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Saravana Kannan <saravanak@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Ulf Hansson <ulfh@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFC 11/14] clk: renesas: Add R-Car X5H CPG SCMI remapping driver
Date: Tue, 21 Apr 2026 20:11:44 +0200
Message-ID: <e30eecc4219fa940f6baa5ebd80cf7d1cfeb08f5.1776793163.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1776793163.git.geert+renesas@glider.be>
References: <cover.1776793163.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[glider.be];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31473-lists,linux-renesas-soc=lfdr.de,renesas];
	FREEMAIL_TO(0.00)[kernel.org,arm.com,gmail.com,baylibre.com,pengutronix.de,broadcom.com,sang-engineering.com,mailbox.org,renesas.com];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FROM_NEQ_ENVFROM(0.00)[geert@glider.be,linux-renesas-soc@vger.kernel.org];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.928];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,glider.be:mid,glider.be:email,mailbox.org:email,scmi_spec.np:url]
X-Rspamd-Queue-Id: 6BD9943E99D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add a proof-of-concept Clock Pulse Generator driver for the R-Car X5H
(R8A78000) SoC, using tables to remap from hardware clock IDs to SCMI
clock IDs.

Some SCMI clocks do not support the SCMI CLOCK_ATTRIBUTES command, and
are thus not usable from Linux.  Register a bunch of fixed-rate clocks,
and use them as replacements for SCMI clocks that are known to be
unusable.

For now this contains preliminary support for SCP FW SDKv4.28.0,
v4.31.0, and v4.32.0.  As SCMI clock IDs are identical for SDKv4.31.0
and v4.32.0, r8a78000_cpg_fw_4_31_0[] applies to both of them.

Suggested-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/clk/renesas/Kconfig        |   4 +
 drivers/clk/renesas/Makefile       |   1 +
 drivers/clk/renesas/r8a78000-cpg.c | 335 +++++++++++++++++++++++++++++
 3 files changed, 340 insertions(+)
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
index 0000000000000000..844d909bbee2adbb
--- /dev/null
+++ b/drivers/clk/renesas/r8a78000-cpg.c
@@ -0,0 +1,335 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * R-Car X5H Clock Pulse Generator
+ *
+ * Copyright (C) 2026 Glider bv
+ */
+
+#include <linux/cleanup.h>
+#include <linux/clk.h>
+#include <linux/clk-provider.h>
+#include <linux/dev_printk.h>
+#include <linux/module.h>
+#include <linux/mod_devicetable.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/scmi_protocol.h>
+#include <linux/slab.h>
+
+#include <dt-bindings/clock/renesas,r8a78000-cpg.h>
+
+struct clk_map_in {
+	int dt_id;		/* DT binding clock ID */
+	u32 fw_id;		/* SCMI firmware clock ID */
+};
+
+struct clk_map {
+	int dt_id;		/* DT binding clock ID */
+	u32 fw_id;		/* SCMI firmware clock ID */
+	struct clk_hw *hw;
+};
+
+struct fw_map {
+	u32 impl_ver;
+	const struct clk_map_in *map;
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
+#define FIXED_CLK_OFFSET	0x80000000
+#define FIXED_CLK(rate)		FIXED_CLK_OFFSET + FIXED_CLK_ ## rate
+
+/**
+ * struct r8a78000_cpg_priv - Clock Pulse Generator Private Data
+ *
+ * @dev: CPG device
+ * @scmi_clk_np: Device node in DT for the SCMI firmware clock protocol
+ * @map: Mapping from DT clock IDs to SCMI clocks
+ * @fixed_hws: Fixed rate clocks used to replace SCMI clocks that do not
+ *             support the SCMI CLOCK_ATTRIBUTES command
+ */
+struct r8a78000_cpg_priv {
+	struct device *dev;
+	struct device_node *scmi_clk_np;
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
+	if (map->fw_id < FIXED_CLK_OFFSET)
+		dev_dbg(dev, "Mapping DT clock %u to SCMI clock %u\n", id,
+			map->fw_id);
+	else
+		dev_dbg(dev, "Mapping DT clock %u to fixed clock %u\n", id,
+			 map->fw_id - FIXED_CLK_OFFSET);
+
+	hw = map->hw;
+	if (!hw) {
+		/* CLOCK_ATTRIBUTES is not supported */
+		dev_err(dev, "Clock %u is not available\n", id);
+		return ERR_PTR(-ENOENT);
+	}
+
+	dev_dbg(dev, "clock %u is %s at %lu Hz\n", id, clk_hw_get_name(hw),
+		clk_hw_get_rate(hw));
+
+	return hw;
+}
+
+static struct device_node *scmi_find_proto(struct device_node *scmi, u32 proto)
+{
+	for_each_available_child_of_node_scoped(scmi, child) {
+		u32 reg;
+
+		if (of_property_read_u32(child, "reg", &reg))
+			continue;
+
+		if (reg == proto)
+			return_ptr(child);
+	}
+
+	return NULL;
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
+	struct of_phandle_args scmi_spec;
+	struct device *dev = priv->dev;
+	struct clk_map *map;
+	struct clk_hw *hw;
+	struct clk *clk;
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
+		if (map[i].fw_id >= FIXED_CLK_OFFSET) {
+			enum fixed_clk idx = map[i].fw_id - FIXED_CLK_OFFSET;
+
+			map[i].hw = priv->fixed_hws[idx];
+			continue;
+		}
+
+		scmi_spec.np = priv->scmi_clk_np;
+		scmi_spec.args_count = 1;
+		scmi_spec.args[0] = map[i].fw_id;
+
+		clk = of_clk_get_from_provider(&scmi_spec);
+		if (IS_ERR(clk))
+			return dev_err_cast_probe(dev, clk,
+				"Failed to get SCMI clock %u\n",
+				map[i].fw_id);
+
+		hw = __clk_get_hw(clk);
+		if (IS_ERR(hw))
+			return dev_err_cast_probe(dev, hw,
+				"Failed to get SCMI clock hw %u\n",
+				map[i].fw_id);
+
+		if (!hw) {
+			/* CLOCK_ATTRIBUTES is not supported */
+			dev_warn(dev, "SCMI clock %u is NULL\n", map[i].fw_id);
+			continue;
+		}
+
+		dev_dbg(priv->dev, "SCMI clock %u is %s at %lu Hz\n",
+			map[i].fw_id, clk_hw_get_name(hw), clk_hw_get_rate(hw));
+
+		map[i].hw = hw;
+	}
+
+	return map;
+}
+
+static int r8a78000_cpg_probe(struct platform_device *pdev)
+{
+	struct device_node *scmi __free(device_node) = NULL;
+	struct device *dev = &pdev->dev;
+	struct scmi_base_info version;
+	const struct fw_map *fw_map;
+	struct r8a78000_cpg_priv *priv;
+	int ret;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->dev = dev;
+
+	scmi = of_parse_phandle(dev->of_node, "firmware", 0);
+	if (!scmi) {
+		dev_err(dev, "Cannot find SCMI firmware node\n");
+		return -ENODEV;
+	}
+
+	priv->scmi_clk_np = scmi_find_proto(scmi, SCMI_PROTOCOL_CLOCK);
+	if (!priv->scmi_clk_np) {
+		dev_err(dev, "Cannot find SCMI clock management protocol\n");
+		return -ENODEV;
+	}
+
+	ret = scmi_get_base_info(scmi, &version);
+	if (ret) {
+		return dev_err_probe(dev, -EPROBE_DEFER,
+				     "SCMI not yet available\n");
+	}
+
+	if (strcmp(version.vendor_id, "Renesas") ||
+	    strcmp(version.sub_vendor_id, "None")) {
+		return dev_err_probe(dev, -ENODEV,
+				     "Unsupported SCMI firmware %s/%s\n",
+				     version.vendor_id, version.sub_vendor_id);
+	}
+
+	for (fw_map = of_device_get_match_data(dev); fw_map->map; fw_map++) {
+		if (fw_map->impl_ver == version.impl_ver)
+			break;
+	}
+
+	if (!fw_map->map) {
+		return dev_err_probe(dev, -ENODEV,
+				     "Unsupported SCMI version 0x%08x\n",
+				     version.impl_ver);
+	}
+
+	ret = register_fixed_clks(priv);
+	if (ret)
+		return ret;
+
+	/*
+	 * We cannot do lazy look-up in r8a78000_clk_get(), as that function is
+	 * called with of_clk_mutex already held.
+	 */
+	priv->map = fill_clk_map(priv, fw_map->map);
+	if (IS_ERR(priv->map))
+		return PTR_ERR(priv->map);
+
+	return devm_of_clk_add_hw_provider(dev, r8a78000_clk_get, priv);
+}
+
+static const struct clk_map_in r8a78000_cpg_fw_4_28_0[] = {
+	{ R8A78000_CPG_SGASYNCD4_PERW_BUS,	FIXED_CLK(266M) },
+	{ R8A78000_CPG_SGASYNCD16_PERW_BUS,	FIXED_CLK(66M) },
+	{ R8A78000_CPG_MSOCK_PERW_BUS,		1671 },
+	{ -1 }
+};
+
+static const struct clk_map_in r8a78000_cpg_fw_4_31_0[] = {
+	{ R8A78000_CPG_SGASYNCD4_PERW_BUS,	FIXED_CLK(266M) },
+	{ R8A78000_CPG_SGASYNCD16_PERW_BUS,	FIXED_CLK(66M) },
+	{ R8A78000_CPG_MSOCK_PERW_BUS,		1667 },
+	{ -1 }
+};
+
+static const struct fw_map r8a78000_cpg_fw_map[] = {
+	{ 0x010a0000, r8a78000_cpg_fw_4_28_0 },	/* SCP FW SDKv4.28.0 */
+	{ 0x010d0000, r8a78000_cpg_fw_4_31_0 },	/* SCP FW SDKv4.31.0 */
+	{ 0x010e0000, r8a78000_cpg_fw_4_31_0 },	/* SCP FW SDKv4.32.0 */
+	{ 0, NULL }
+};
+
+static const struct of_device_id r8a78000_cpg_match[] = {
+	{
+		.compatible = "renesas,r8a78000-cpg",
+		.data = &r8a78000_cpg_fw_map,
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


