Return-Path: <linux-renesas-soc+bounces-32619-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mAziKEK/BWrXawIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32619-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 May 2026 14:25:38 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A7591541951
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 May 2026 14:25:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 419703016683
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 May 2026 12:25:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D55563DDDDF;
	Thu, 14 May 2026 12:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="JgwEqFWs"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E68313DD844;
	Thu, 14 May 2026 12:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778761531; cv=none; b=J/K+Vspin5+mTbj32P5IPe77Ign75uotho+hUIKRQ16rqjan88zTGQc4UNoHHmpyJgZIuvbAGlmUNOUwMEqwAx8QDxQhDx5cidAhYQsbLLTN/NjziFM+cOaV3ABJG/bStGxeUnzIewd+8QfpNXg4XSAuvLwAnHL883UManu7o7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778761531; c=relaxed/simple;
	bh=epDgLDQTOQLsxSIGm1FoiCtmVkVYkjcH+hGsLBHI0Wg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bTG6x7yn94F1Oju1rnn14m2cyopVEq+xZpPTEoq27Xak7qRtY5AMW8GTsjJ5Xo4bX02hDu4UPuVklnUrcUU94aa+wUqhcAUzPOO9A0tRqBCXViyeolMukYmXlVt4M0BiEPv9Bp6Z9eoTakbWD1M2M9D2qDutdOuwWxfj3vRKmO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=JgwEqFWs; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D615F1283;
	Thu, 14 May 2026 14:25:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1778761518;
	bh=epDgLDQTOQLsxSIGm1FoiCtmVkVYkjcH+hGsLBHI0Wg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=JgwEqFWsN+kYaHCIXkBQT1f+rPimkuh1Kve5jORnUiXhiF2OCeH1PyNJbs1smrZIc
	 kesQMZxsSjxGNFT+oqoejYQkDVbtVc6Qz50Gv7cIvDdVG+7Y++VW2KLWQjKMgqvy5J
	 J/+eohz+AB0ZsEYXzJp56puykWjH2LQZDiKm/p/g=
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Date: Thu, 14 May 2026 15:24:55 +0300
Subject: [PATCH 3/5] drm/rcar-du: dsc: Add rudimentary Renesas R-Car V4H
 DSC driver
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260514-rcar-du-dsc-v1-3-d65f7a9e9841@ideasonboard.com>
References: <20260514-rcar-du-dsc-v1-0-d65f7a9e9841@ideasonboard.com>
In-Reply-To: <20260514-rcar-du-dsc-v1-0-d65f7a9e9841@ideasonboard.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
 Marek Vasut <marek.vasut+renesas@mailbox.org>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=6866;
 i=tomi.valkeinen+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=lZXV9zDNtBcZP1iYgupaF2p7YJZFHlVyrRbo4zRvwrY=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBqBb8wH9XunC9dDlap3xmigJt9WVju6dglBivKF
 Im3c5oMIveJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCagW/MAAKCRD6PaqMvJYe
 9QLiEACZ6pWsfudpC4HUPwhgiltKUpWrf+rhxa/zrGuZOY/rsD+waJOZ+JUNR9jEIAV/nw9TQhw
 VKi7BsgTpUFYSgd0oL3Y//omwyN2WC97C+DfaIyoHHaJFGhwBo4QNioYrU2RMnpfdZghdm+UJ6s
 TvJiEY2BwhKSHHF/orCmMbHb/j8ZtkB4KuFp2KoGbUFKf8M9ueotoo5JRo126dL5Fkcx4RgahHu
 d9undzjzc0bNmnr487Lc9CvbfQTVT3icGTm82GHOuqvIfkiWlg/jbm5qpqLdKdhV8JQnKhySLnF
 wh02b7aEvAELXqBuKJH2ryCcSW2S9L3mQugrgLaICEsTMMtlYKgm+QCynH8W90MFRAXDYlJs4+N
 4w+sBh/pXS4sbBUZ5ZVEVnyFJpvl3kAO5cLhcOGluVsrcoAqw3tl6ByKRgt2ZBckyPhmUhtKaJD
 Wh8TJPoMI0cxskG5CC8tJTPbgzwl1hyICzr1qeyv2bDVmnm0zvH8z1bQA+eSynP2WYrNqIVWkV/
 3isuBYetBS29wThYA+4rDAyoD72R6+4II0nvswmUVcbV/ObqkvW334MzSKfgE6wFd55d5IDTkXL
 BzETil0ed2OkqF0mRb5Vxs1XkMKeDDioDy6TJf/N6u2RVTTtuElVJ2tFczfoPYK+6bEALT7hHMV
 WGr6HbGeIJGDWxQ==
X-Developer-Key: i=tomi.valkeinen+renesas@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
X-Rspamd-Queue-Id: A7591541951
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32619-lists,linux-renesas-soc=lfdr.de,renesas];
	FREEMAIL_TO(0.00)[glider.be,baylibre.com,kernel.org,intel.com,linaro.org,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,suse.de,ffwll.ch,mailbox.org,pengutronix.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[28];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tomi.valkeinen@ideasonboard.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mailbox.org:email,ideasonboard.com:email,ideasonboard.com:mid,ideasonboard.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Action: no action

From: Marek Vasut <marek.vasut+renesas@mailbox.org>

The Renesas DSC Display Stream Compression is a bridge embedded in the
Renesas R-Car V4H SoC. The bridge performs VESA DSC encoding of up to
8k or 400 Mpixel/s . Add rudimentary driver, which currently acts as a
pass-through bridge and allows DSI1 to be operational on R-Car V4H.

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
[tomi.valkeinen: use bridge->next_bridge, minor changes]
Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
 drivers/gpu/drm/renesas/rcar-du/Kconfig    |  13 +++
 drivers/gpu/drm/renesas/rcar-du/Makefile   |   1 +
 drivers/gpu/drm/renesas/rcar-du/rcar_dsc.c | 163 +++++++++++++++++++++++++++++
 3 files changed, 177 insertions(+)

diff --git a/drivers/gpu/drm/renesas/rcar-du/Kconfig b/drivers/gpu/drm/renesas/rcar-du/Kconfig
index 840305fdeb49..a51f996d3537 100644
--- a/drivers/gpu/drm/renesas/rcar-du/Kconfig
+++ b/drivers/gpu/drm/renesas/rcar-du/Kconfig
@@ -33,6 +33,19 @@ config DRM_RCAR_DW_HDMI
 	help
 	  Enable support for R-Car Gen3 or RZ/G2 internal HDMI encoder.
 
+config DRM_RCAR_USE_DSC
+	bool "R-Car DU DSC Encoder Support"
+	depends on DRM_BRIDGE && OF
+	depends on DRM_RCAR_DU || COMPILE_TEST
+	default DRM_RCAR_DU
+	help
+	  Enable support for the R-Car Display Unit embedded DSC encoder.
+
+config DRM_RCAR_DSC
+	def_tristate DRM_RCAR_DU
+	depends on DRM_RCAR_USE_DSC
+	select RESET_CONTROLLER
+
 config DRM_RCAR_USE_LVDS
 	bool "R-Car DU LVDS Encoder Support"
 	depends on DRM_BRIDGE && OF
diff --git a/drivers/gpu/drm/renesas/rcar-du/Makefile b/drivers/gpu/drm/renesas/rcar-du/Makefile
index 6f132325c8b7..cc27b2265d94 100644
--- a/drivers/gpu/drm/renesas/rcar-du/Makefile
+++ b/drivers/gpu/drm/renesas/rcar-du/Makefile
@@ -12,5 +12,6 @@ rcar-du-drm-$(CONFIG_DRM_RCAR_WRITEBACK) += rcar_du_writeback.o
 obj-$(CONFIG_DRM_RCAR_CMM)		+= rcar_cmm.o
 obj-$(CONFIG_DRM_RCAR_DU)		+= rcar-du-drm.o
 obj-$(CONFIG_DRM_RCAR_DW_HDMI)		+= rcar_dw_hdmi.o
+obj-$(CONFIG_DRM_RCAR_DSC)		+= rcar_dsc.o
 obj-$(CONFIG_DRM_RCAR_LVDS)		+= rcar_lvds.o
 obj-$(CONFIG_DRM_RCAR_MIPI_DSI)		+= rcar_mipi_dsi.o
diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_dsc.c b/drivers/gpu/drm/renesas/rcar-du/rcar_dsc.c
new file mode 100644
index 000000000000..2ab5a4bb099c
--- /dev/null
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_dsc.c
@@ -0,0 +1,163 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * R-Car DSC Encoder
+ *
+ * Copyright (C) 2025 Marek Vasut <marek.vasut+renesas@mailbox.org>
+ * Copyright (C) 2025 Renesas Electronics Corporation
+ */
+
+#include <linux/clk.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_graph.h>
+#include <linux/platform_device.h>
+#include <linux/reset.h>
+
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_bridge.h>
+#include <drm/drm_of.h>
+
+struct rcar_dsc {
+	struct drm_bridge bridge;
+
+	struct device *dev;
+	void __iomem *mmio;
+	struct clk *clk;
+	struct reset_control *rst;
+};
+
+static inline struct rcar_dsc *bridge_to_rcar_dsc(struct drm_bridge *bridge)
+{
+	return container_of(bridge, struct rcar_dsc, bridge);
+}
+
+/* -----------------------------------------------------------------------------
+ * Bridge
+ */
+
+static int rcar_dsc_attach(struct drm_bridge *bridge,
+			   struct drm_encoder *encoder,
+			   enum drm_bridge_attach_flags flags)
+{
+	struct rcar_dsc *dsc = bridge_to_rcar_dsc(bridge);
+
+	if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR))
+		return -EINVAL;
+
+	return drm_bridge_attach(encoder, dsc->bridge.next_bridge, bridge,
+				 DRM_BRIDGE_ATTACH_NO_CONNECTOR);
+}
+
+static void rcar_dsc_atomic_enable(struct drm_bridge *bridge,
+				   struct drm_atomic_state *state)
+{
+	struct rcar_dsc *dsc = bridge_to_rcar_dsc(bridge);
+
+	WARN_ON(clk_prepare_enable(dsc->clk));
+	WARN_ON(reset_control_deassert(dsc->rst));
+}
+
+static void rcar_dsc_atomic_disable(struct drm_bridge *bridge,
+				    struct drm_atomic_state *state)
+{
+	struct rcar_dsc *dsc = bridge_to_rcar_dsc(bridge);
+
+	reset_control_assert(dsc->rst);
+	clk_disable_unprepare(dsc->clk);
+}
+
+static enum drm_mode_status
+rcar_dsc_bridge_mode_valid(struct drm_bridge *bridge,
+			   const struct drm_display_info *info,
+			   const struct drm_display_mode *mode)
+{
+	if (mode->hdisplay < 320 || mode->hdisplay > 8190)
+		return MODE_BAD_HVALUE;
+
+	if (mode->vdisplay < 160 || mode->vdisplay > 8190)
+		return MODE_BAD_VVALUE;
+
+	if (mode->clock > 400000) /* Really 400 Mpixel/s */
+		return MODE_CLOCK_HIGH;
+
+	return MODE_OK;
+}
+
+static const struct drm_bridge_funcs rcar_dsc_bridge_ops = {
+	.attach = rcar_dsc_attach,
+	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
+	.atomic_reset = drm_atomic_helper_bridge_reset,
+	.atomic_enable = rcar_dsc_atomic_enable,
+	.atomic_disable = rcar_dsc_atomic_disable,
+	.mode_valid = rcar_dsc_bridge_mode_valid,
+};
+
+/* -----------------------------------------------------------------------------
+ * Probe & Remove
+ */
+
+static int rcar_dsc_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node *remote;
+	struct rcar_dsc *dsc;
+
+	dsc = devm_drm_bridge_alloc(dev, struct rcar_dsc, bridge,
+				    &rcar_dsc_bridge_ops);
+	if (IS_ERR(dsc))
+		return PTR_ERR(dsc);
+
+	platform_set_drvdata(pdev, dsc);
+
+	dsc->dev = &pdev->dev;
+
+	/* Acquire resources. */
+	dsc->mmio = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(dsc->mmio))
+		return PTR_ERR(dsc->mmio);
+
+	dsc->clk = devm_clk_get(dev, NULL);
+	if (IS_ERR(dsc->clk))
+		return dev_err_probe(dev, PTR_ERR(dsc->clk),
+				     "Failed to get CPG clock\n");
+
+	dsc->rst = devm_reset_control_get(dev, NULL);
+	if (IS_ERR(dsc->rst))
+		return dev_err_probe(dev, PTR_ERR(dsc->rst),
+				     "Failed to get CPG reset\n");
+
+	remote = of_graph_get_remote_node(dev->of_node, 1, 0);
+	if (!remote)
+		return -EINVAL;
+
+	dsc->bridge.next_bridge = of_drm_find_and_get_bridge(remote);
+	of_node_put(remote);
+	if (!dsc->bridge.next_bridge)
+		return -EPROBE_DEFER;
+
+	dsc->bridge.of_node = dev->of_node;
+
+	return devm_drm_bridge_add(dev, &dsc->bridge);
+}
+
+static const struct of_device_id rcar_dsc_of_table[] = {
+	{ .compatible = "renesas,r8a779g0-dsc" },
+	{}
+};
+
+MODULE_DEVICE_TABLE(of, rcar_dsc_of_table);
+
+static struct platform_driver rcar_dsc_platform_driver = {
+	.probe          = rcar_dsc_probe,
+	.driver         = {
+		.name   = "rcar-dsc",
+		.of_match_table = rcar_dsc_of_table,
+	},
+};
+
+module_platform_driver(rcar_dsc_platform_driver);
+
+MODULE_DESCRIPTION("Renesas R-Car DSC Encoder Driver");
+MODULE_LICENSE("GPL");

-- 
2.43.0


