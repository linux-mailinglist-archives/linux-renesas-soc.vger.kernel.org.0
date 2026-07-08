Return-Path: <linux-renesas-soc+bounces-34855-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id CKWwEuIjTmrEDwIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34855-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Jul 2026 12:18:10 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id D6E72724292
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Jul 2026 12:18:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34855-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34855-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0E2C230065EB
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Jul 2026 10:15:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7119C3998A4;
	Wed,  8 Jul 2026 10:15:37 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 004B538B7C3;
	Wed,  8 Jul 2026 10:15:35 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783505737; cv=none; b=hhkH4UFHsXMVcZfefl7TuIDXhuKASo7WAoJb4hqY29EoGUWIKQOalKnOU1uyBRGvu+wtF2eWakGZ/gTQcfGZXEpNxBrfA2bLQfvie0CkW6NMQOwBzMkU9kGDTPELOoKjBPEad7RbELQpP2/fIP+7frc173eC9yWNnGKUpTQZ3i0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783505737; c=relaxed/simple;
	bh=Og+U36/aYnQAa6whSyLre3uH5PORQlWndcAWkZqatGQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mFvuDfXy84REZXmOwNG1Bwj0BxM512RTryFRmPsVsLuYRhRLFDu4ixQ7foF8Fm3QVWU8ykvB0Ff13cIT6QJZoms1J7nMxtMoxYBqRztAkAc4EzFsxhXRqRNilkBHVfgNlngfGahyjjVpU9ZlLjiAegPWEaeMjJdCvB1YKDnqkb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4243B1F00A3A;
	Wed,  8 Jul 2026 10:15:32 +0000 (UTC)
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
Subject: [PATCH v2 4/6] pmdomain: renesas: Add R-Car X5H MDLC driver
Date: Wed,  8 Jul 2026 12:15:09 +0200
Message-ID: <23f979b0903ca11513ac339ab8b6dd40435603c5.1783505142.git.geert+renesas@glider.be>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[glider.be];
	TAGGED_FROM(0.00)[bounces-34855-lists,linux-renesas-soc=lfdr.de,renesas];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:ulfh@kernel.org,m:p.zabel@pengutronix.de,m:wsa+renesas@sang-engineering.com,m:marek.vasut+renesas@mailbox.org,m:kuninori.morimoto.gx@renesas.com,m:devicetree@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:geert+renesas@glider.be,m:krzk@kernel.org,m:conor@kernel.org,m:wsa@sang-engineering.com,m:marek.vasut@mailbox.org,m:geert@glider.be,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[geert@glider.be,linux-renesas-soc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[18];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,glider.be:from_mime,glider.be:email,glider.be:mid,pd_spec.np:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D6E72724292

Add a minimal Module Controller driver for the R-Car X5H (R8A78000) SoC.
For now this just supports the always-on power domains, and dummy clocks
and resets for the serial console (which is enabled by the boot loader).

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Calling genpd_add_provider() instead of of_genpd_add_provider_onecell()
would be sufficient, but the former is private.

v2:
  - Spin off from "pmdomain: renesas: Add R-Car X5H MDLC SCMI remapping
    driver",
  - Add default support not using SCMI,
  - Drop all SCMI remapping support,
  - Document use of -1 as a sentinel,
  - Rename struct r8a78000_mdlc_info to mdlc_info,
  - Print HW IDs in hexadecimal,
  - Reduce log level for unsupported MDLC instances from warn to dbg,
---
 drivers/pmdomain/renesas/Kconfig         |   4 +
 drivers/pmdomain/renesas/Makefile        |   1 +
 drivers/pmdomain/renesas/r8a78000-mdlc.c | 329 +++++++++++++++++++++++
 drivers/soc/renesas/Kconfig              |   1 +
 4 files changed, 335 insertions(+)
 create mode 100644 drivers/pmdomain/renesas/r8a78000-mdlc.c

diff --git a/drivers/pmdomain/renesas/Kconfig b/drivers/pmdomain/renesas/Kconfig
index b507c3e0d723efc6..f2f52d3c29a083f1 100644
--- a/drivers/pmdomain/renesas/Kconfig
+++ b/drivers/pmdomain/renesas/Kconfig
@@ -13,6 +13,10 @@ config SYSC_RMOBILE
 	bool "System Controller support for R-Mobile" if COMPILE_TEST
 
 # SoC
+config MDLC_R8A78000
+	bool "Module Controller support for R8A78000 (R-Car X5H)" if COMPILE_TEST
+	select RESET_CONTROLLER
+
 config SYSC_R8A7742
 	bool "System Controller support for R8A7742 (RZ/G1H)" if COMPILE_TEST
 	select SYSC_RCAR
diff --git a/drivers/pmdomain/renesas/Makefile b/drivers/pmdomain/renesas/Makefile
index 0391e6e67440a786..17849aad37a5ac4f 100644
--- a/drivers/pmdomain/renesas/Makefile
+++ b/drivers/pmdomain/renesas/Makefile
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 # SoC
+obj-$(CONFIG_MDLC_R8A78000)	+= r8a78000-mdlc.o
 obj-$(CONFIG_SYSC_R8A7742)	+= r8a7742-sysc.o
 obj-$(CONFIG_SYSC_R8A7743)	+= r8a7743-sysc.o
 obj-$(CONFIG_SYSC_R8A7745)	+= r8a7745-sysc.o
diff --git a/drivers/pmdomain/renesas/r8a78000-mdlc.c b/drivers/pmdomain/renesas/r8a78000-mdlc.c
new file mode 100644
index 0000000000000000..ed367e921a3341a7
--- /dev/null
+++ b/drivers/pmdomain/renesas/r8a78000-mdlc.c
@@ -0,0 +1,329 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * R-Car X5H Module Controller
+ *
+ * Copyright (C) 2026 Glider bv
+ */
+
+#include <linux/dev_printk.h>
+#include <linux/module.h>
+#include <linux/mod_devicetable.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/pm_domain.h>
+#include <linux/reset-controller.h>
+#include <linux/slab.h>
+
+#include <dt-bindings/power/renesas,r8a78000-mdlc.h>
+
+struct mod_map {
+	int hw_id;		/* Hardware module ID or -1 sentinel */
+};
+
+struct mdlc_info {
+	u32 base;
+	const struct mod_map *mod_map;
+};
+
+/**
+ * struct r8a78000_mdlc_priv - Module Controller Private Data
+ *
+ * @link: Link into list of MDLC instances
+ * @genpd_data: PM domain provider data
+ * @rcdev: Reset controller entity
+ * @dev: MDLC device
+ * @np: Device node in DT representing the MDLC
+ * @mod_map: Mapping from hardware module IDs
+ */
+struct r8a78000_mdlc_priv {
+	struct hlist_node link;
+	struct genpd_onecell_data genpd_data;
+	struct reset_controller_dev rcdev;
+	struct device *dev;
+	struct device_node *np;
+	const struct mod_map *mod_map;
+};
+
+static struct generic_pm_domain *r8a78000_genpd_always_on;
+static HLIST_HEAD(r8a78000_mdlc_list);
+static DEFINE_MUTEX(r8a78000_mdlc_lock);	/* protects the two above */
+
+static struct generic_pm_domain *r8a78000_genpd_xlate(
+			const struct of_phandle_args *spec, void *data)
+{
+	struct r8a78000_mdlc_priv *priv = container_of(data,
+					struct r8a78000_mdlc_priv, genpd_data);
+	struct device *dev = priv->dev;
+	u32 id;
+
+	if (spec->args_count != 2)
+		return ERR_PTR(-EINVAL);
+
+	id = spec->args[0];
+
+	if (id >= R8A78000_MDLC_PD_AON) {
+		dev_dbg(dev,
+			"Mapping HW power domain 0x%x to always-on domain\n",
+			id);
+		return r8a78000_genpd_always_on;
+	}
+
+	dev_err(dev, "Unknown power domain 0x%x\n", id);
+	return ERR_PTR(-ENOENT);
+}
+
+#define rcdev_to_priv(_rcdev)	\
+	container_of(_rcdev, struct r8a78000_mdlc_priv, rcdev)
+
+static const struct mod_map *mod_map_find(const struct mod_map *map, u32 id)
+{
+	if (!map)
+		return NULL;
+
+	for (; map->hw_id >= 0; map++) {
+		if (map->hw_id == id)
+			return map;
+	}
+
+	return NULL;
+}
+
+static int r8a78000_mdlc_reset_xlate(struct reset_controller_dev *rcdev,
+				     const struct of_phandle_args *spec)
+{
+	struct r8a78000_mdlc_priv *priv = rcdev_to_priv(rcdev);
+	struct device *dev = priv->dev;
+	const struct mod_map *map;
+	u32 id;
+
+	if (spec->args_count != 1)
+		return -EINVAL;
+
+	id = spec->args[0];
+
+	map = mod_map_find(priv->mod_map, id);
+	if (!map) {
+		dev_err(dev, "Unknown reset 0x%x\n", id);
+		return -ENOENT;
+	}
+
+	dev_dbg(dev, "Ignoring HW reset 0x%x\n", id);
+	return id;
+}
+
+#define DEFINE_MDLC_RESET_WRAPPER(op)					    \
+	static int r8a78000_mdlc_ ## op(struct reset_controller_dev *rcdev, \
+					unsigned long id)		    \
+	{								    \
+		struct r8a78000_mdlc_priv *priv = rcdev_to_priv(rcdev);	    \
+									    \
+		dev_dbg(priv->dev, "%s: Ignoring\n", __func__);		    \
+		return 0;						    \
+	}
+
+DEFINE_MDLC_RESET_WRAPPER(reset)
+DEFINE_MDLC_RESET_WRAPPER(assert)
+DEFINE_MDLC_RESET_WRAPPER(deassert)
+DEFINE_MDLC_RESET_WRAPPER(status)
+
+static const struct reset_control_ops r8a78000_mdlc_reset_ops = {
+	.reset = r8a78000_mdlc_reset,
+	.assert = r8a78000_mdlc_assert,
+	.deassert = r8a78000_mdlc_deassert,
+	.status = r8a78000_mdlc_status,
+};
+
+static int r8a78000_mdlc_attach_dev(struct generic_pm_domain *domain,
+				    struct device *dev)
+{
+	struct device_node *np = dev->of_node;
+	struct r8a78000_mdlc_priv *priv;
+	struct of_phandle_args pd_spec;
+	const struct mod_map *map;
+	unsigned int id;
+	int ret;
+
+	ret = of_parse_phandle_with_args(np, "power-domains",
+					 "#power-domain-cells", 0, &pd_spec);
+	if (ret < 0)
+		return ret;
+
+	if (pd_spec.args_count != 2) {
+		of_node_put(pd_spec.np);
+		return -EINVAL;
+	}
+
+	scoped_guard(mutex, &r8a78000_mdlc_lock) {
+		hlist_for_each_entry(priv, &r8a78000_mdlc_list, link) {
+			if (priv->np == pd_spec.np)
+				break;
+		}
+	}
+
+	if (!priv) {
+		dev_err(dev, "%s: MDLC %pOF not found\n", __func__, pd_spec.np);
+		of_node_put(pd_spec.np);
+		return -ENODEV;
+	}
+
+	id = pd_spec.args[1];
+	of_node_put(pd_spec.np);
+
+	map = mod_map_find(priv->mod_map, id);
+	if (!map) {
+		dev_err(dev, "Unknown module 0x%x\n", id);
+		return -ENOENT;
+	}
+
+	dev_dbg(dev, "Ignoring HW module 0x%x\n", id);
+	return 0;
+}
+
+static void r8a78000_mdlc_unlink(void *data)
+{
+	struct r8a78000_mdlc_priv *priv = data;
+
+	scoped_guard(mutex, &r8a78000_mdlc_lock) {
+		hlist_del(&priv->link);
+	}
+}
+
+static void r8a78000_genpd_del_provider(void *data)
+{
+	of_genpd_del_provider(data);
+}
+
+static int r8a78000_genpd_always_on_singleton(struct device *dev)
+{
+	struct generic_pm_domain *genpd;
+	int ret;
+
+	guard(mutex)(&r8a78000_mdlc_lock);
+
+	if (r8a78000_genpd_always_on)
+		return 0;
+
+	genpd = kzalloc_obj(*genpd);
+	if (!genpd)
+		return -ENOMEM;
+
+	genpd->name = "always-on";
+	genpd->attach_dev = r8a78000_mdlc_attach_dev;
+
+	ret = pm_genpd_init(genpd, &pm_domain_always_on_gov, false);
+	if (ret) {
+		kfree(genpd);
+		return dev_err_probe(dev, ret,
+				     "Failed to create always-on domain\n");
+	}
+
+	r8a78000_genpd_always_on = genpd;
+	return 0;
+}
+
+static int r8a78000_mdlc_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node *np = dev->of_node;
+	struct r8a78000_mdlc_priv *priv;
+	const struct mdlc_info *info;
+	struct resource *res;
+	int ret;
+
+	ret = r8a78000_genpd_always_on_singleton(dev);
+	if (ret)
+		return ret;
+
+	info = of_device_get_match_data(dev);
+	if (!info)
+		return -ENODEV;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->dev = dev;
+	priv->np = np;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!res)
+		return -ENODEV;
+
+	for (; info->base; info++) {
+		if (info->base == res->start)
+			break;
+	}
+
+	if (!info->base) {
+		dev_dbg(dev, "Unsupported MDLC instance 0x%pa\n", &res->start);
+		return -ENODEV;
+	}
+
+	priv->mod_map = info->mod_map;
+
+	scoped_guard(mutex, &r8a78000_mdlc_lock) {
+		hlist_add_head(&priv->link, &r8a78000_mdlc_list);
+	}
+
+	ret = devm_add_action_or_reset(dev, r8a78000_mdlc_unlink, priv);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to add action\n");
+
+	/* Note that no actual domains are registered, just need translation */
+	priv->genpd_data.xlate = r8a78000_genpd_xlate;
+	ret = of_genpd_add_provider_onecell(np, &priv->genpd_data);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "Failed to register genpd provider\n");
+
+	ret = devm_add_action_or_reset(dev, r8a78000_genpd_del_provider, np);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "failed to add unregister action\n");
+
+	priv->rcdev.ops = &r8a78000_mdlc_reset_ops;
+	priv->rcdev.of_node = np;
+	priv->rcdev.of_reset_n_cells = 1;
+	priv->rcdev.of_xlate = r8a78000_mdlc_reset_xlate;
+
+	ret = devm_reset_controller_register(dev, &priv->rcdev);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "Failed to register reset controller\n");
+
+	return 0;
+}
+
+static const struct mod_map r8a78000_mdlc_perw_mod_default[] = {
+	{ 0x54 },	/* HSCIF0 */
+	{ -1 },
+};
+
+static const struct mdlc_info r8a78000_mdlc_default[] = {
+	{
+		.base = 0xc05d0000 /* mdlc_perw */,
+		.mod_map = r8a78000_mdlc_perw_mod_default,
+	},
+	{ 0 }
+};
+
+static const struct of_device_id r8a78000_mdlc_match[] = {
+	{
+		.compatible = "renesas,r8a78000-mdlc",
+		.data = &r8a78000_mdlc_default,
+	},
+	{ /* sentinel */ }
+};
+
+static struct platform_driver r8a78000_mdlc_driver = {
+	.probe = r8a78000_mdlc_probe,
+	.driver = {
+		.name = "r8a78000-mdlc",
+		.of_match_table = r8a78000_mdlc_match,
+		.suppress_bind_attrs = true,
+	},
+};
+
+builtin_platform_driver(r8a78000_mdlc_driver)
+
+MODULE_DESCRIPTION("R-Car X5H MDLC Driver");
diff --git a/drivers/soc/renesas/Kconfig b/drivers/soc/renesas/Kconfig
index 2ab150d04bb1f1ef..d4055250de72f1fe 100644
--- a/drivers/soc/renesas/Kconfig
+++ b/drivers/soc/renesas/Kconfig
@@ -358,6 +358,7 @@ config ARCH_R8A78000
 	default y if ARCH_RENESAS
 	default ARCH_RENESAS
 	select ARCH_RCAR_GEN5
+	select MDLC_R8A78000
 	help
 	  This enables support for the Renesas R-Car X5H SoC.
 
-- 
2.43.0


