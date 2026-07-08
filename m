Return-Path: <linux-renesas-soc+bounces-34866-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id h4YfGzImTmqNEAIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34866-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Jul 2026 12:28:02 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 18C77724501
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Jul 2026 12:28:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34866-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34866-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AB98830A01B1
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Jul 2026 10:19:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66C6642255B;
	Wed,  8 Jul 2026 10:17:38 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD022421F11;
	Wed,  8 Jul 2026 10:17:36 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783505858; cv=none; b=jMbDQl2Lo3BamOht3Sgvf1Xg1GUY5jURCoZ+7FruRizVD4H+vD2sXSTL7+MN+AL61Md5JsYTk9lyXIA3SHEnXqDuKEifnAqvPTDkwoCvp6NL1IqcaVfWO7qsMTJnYB2BkwkHUafKFhQ/lIK6xndQbuGdVJgakkeJROH6j6NuoJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783505858; c=relaxed/simple;
	bh=67nhmHTiDcHNxUaGZLctLyMur38oWg5FkDgNQn8U2Tg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qA8OVyEGFBuN+CMXKo6aTExQUWCFikwDkS5cMHIqYlfNahO4WPIoDMu2WMN05y9k0yjEiEAgyfsU6h6/YBwY96A/KyDXMC+LKykT/JPqj7pZsXoIRBCdnPVs1OBWte8uYjhHe4LQCcQjigz8O3/mTiUsEF7S+yalBy1NMZh6ypw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5649A1F00A3A;
	Wed,  8 Jul 2026 10:17:31 +0000 (UTC)
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
Subject: [PATCH v2 08/10] pmdomain: renesas: r8a78000: Add SCMI remapping support
Date: Wed,  8 Jul 2026 12:16:26 +0200
Message-ID: <91a3827d97c8b0b55bf30b34a1abc95f6b58ba9d.1783505329.git.geert+renesas@glider.be>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[glider.be];
	TAGGED_FROM(0.00)[bounces-34866-lists,linux-renesas-soc=lfdr.de,renesas];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[geert@glider.be,linux-renesas-soc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[28];
	FORGED_RECIPIENTS(0.00)[m:sudeep.holla@kernel.org,m:cristian.marussi@arm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:saravanak@kernel.org,m:ulfh@kernel.org,m:rafael@kernel.org,m:p.zabel@pengutronix.de,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:bartosz.golaszewski@oss.qualcomm.com,m:vkoul@kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:khilman@baylibre.com,m:florian.fainelli@broadcom.com,m:wsa+renesas@sang-engineering.com,m:marek.vasut+renesas@mailbox.org,m:kuninori.morimoto.gx@renesas.com,m:arm-scmi@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:geert+renesas@glider.be,m:krzk@kernel.org,m:conor@kernel.org,m:wsa@sang-engineering.com,m:marek.vasut@mailbox.org,m:geert@glider.be,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[mailbox.org:email,glider.be:from_mime,glider.be:email,glider.be:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,scmi_spec.np:url,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 18C77724501

Extend the Module Controller driver for R-Car X5H with SCMI support,
to remap hardware power domain, module, and reset IDs to SCMI power
domains, clocks, and resets when running on a system with a
supported SCMI firmware implementation.  Take into account peculiarities
of the detected SCMI firmware version, like missing resets.

Note that SCMI clocks representing hardware modules expose access to
Module Standby control: they are fake clocks, with a zero clock rate,
that can just be enabled and disabled.  Hence they are controlled from
the clock domain's start/stop callbacks.

This lets us avoid putting unstable SCMI IDs in DT, and allows us to use
the same hardware description in SoC DTS for systems with and without
SCMI firmware.

Note that this only includes SCMI remapping support, and does not
include yet any mapping tables for specific SCMI firmware versions.

Suggested-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Note that SCP FW v4.32 has two new reset IDs without corresponding clock
IDs, so the "/* SCMI clock and reset IDs are identical */" comment is no
longer 100% true.  However, these new resets seem to be meant for board
control, not SoC control.

v2:
  - Spin off from "pmdomain: renesas: Add R-Car X5H MDLC SCMI remapping
    driver".
  - Propagate error codes from scmi_get_base_info() now it can return
    -EPROBE_DEFER,
  - Improve error message on scmi_get_base_info() failure,
  - Check if SCMI firmware node is available,
  - Replace scmi_power_np and scmi_reset_np members of struct
    r8a78000_mdlc_priv by local variables in r8a78000_mdlc_probe(), and
    pass the former to fill_power_map(),
  - Move check for supported firmware version up,
  - Fall back to the default support when SCMI support or firmware is
    not available, or when the detected SCMI firmware version is not
    supported by the driver,
  - Drop mapping tables.
---
 drivers/pmdomain/renesas/r8a78000-mdlc.c | 311 ++++++++++++++++++++++-
 1 file changed, 299 insertions(+), 12 deletions(-)

diff --git a/drivers/pmdomain/renesas/r8a78000-mdlc.c b/drivers/pmdomain/renesas/r8a78000-mdlc.c
index ed367e921a3341a7..55f82fcfbe0b0556 100644
--- a/drivers/pmdomain/renesas/r8a78000-mdlc.c
+++ b/drivers/pmdomain/renesas/r8a78000-mdlc.c
@@ -5,26 +5,53 @@
  * Copyright (C) 2026 Glider bv
  */
 
+#include <linux/cleanup.h>
+#include <linux/clk.h>
 #include <linux/dev_printk.h>
 #include <linux/module.h>
 #include <linux/mod_devicetable.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
+#include <linux/pm_clock.h>
 #include <linux/pm_domain.h>
 #include <linux/reset-controller.h>
+#include <linux/scmi_protocol.h>
 #include <linux/slab.h>
 
 #include <dt-bindings/power/renesas,r8a78000-mdlc.h>
 
+struct power_map_in {
+	int hw_id;		/* Hardware power domain ID or -1 sentinel */
+	u32 fw_id;		/* SCMI firmware power domain ID */
+};
+
+struct power_map {
+	int hw_id;		/* Hardware power domain ID or -1 sentinel */
+	u32 fw_id;		/* SCMI firmware power domain ID */
+	struct generic_pm_domain *genpd;
+};
+
 struct mod_map {
 	int hw_id;		/* Hardware module ID or -1 sentinel */
+	u32 fw_id;		/* SCMI clock and reset IDs are identical */
 };
 
 struct mdlc_info {
 	u32 base;
+	const struct power_map_in *power_map;
 	const struct mod_map *mod_map;
 };
 
+struct fw_map {
+	u32 impl_ver;
+	const struct mdlc_info *info;
+};
+
+struct mdlc_data {
+	const struct mdlc_info *default_info;
+	const struct fw_map *fw_map;
+};
+
 /**
  * struct r8a78000_mdlc_priv - Module Controller Private Data
  *
@@ -33,7 +60,10 @@ struct mdlc_info {
  * @rcdev: Reset controller entity
  * @dev: MDLC device
  * @np: Device node in DT representing the MDLC
- * @mod_map: Mapping from hardware module IDs
+ * @scmi_clk_np: Device node in DT for the SCMI firmware clock protocol
+ * @scmi_rcdev: SCMI reset controller entity
+ * @power_map: Mapping from hardware power domain IDs to SCMI power domains
+ * @mod_map: Mapping from hardware module IDs to SCMI clocks and resets
  */
 struct r8a78000_mdlc_priv {
 	struct hlist_node link;
@@ -41,6 +71,9 @@ struct r8a78000_mdlc_priv {
 	struct reset_controller_dev rcdev;
 	struct device *dev;
 	struct device_node *np;
+	struct device_node *scmi_clk_np;
+	struct reset_controller_dev *scmi_rcdev;
+	const struct power_map *power_map;
 	const struct mod_map *mod_map;
 };
 
@@ -48,12 +81,28 @@ static struct generic_pm_domain *r8a78000_genpd_always_on;
 static HLIST_HEAD(r8a78000_mdlc_list);
 static DEFINE_MUTEX(r8a78000_mdlc_lock);	/* protects the two above */
 
+static const struct power_map *power_map_find(const struct power_map *map,
+					      u32 id)
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
 static struct generic_pm_domain *r8a78000_genpd_xlate(
 			const struct of_phandle_args *spec, void *data)
 {
 	struct r8a78000_mdlc_priv *priv = container_of(data,
 					struct r8a78000_mdlc_priv, genpd_data);
+	struct generic_pm_domain *genpd;
 	struct device *dev = priv->dev;
+	const struct power_map *map;
 	u32 id;
 
 	if (spec->args_count != 2)
@@ -68,8 +117,18 @@ static struct generic_pm_domain *r8a78000_genpd_xlate(
 		return r8a78000_genpd_always_on;
 	}
 
-	dev_err(dev, "Unknown power domain 0x%x\n", id);
-	return ERR_PTR(-ENOENT);
+	map = power_map_find(priv->power_map, id);
+	if (!map) {
+		dev_err(dev, "Unknown power domain 0x%x\n", id);
+		return ERR_PTR(-ENOENT);
+	}
+
+	dev_dbg(dev, "Mapping HW power domain 0x%x to SCMI power domain %u\n",
+		id, map->fw_id);
+
+	genpd = map->genpd;
+
+	return genpd;
 }
 
 #define rcdev_to_priv(_rcdev)	\
@@ -107,8 +166,15 @@ static int r8a78000_mdlc_reset_xlate(struct reset_controller_dev *rcdev,
 		return -ENOENT;
 	}
 
-	dev_dbg(dev, "Ignoring HW reset 0x%x\n", id);
-	return id;
+	if (!priv->scmi_rcdev) {
+		dev_dbg(dev, "Ignoring HW reset 0x%x\n", id);
+		return id;
+	}
+
+	dev_dbg(dev, "Mapping HW reset 0x%x to SCMI reset %u\n", id,
+		map->fw_id);
+
+	return map->fw_id;
 }
 
 #define DEFINE_MDLC_RESET_WRAPPER(op)					    \
@@ -116,9 +182,22 @@ static int r8a78000_mdlc_reset_xlate(struct reset_controller_dev *rcdev,
 					unsigned long id)		    \
 	{								    \
 		struct r8a78000_mdlc_priv *priv = rcdev_to_priv(rcdev);	    \
+		int ret;						    \
+									    \
+		if (!priv->scmi_rcdev) {				    \
+			dev_dbg(priv->dev, "%s: Ignoring\n", __func__);	    \
+			return 0;					    \
+		}							    \
 									    \
-		dev_dbg(priv->dev, "%s: Ignoring\n", __func__);		    \
-		return 0;						    \
+		if (!priv->scmi_rcdev->ops->op)				    \
+			return -ENOTSUPP;				    \
+									    \
+		ret = priv->scmi_rcdev->ops->op(priv->scmi_rcdev, id);	    \
+		if (ret == -EOPNOTSUPP)					    \
+			dev_dbg(priv->dev,				    \
+				"%s: Ignoring unsupported reset %lu\n",	    \
+				__func__, id);				    \
+		return ret == -EOPNOTSUPP ? 0 : ret;			    \
 	}
 
 DEFINE_MDLC_RESET_WRAPPER(reset)
@@ -133,14 +212,30 @@ static const struct reset_control_ops r8a78000_mdlc_reset_ops = {
 	.status = r8a78000_mdlc_status,
 };
 
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
 static int r8a78000_mdlc_attach_dev(struct generic_pm_domain *domain,
 				    struct device *dev)
 {
+	struct of_phandle_args pd_spec, scmi_spec;
 	struct device_node *np = dev->of_node;
 	struct r8a78000_mdlc_priv *priv;
-	struct of_phandle_args pd_spec;
 	const struct mod_map *map;
 	unsigned int id;
+	struct clk *clk;
 	int ret;
 
 	ret = of_parse_phandle_with_args(np, "power-domains",
@@ -175,8 +270,107 @@ static int r8a78000_mdlc_attach_dev(struct generic_pm_domain *domain,
 		return -ENOENT;
 	}
 
-	dev_dbg(dev, "Ignoring HW module 0x%x\n", id);
+	if (!priv->scmi_clk_np) {
+		dev_dbg(dev, "Ignoring HW module 0x%x\n", id);
+		return 0;
+	}
+
+	dev_dbg(dev, "Mapping HW module 0x%x to SCMI clock %u\n", id,
+		map->fw_id);
+
+	scmi_spec.np = priv->scmi_clk_np;
+	scmi_spec.args_count = 1;
+	scmi_spec.args[0] = map->fw_id;
+
+	clk = of_clk_get_from_provider(&scmi_spec);
+	if (IS_ERR(clk)) {
+		dev_err(dev, "Cannot get SCMI clock %u: %pe\n", map->fw_id,
+			clk);
+		return PTR_ERR(clk);
+	}
+
+	dev_dbg(dev, "SCMI clock %u is %pC\n", map->fw_id, clk);
+
+	if (!clk) {
+		/* Ignore missing SCMI module clocks */
+		return 0;
+	}
+
+	ret = pm_clk_create(dev);
+	if (ret)
+		goto fail_put;
+
+	ret = pm_clk_add_clk(dev, clk);
+	if (ret)
+		goto fail_destroy;
+
 	return 0;
+
+fail_destroy:
+	pm_clk_destroy(dev);
+fail_put:
+	clk_put(clk);
+	return ret;
+}
+
+static void r8a78000_mdlc_detach_dev(struct generic_pm_domain *domain,
+				     struct device *dev)
+{
+	if (!pm_clk_no_clocks(dev))
+		pm_clk_destroy(dev);
+}
+
+static const struct power_map *fill_power_map(struct r8a78000_mdlc_priv *priv,
+					      const struct power_map_in *map_in,
+					      struct device_node *scmi_power_np)
+{
+	struct of_phandle_args scmi_spec;
+	struct generic_pm_domain *genpd;
+	struct device *dev = priv->dev;
+	struct power_map *map;
+	unsigned int i;
+
+	if (!map_in)
+		return NULL;
+
+	for (i = 0; map_in[i].hw_id >= 0; i++) { }
+
+	map = devm_kcalloc(dev, i + 1, sizeof(*map), GFP_KERNEL);
+	if (!map)
+		return ERR_PTR(-ENOMEM);
+
+	for (i = 0; ; i++) {
+		map[i].hw_id = map_in[i].hw_id;
+		if (map[i].hw_id < 0)
+			break;
+
+		map[i].fw_id = map_in[i].fw_id;
+
+		scmi_spec.np = scmi_power_np;
+		scmi_spec.args_count = 1;
+		scmi_spec.args[0] = map[i].fw_id;
+
+		genpd = genpd_get_from_provider(&scmi_spec);
+		if (IS_ERR(genpd))
+			return dev_err_cast_probe(dev, genpd,
+					"Failed to get SCMI power domain %u\n",
+					map[i].fw_id);
+
+		dev_dbg(dev, "SCMI power domain %u is %s\n", map[i].fw_id,
+			genpd->name);
+
+		map[i].genpd = genpd;
+
+		/* Hook up clock domain support */
+		genpd->attach_dev = r8a78000_mdlc_attach_dev;
+		genpd->detach_dev = r8a78000_mdlc_detach_dev;
+		/* Setting flags this late has no impact, but does not hurt */
+		genpd->flags |= GENPD_FLAG_PM_CLK;
+		genpd->dev_ops.stop = pm_clk_suspend;
+		genpd->dev_ops.start = pm_clk_resume;
+	}
+
+	return map;
 }
 
 static void r8a78000_mdlc_unlink(void *data)
@@ -209,6 +403,8 @@ static int r8a78000_genpd_always_on_singleton(struct device *dev)
 
 	genpd->name = "always-on";
 	genpd->attach_dev = r8a78000_mdlc_attach_dev;
+	genpd->detach_dev = r8a78000_mdlc_detach_dev;
+	genpd->flags |= GENPD_FLAG_PM_CLK;
 
 	ret = pm_genpd_init(genpd, &pm_domain_always_on_gov, false);
 	if (ret) {
@@ -225,8 +421,15 @@ static int r8a78000_mdlc_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct device_node *np = dev->of_node;
+	struct device_node *scmi __free(device_node) = NULL;
+	struct device_node *scmi_power_np = NULL;
+	const struct mdlc_data *mdlc_data;
+	struct device_node *scmi_reset_np;
+	struct device_node *scmi_clk_np;
 	struct r8a78000_mdlc_priv *priv;
+	struct scmi_base_info version;
 	const struct mdlc_info *info;
+	const struct fw_map *fw_map;
 	struct resource *res;
 	int ret;
 
@@ -234,10 +437,12 @@ static int r8a78000_mdlc_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	info = of_device_get_match_data(dev);
-	if (!info)
+	mdlc_data = of_device_get_match_data(dev);
+	if (!mdlc_data)
 		return -ENODEV;
 
+	info = mdlc_data->default_info;
+
 	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv)
 		return -ENOMEM;
@@ -245,6 +450,71 @@ static int r8a78000_mdlc_probe(struct platform_device *pdev)
 	priv->dev = dev;
 	priv->np = np;
 
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
+	scmi_power_np = scmi_find_proto(scmi, SCMI_PROTOCOL_POWER);
+	if (!scmi_power_np) {
+		dev_dbg(dev,
+			"Cannot find SCMI power domain management protocol\n");
+		goto fallback;
+	}
+
+	scmi_clk_np = scmi_find_proto(scmi, SCMI_PROTOCOL_CLOCK);
+	if (!scmi_clk_np) {
+		dev_dbg(dev, "Cannot find SCMI clock management protocol\n");
+		goto fallback;
+	}
+
+	scmi_reset_np = scmi_find_proto(scmi, SCMI_PROTOCOL_RESET);
+	if (!scmi_reset_np) {
+		dev_dbg(dev, "Cannot find SCMI reset management protocol\n");
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
+	for (fw_map = mdlc_data->fw_map; fw_map->info; fw_map++) {
+		if (fw_map->impl_ver == version.impl_ver)
+			break;
+	}
+
+	if (!fw_map->info) {
+		dev_warn(dev, "Unsupported SCMI firmware version 0x%08x\n",
+			 version.impl_ver);
+		goto fallback;
+	}
+
+	priv->scmi_rcdev = reset_controller_get_provider(of_fwnode_handle(scmi_reset_np));
+	if (!priv->scmi_rcdev)
+		return dev_err_probe(dev, -EPROBE_DEFER,
+				     "SCMI reset not yet available\n");
+
+	priv->scmi_clk_np = scmi_clk_np;
+	info = fw_map->info;
+
+fallback:
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	if (!res)
 		return -ENODEV;
@@ -259,6 +529,14 @@ static int r8a78000_mdlc_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
+	/*
+	 * We cannot do lazy look-up in r8a78000_genpd_xlate(), as that
+	 * function is called with of_genpd_mutex already held.
+	 */
+	priv->power_map = fill_power_map(priv, info->power_map, scmi_power_np);
+	if (IS_ERR(priv->power_map))
+		return PTR_ERR(priv->power_map);
+
 	priv->mod_map = info->mod_map;
 
 	scoped_guard(mutex, &r8a78000_mdlc_lock) {
@@ -307,10 +585,19 @@ static const struct mdlc_info r8a78000_mdlc_default[] = {
 	{ 0 }
 };
 
+static const struct fw_map r8a78000_mdlc_fw_map[] = {
+	{ 0, NULL }
+};
+
+static const struct mdlc_data r8a78000_mdlc_data = {
+	.default_info = r8a78000_mdlc_default,
+	.fw_map = r8a78000_mdlc_fw_map,
+};
+
 static const struct of_device_id r8a78000_mdlc_match[] = {
 	{
 		.compatible = "renesas,r8a78000-mdlc",
-		.data = &r8a78000_mdlc_default,
+		.data = &r8a78000_mdlc_data,
 	},
 	{ /* sentinel */ }
 };
-- 
2.43.0


