Return-Path: <linux-renesas-soc+bounces-34865-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /X/LG5wlTmpZEAIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34865-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Jul 2026 12:25:32 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 0496472445D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Jul 2026 12:25:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34865-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34865-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id AB1B330747B1
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Jul 2026 10:19:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEDDD424679;
	Wed,  8 Jul 2026 10:17:32 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40230423A94;
	Wed,  8 Jul 2026 10:17:31 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783505852; cv=none; b=Dxrbk8oaV2HLFgmbEXMZ3XSdBH62makXi/9wTQ6E8EhBzF4SxSdohR5xRJ19eG0bE4gdtv4QquFRN608h7+ZyLHU3psb/8lEhPySr1H85ugCn3k0wgzrfI3UHULsGiwHLIuN1mri9zh6C/mqfkiCqvXqka+ORDo+/gmunfaU8N0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783505852; c=relaxed/simple;
	bh=zyUlRLfp4ub0cW4KBcP3Qng2i929S5PoR3vJpK26rxA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MazA9MQ6eqW4m0RU+uxbBJdVaSAboZ68Ij/lHQeR/zw2b9heAzdz4Vz1uUJExKidgj+ejfOjwKcwvbRP3JE6Bl90TIhdo+rlzXqNy+eRA8FNnnBTuOBmGiN3KqU7flVrxISBXUd1VkZylYhzkZfsijkAod6WeH061Hq0vFYV9+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE3C31F000E9;
	Wed,  8 Jul 2026 10:17:25 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>,
	Ulf Hansson <ulfh@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Vinod Koul <vkoul@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 07/10] clk: renesas: r8a78000: Add SCMI remapping support
Date: Wed,  8 Jul 2026 12:16:25 +0200
Message-ID: <28b010f04307ba459653d12f955b1cdd96e97c10.1783505329.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1783505329.git.geert+renesas@glider.be>
References: <cover.1783505329.git.geert+renesas@glider.be>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[glider.be];
	TAGGED_FROM(0.00)[bounces-34865-lists,linux-renesas-soc=lfdr.de,renesas];
	FORGED_RECIPIENTS(0.00)[m:sudeep.holla@kernel.org,m:cristian.marussi@arm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:saravanak@kernel.org,m:ulfh@kernel.org,m:rafael@kernel.org,m:p.zabel@pengutronix.de,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:bartosz.golaszewski@oss.qualcomm.com,m:vkoul@kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:khilman@baylibre.com,m:florian.fainelli@broadcom.com,m:wsa+renesas@sang-engineering.com,m:marek.vasut+renesas@mailbox.org,m:kuninori.morimoto.gx@renesas.com,m:arm-scmi@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:geert+renesas@glider.be,m:krzk@kernel.org,m:conor@kernel.org,m:wsa@sang-engineering.com,m:marek.vasut@mailbox.org,m:geert@glider.be,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[geert@glider.be,linux-renesas-soc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[28];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[mailbox.org:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp,glider.be:from_mime,glider.be:email,glider.be:mid,scmi_spec.np:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0496472445D

Extend the Clock Pulse Generator driver for R-Car X5H with SCMI support,
to remap DT clock IDs to SCMI clocks when running on a system with a
supported SCMI firmware implementation.  Take into account peculiarities
of the detected SCMI firmware version, and use fixed-rate clocks as
replacements for SCMI clocks that are known to be unusable.

This lets us avoid putting unstable SCMI IDs in DT, and allows us to use
the same hardware description in SoC DTS for systems with and without
SCMI firmware.

Note that this only includes SCMI remapping support, and does not
include yet any mapping tables for specific SCMI firmware versions.

Suggested-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - Spin off from "clk: renesas: Add R-Car X5H CPG SCMI remapping
    driver",
  - Use reverse xmas ordering in r8a78000_cpg_probe(),
  - Propagate error codes from scmi_get_base_info() now it can return
    -EPROBE_DEFER,
  - Improve error message on scmi_get_base_info() failure,
  - Check if SCMI firmware node is available,
  - Replace the scmi_clk_np member of struct r8a78000_cpg_priv by a
    local variable in r8a78000_cpg_probe(), and pass it to
    fill_clk_map(),
  - Join split short lines,
  - Fall back to the default support when SCMI support or firmware is
    not available, or when the detected SCMI firmware version is not
    supported by the driver,
  - Drop mapping tables.
---
 drivers/clk/renesas/r8a78000-cpg.c | 161 ++++++++++++++++++++++++++---
 1 file changed, 148 insertions(+), 13 deletions(-)

diff --git a/drivers/clk/renesas/r8a78000-cpg.c b/drivers/clk/renesas/r8a78000-cpg.c
index c53d8f33ee88b339..355c57293241a411 100644
--- a/drivers/clk/renesas/r8a78000-cpg.c
+++ b/drivers/clk/renesas/r8a78000-cpg.c
@@ -5,6 +5,7 @@
  * Copyright (C) 2026 Glider bv
  */
 
+#include <linux/cleanup.h>
 #include <linux/clk.h>
 #include <linux/clk-provider.h>
 #include <linux/dev_printk.h>
@@ -12,21 +13,32 @@
 #include <linux/mod_devicetable.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
+#include <linux/scmi_protocol.h>
 #include <linux/slab.h>
 
 #include <dt-bindings/clock/renesas,r8a78000-cpg.h>
 
 struct clk_map_in {
 	int dt_id;		/* DT binding clock ID or -1 sentinel */
-	u32 fw_id;		/* FIXED_CLK() ID */
+	u32 fw_id;		/* SCMI firmware clock ID or FIXED_CLK() ID */
 };
 
 struct clk_map {
 	int dt_id;		/* DT binding clock ID or -1 sentinel */
-	u32 fw_id;		/* FIXED_CLK() ID */
+	u32 fw_id;		/* SCMI firmware clock ID or FIXED_CLK() ID */
 	struct clk_hw *hw;
 };
 
+struct fw_map {
+	u32 impl_ver;
+	const struct clk_map_in *map;
+};
+
+struct cpg_data {
+	const struct clk_map_in *default_map;
+	const struct fw_map *fw_map;
+};
+
 enum fixed_clk {
 	FIXED_CLK_66M,
 	FIXED_CLK_266M,
@@ -38,14 +50,16 @@ static const unsigned long fixed_clk_rates[NUM_FIXED_CLKS] = {
 	[FIXED_CLK_266M] = 266660000,
 };
 
-#define FIXED_CLK(rate)		FIXED_CLK_ ## rate
+#define FIXED_CLK_OFFSET	0x80000000
+#define FIXED_CLK(rate)		FIXED_CLK_OFFSET + FIXED_CLK_ ## rate
 
 /**
  * struct r8a78000_cpg_priv - Clock Pulse Generator Private Data
  *
  * @dev: CPG device
- * @map: Mapping from DT clock IDs
- * @fixed_hws: Fixed rate clocks
+ * @map: Mapping from DT clock IDs to SCMI clocks
+ * @fixed_hws: Fixed rate clocks used to replace SCMI clocks that do not
+ *             support the SCMI CLOCK_ATTRIBUTES command
  */
 struct r8a78000_cpg_priv {
 	struct device *dev;
@@ -86,9 +100,19 @@ static struct clk_hw *r8a78000_clk_get(struct of_phandle_args *spec,
 		return ERR_PTR(-ENOENT);
 	}
 
-	dev_dbg(dev, "Mapping DT clock %u to fixed clock %u\n", id, map->fw_id);
+	if (map->fw_id < FIXED_CLK_OFFSET)
+		dev_dbg(dev, "Mapping DT clock %u to SCMI clock %u\n", id,
+			map->fw_id);
+	else
+		dev_dbg(dev, "Mapping DT clock %u to fixed clock %u\n", id,
+			 map->fw_id - FIXED_CLK_OFFSET);
 
 	hw = map->hw;
+	if (!hw) {
+		/* CLOCK_ATTRIBUTES is not supported */
+		dev_err(dev, "Clock %u is not available\n", id);
+		return ERR_PTR(-ENOENT);
+	}
 
 	dev_dbg(dev, "clock %u is %s at %lu Hz\n", id, clk_hw_get_name(hw),
 		clk_hw_get_rate(hw));
@@ -96,6 +120,21 @@ static struct clk_hw *r8a78000_clk_get(struct of_phandle_args *spec,
 	return hw;
 }
 
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
 static void unregister_fixed_clks(void *data)
 {
 	struct r8a78000_cpg_priv *priv = data;
@@ -131,10 +170,14 @@ static int register_fixed_clks(struct r8a78000_cpg_priv *priv)
 }
 
 static const struct clk_map *fill_clk_map(struct r8a78000_cpg_priv *priv,
-					  const struct clk_map_in *map_in)
+					  const struct clk_map_in *map_in,
+					  struct device_node *scmi_clk_np)
 {
+	struct of_phandle_args scmi_spec;
 	struct device *dev = priv->dev;
 	struct clk_map *map;
+	struct clk_hw *hw;
+	struct clk *clk;
 	unsigned int i;
 
 	for (i = 0; map_in[i].dt_id >= 0; i++) { }
@@ -149,8 +192,38 @@ static const struct clk_map *fill_clk_map(struct r8a78000_cpg_priv *priv,
 			break;
 
 		map[i].fw_id = map_in[i].fw_id;
-		map[i].hw = priv->fixed_hws[map[i].fw_id];
-		continue;
+		if (map[i].fw_id >= FIXED_CLK_OFFSET) {
+			enum fixed_clk idx = map[i].fw_id - FIXED_CLK_OFFSET;
+
+			map[i].hw = priv->fixed_hws[idx];
+			continue;
+		}
+
+		scmi_spec.np = scmi_clk_np;
+		scmi_spec.args_count = 1;
+		scmi_spec.args[0] = map[i].fw_id;
+
+		clk = of_clk_get_from_provider(&scmi_spec);
+		if (IS_ERR(clk))
+			return dev_err_cast_probe(dev, clk,
+				"Failed to get SCMI clock %u\n", map[i].fw_id);
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
 	}
 
 	return map;
@@ -158,21 +231,74 @@ static const struct clk_map *fill_clk_map(struct r8a78000_cpg_priv *priv,
 
 static int r8a78000_cpg_probe(struct platform_device *pdev)
 {
+	struct device_node *scmi __free(device_node) = NULL;
+	struct device_node *scmi_clk_np = NULL;
 	struct device *dev = &pdev->dev;
+	const struct cpg_data *cpg_data;
 	struct r8a78000_cpg_priv *priv;
+	struct scmi_base_info version;
 	const struct clk_map_in *map;
+	const struct fw_map *fw_map;
 	int ret;
 
-	map = of_device_get_match_data(dev);
-	if (!map)
+	cpg_data = of_device_get_match_data(dev);
+	if (!cpg_data)
 		return -ENODEV;
 
+	map = cpg_data->default_map;
+
 	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv)
 		return -ENOMEM;
 
 	priv->dev = dev;
 
+	scmi = of_parse_phandle(dev->of_node, "firmware", 0);
+	if (!scmi) {
+		dev_dbg(dev, "Cannot find SCMI firmware node\n");
+		goto fallback;
+	}
+
+	if (!of_device_is_available(scmi)) {
+		dev_dbg(dev, "SCMI firmware node is not available\n");
+		goto fallback;
+	}
+
+	scmi_clk_np = scmi_find_proto(scmi, SCMI_PROTOCOL_CLOCK);
+	if (!scmi_clk_np) {
+		dev_dbg(dev, "Cannot find SCMI clock management protocol\n");
+		goto fallback;
+	}
+
+	ret = scmi_get_base_info(scmi, &version);
+	if (ret == -EPROBE_DEFER)
+		return dev_err_probe(dev, ret, "SCMI provider not ready\n");
+	if (ret) {
+		dev_dbg(dev, "SCMI is not available\n");
+		goto fallback;
+	}
+
+	if (strcmp(version.vendor_id, "Renesas") ||
+	    strcmp(version.sub_vendor_id, "None")) {
+		dev_warn(dev, "Unsupported SCMI firmware %s/%s\n",
+			 version.vendor_id, version.sub_vendor_id);
+		goto fallback;
+	}
+
+	for (fw_map = cpg_data->fw_map; fw_map->map; fw_map++) {
+		if (fw_map->impl_ver == version.impl_ver)
+			break;
+	}
+
+	if (!fw_map->map) {
+		dev_warn(dev, "Unsupported SCMI firmware version 0x%08x\n",
+			 version.impl_ver);
+		goto fallback;
+	}
+
+	map = fw_map->map;
+
+fallback:
 	ret = register_fixed_clks(priv);
 	if (ret)
 		return ret;
@@ -181,7 +307,7 @@ static int r8a78000_cpg_probe(struct platform_device *pdev)
 	 * We cannot do lazy look-up in r8a78000_clk_get(), as that function is
 	 * called with of_clk_mutex already held.
 	 */
-	priv->map = fill_clk_map(priv, map);
+	priv->map = fill_clk_map(priv, map, scmi_clk_np);
 	if (IS_ERR(priv->map))
 		return PTR_ERR(priv->map);
 
@@ -194,10 +320,19 @@ static const struct clk_map_in r8a78000_cpg_default[] = {
 	{ -1 }
 };
 
+static const struct fw_map r8a78000_cpg_fw_map[] = {
+	{ 0, NULL }
+};
+
+static const struct cpg_data r8a78000_cpg_data = {
+	.default_map = r8a78000_cpg_default,
+	.fw_map = r8a78000_cpg_fw_map,
+};
+
 static const struct of_device_id r8a78000_cpg_match[] = {
 	{
 		.compatible = "renesas,r8a78000-cpg",
-		.data = &r8a78000_cpg_default,
+		.data = &r8a78000_cpg_data,
 	},
 	{ /* sentinel */ }
 };
-- 
2.43.0


