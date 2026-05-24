Return-Path: <linux-renesas-soc+bounces-33059-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8EonIG5VE2oT+wYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33059-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 24 May 2026 21:45:50 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D74275C3DB4
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 24 May 2026 21:45:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 484EA3014560
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 24 May 2026 19:45:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 268BF31E851;
	Sun, 24 May 2026 19:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KlSIQ7fg"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE24B317155
	for <linux-renesas-soc@vger.kernel.org>; Sun, 24 May 2026 19:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779651905; cv=none; b=IBh5U1jWMLRPwfUioV5eqah3racTISSvtYqLXqveYh+GU1AajFMwonclbWJm3Ytjy6b98BY7KrPVDNAb/Ti33mwbmsED1F+4T4pnUmS6k0OnSpl4HPDK+LiqT2OvhQqBdfZG9VNs86eFA2OtzIVttnQ6oA9D24n+klFhKyF1azM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779651905; c=relaxed/simple;
	bh=WAamu4c0D9yTt0/FpNfiGWwP/tuVYI2m9kzm+++wC2s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=L43QoUE3MoKX9BrLU2QtSBKEkqyXyyK6Z84uAH8wRAmf1IHrnsBDFDGXTAlyYVehS3WmQRwMLFjY4B3Ivrfn7glaz4hwI6IJuYEIwgbpXZZrNb/MdvPHewswGDl6LrOwZMO3Y3cEe2G5XibE7FhWdiAESigFmes2uLsnq7llq6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KlSIQ7fg; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4891e86fabeso113580755e9.1
        for <linux-renesas-soc@vger.kernel.org>; Sun, 24 May 2026 12:45:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779651901; x=1780256701; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B7w7L5X+8CgXQ2GRNFrqiEaxR/6ZtsuTgo7YyhEXHZE=;
        b=KlSIQ7fgE6NQVziuft959R/t+/AZg54sQYiuudFdryxdNTYcBGWbiS2WAcoT1T653S
         ijYz/yak9j3EqbWqHQQcCOkfweQbFolh3C+cU2LF+qgdyPF5CdjusHads/sDUY1s1iMc
         A+FyPlb1PJr0ZzT61CJPxoBhSuxMMYWJafnmiCrY2LKhRUzRurNdY7UbkiQmjbaKEQnR
         o/wcb3H0WqOB4tHCqgtTDW2ejTBRs7Hqkqu7G+3D19vpq2ivBIUg0I+R0TseMTJWAwvZ
         ub3yHuUoP3CyGM1icHp3wah0aFGx1Xh1LNJXYICOn08FQUlCy/wxkfWpK5+qF3BraBAI
         w2WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779651901; x=1780256701;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=B7w7L5X+8CgXQ2GRNFrqiEaxR/6ZtsuTgo7YyhEXHZE=;
        b=AQMnGCncaaz0iU0rYsb7SoAcifnz1mW6y8BqWj+xkuBQc1nE+zlJCqgaRcAWMZZiDO
         4yU7qxJ8HoyStXmLYDeoeQ//+uIiIzirQvm49/HBYnkXrjWH1FWrGBGKKigNtrHeRoO4
         LRFD0D3yPBLc1QVttK0oDAhF4LpUhyo8dFBpNAw/82pRC+mIyYNw+nM0OQlBysRx/I+F
         SCBx2aOOmuMVMytkSbiZvLDRQtPBVYoE3pIe+wZ43I8weC0QFJWj2HBgB36QA3/+s0HA
         /9EqkPI/GSahrBe6osTHuJcRvzuSx/b5GB4f8XGb7wB+Sy2Idj+yNPZbz9FC9cc81B28
         hxog==
X-Forwarded-Encrypted: i=1; AFNElJ9sVCHPzy6ZI4Ap495attxdUlOyJAQUsH2HlcwJozgktizMKQRwwGDGvk1CczcVFVGsZ0g5LUj+UQUXg30rO7toNA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxzuw2L175vloslrBlrENPJqGs9hd4dFhiHVYmb9Nl/KSbdc5nt
	uP8zxDakr0Qwfkkg3XXT9ROVuh/o3OQXpiHIMGmrTFMnMG9lB6x8Gdwk
X-Gm-Gg: Acq92OE+7cvLz+d0WNhjJXBMNOtlh3PW64mCXB3NVeITPiPzAgUFm40hflTJirtRZk3
	7L/D/aAOxj0OR6Kr26IPyK4MQn/gc7MbVjl64ZCnJuSBN0ItEtilkfp8D6Zjvc6jCcMNfXfNVpt
	qkB+UQixRRnXfD0TzNLIOIM0fOZYs4EW1Os70ywTnne4xh+ac/21+PJ8wiYfMFZMN6j/6JWFD9U
	obIL+9igBAWZiqxv6mhwSsgr0Km6+5Wz83ypJXvAoZ9/xlhN13Bhk6jJtd2drIYfvSD6Aj7P4Ih
	3Gs7mBur7KsZ4+R5W2ClPZtuT1n018bm9mspoH6CqnV/wRQDFXq3WnJ5sDvCxVIZCrDpLa0ItqE
	YPiYjHmxIaZ3QyHjdI9tA1c1H7/LRyJyIKOKgqeTdFPZ1KKI27qKNoDgxFZi/j46bfg6i2b6rxt
	nCCAdrWSrr1xxe8SpehcPdmWEVvrlDpqsr8jK1zKQg5A==
X-Received: by 2002:a05:600c:444b:b0:490:388f:1c0d with SMTP id 5b1f17b1804b1-490424a9c9bmr198933185e9.5.1779651901308;
        Sun, 24 May 2026 12:45:01 -0700 (PDT)
Received: from biju.lan ([2a00:23c4:a700:7301:ae73:a12b:ca55:91be])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49042cde62csm68224515e9.32.2026.05.24.12.45.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2026 12:45:01 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Subject: [PATCH v2 2/2] drm: renesas: rz-du: Add support for RZ/G3L LVDS encoder
Date: Sun, 24 May 2026 20:44:51 +0100
Message-ID: <20260524194457.479681-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260524194457.479681-1-biju.das.jz@bp.renesas.com>
References: <20260524194457.479681-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_TO(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33059-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[bp.renesas.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,pengutronix.de,glider.be];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,bp.renesas.com,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	NEURAL_HAM(-0.00)[-0.987];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,bp.renesas.com:mid]
X-Rspamd-Queue-Id: D74275C3DB4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Biju Das <biju.das.jz@bp.renesas.com>

Add support for the RZ/G3L LVDS encoder driver. It operates in single-link
mode with 4 lanes (Data) + 1 lane (Clock) and supports pixel clock rates
from 25 to 87 MHz. The LVDS module cannot be used at the same time as
MIPI-DSI. However, LVDS and the DSI interface share a peripheral clock and
the MIPI_DSI_PRESET_N reset signal. Also, the MIPI_DSI_CMN_RSTB and
MIPI_DSI_ARESET_N reset signals must be asserted before using the LVDS
module.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2->v3:
 * Replace drm_atomic_state with drm_atomic_commit in
   rzg3l_lvds_atomic_{en,dis}able().
 * Drop local variable ret and dev_err() messages in
   rzg3l_lvds_atomic_enable(); use WARN_ON() instead to
   capture unexpected failures since atomic_enable should not fail.
 * Drop local variable next_bridge from rzg3l_lvds_probe().
v1->v2:
 * Dropped unused function rzg3l_lvds_is_connected() and removed the 
   corresponding header file rzg3l_lvds.h
 * Dropped next_bridge from struct rzg3l_lvds instead using bridge's
   next_bridge.
 * Replaced pm_runtime_resume_and_get()->pm_runtime_get_sync() as
   atomic_enable doesn't fail and for each enable there always will be an
   atomic_disable() call.
 * Started using DEFINE_RUNTIME_DEV_PM_OPS for PM callback.
 * Replaced rzg3l_lvds_parse_dt() with devm_drm_of_get_bridge() in probe()
 * Started using reset_control_bulk_*() in rzg3l_lvds_pm_runtime_{suspend,
   resume}()
---
 drivers/gpu/drm/renesas/rz-du/Kconfig         |  13 +
 drivers/gpu/drm/renesas/rz-du/Makefile        |   1 +
 drivers/gpu/drm/renesas/rz-du/rzg3l_lvds.c    | 277 ++++++++++++++++++
 .../gpu/drm/renesas/rz-du/rzg3l_lvds_regs.h   |  26 ++
 4 files changed, 317 insertions(+)
 create mode 100644 drivers/gpu/drm/renesas/rz-du/rzg3l_lvds.c
 create mode 100644 drivers/gpu/drm/renesas/rz-du/rzg3l_lvds_regs.h

diff --git a/drivers/gpu/drm/renesas/rz-du/Kconfig b/drivers/gpu/drm/renesas/rz-du/Kconfig
index 7f2ef7137ae5..cbfc7b6bccb8 100644
--- a/drivers/gpu/drm/renesas/rz-du/Kconfig
+++ b/drivers/gpu/drm/renesas/rz-du/Kconfig
@@ -26,3 +26,16 @@ config DRM_RZG2L_MIPI_DSI
 	def_tristate DRM_RZG2L_DU
 	depends on DRM_RZG2L_USE_MIPI_DSI
 	select DRM_MIPI_DSI
+
+config DRM_RZG3L_USE_LVDS
+	bool "RZ/G3L DU LVDS Encoder Support"
+	depends on DRM_BRIDGE && OF
+	default DRM_RZG2L_DU
+	help
+	  Enable support for the RZ/G3L Display Unit embedded LVDS encoders.
+
+config DRM_RZG3L_LVDS
+	def_tristate DRM_RZG2L_DU
+	depends on DRM_RZG3L_USE_LVDS
+	select DRM_KMS_HELPER
+	select DRM_PANEL
diff --git a/drivers/gpu/drm/renesas/rz-du/Makefile b/drivers/gpu/drm/renesas/rz-du/Makefile
index 2987900ea6b6..46decb7ac4f1 100644
--- a/drivers/gpu/drm/renesas/rz-du/Makefile
+++ b/drivers/gpu/drm/renesas/rz-du/Makefile
@@ -8,3 +8,4 @@ rzg2l-du-drm-$(CONFIG_VIDEO_RENESAS_VSP1)	+= rzg2l_du_vsp.o
 obj-$(CONFIG_DRM_RZG2L_DU)		+= rzg2l-du-drm.o
 
 obj-$(CONFIG_DRM_RZG2L_MIPI_DSI)	+= rzg2l_mipi_dsi.o
+obj-$(CONFIG_DRM_RZG3L_LVDS)		+= rzg3l_lvds.o
diff --git a/drivers/gpu/drm/renesas/rz-du/rzg3l_lvds.c b/drivers/gpu/drm/renesas/rz-du/rzg3l_lvds.c
new file mode 100644
index 000000000000..a51c3e5a2efe
--- /dev/null
+++ b/drivers/gpu/drm/renesas/rz-du/rzg3l_lvds.c
@@ -0,0 +1,277 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * RZ/G3L LVDS Encoder Driver
+ *
+ * Copyright (C) 2026 Renesas Electronics Corporation
+ */
+
+#include <linux/bitfield.h>
+#include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/io.h>
+#include <linux/media-bus-format.h>
+#include <linux/mfd/syscon.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/of_graph.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+#include <linux/regmap.h>
+#include <linux/reset.h>
+
+#include <drm/drm_atomic.h>
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_bridge.h>
+#include <drm/drm_of.h>
+#include <drm/drm_panel.h>
+#include <drm/drm_probe_helper.h>
+
+#include "rzg3l_lvds_regs.h"
+
+enum rzg3l_lvds_mode {
+	RZG3L_LVDS_MODE_JEIDA = 0,
+	RZG3L_LVDS_MODE_JEIDA_MIRROR = 1,
+	RZG3L_LVDS_MODE_MODE2 = 2,
+	RZG3L_LVDS_MODE_MODE2_MIRROR = 3,
+	RZG3L_LVDS_MODE_VESA = 4,
+	RZG3L_LVDS_MODE_VESA_MIRROR = 5,
+	RZG3L_LVDS_MODE_MODE6 = 6,
+	RZG3L_LVDS_MODE_MODE6_MIRROR = 7,
+};
+
+struct rzg3l_lvds {
+	struct device *dev;
+	struct reset_control *prstc;
+	struct reset_control *lvd_rstc;
+	struct regmap *regmap;
+	struct drm_bridge bridge;
+};
+
+#define bridge_to_rzg3l_lvds(b) \
+	container_of(b, struct rzg3l_lvds, bridge)
+
+/* -----------------------------------------------------------------------------
+ * Bridge
+ */
+
+static void rzg3l_lvds_atomic_enable(struct drm_bridge *bridge,
+				     struct drm_atomic_commit *state)
+{
+	struct rzg3l_lvds *lvds = bridge_to_rzg3l_lvds(bridge);
+	const struct drm_bridge_state *bridge_state;
+	u32 fmt;
+
+	/* Get the LVDS format from the bridge state. */
+	bridge_state = drm_atomic_get_new_bridge_state(state, bridge);
+	if (WARN_ON(!bridge_state))
+		return;
+
+	switch (bridge_state->output_bus_cfg.format) {
+	case MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA:
+		fmt = RZG3L_LVDS_MODE_JEIDA;
+		break;
+	case MEDIA_BUS_FMT_RGB888_1X7X4_SPWG:
+		fmt = RZG3L_LVDS_MODE_VESA;
+		break;
+	default:
+		fmt = RZG3L_LVDS_MODE_VESA;
+		dev_warn(lvds->dev, "Unsupported bus fmt 0x%04x\n",
+			 bridge_state->output_bus_cfg.format);
+		break;
+	}
+
+	if (WARN_ON(pm_runtime_get_sync(lvds->dev) < 0))
+		return;
+
+	regmap_update_bits(lvds->regmap, LVDS_0_PHY_OFFSET,
+			   LVDS_0_PHY_CH_EN_BGR, LVDS_0_PHY_CH_EN_BGR);
+	fsleep(20);
+
+	regmap_update_bits(lvds->regmap, LVDS_0_PHY_OFFSET,
+			   LVDS_0_PHY_CH_EN_LDO, LVDS_0_PHY_CH_EN_LDO);
+	fsleep(10);
+
+	regmap_write(lvds->regmap, LVDS_CMN, LVDS_CMN_RST_PHY0_SEL);
+	regmap_update_bits(lvds->regmap, LVDS_0_CTL_OFFSET,
+			   LVDS_0_CTL_FMT_SEL_MSK,
+			   FIELD_PREP(LVDS_0_CTL_FMT_SEL_MSK, fmt));
+	regmap_update_bits(lvds->regmap, LVDS_0_PHY_OFFSET,
+			   LVDS_0_PHY_CH_IO_EN_MSK, LVDS_0_PHY_CH_IO_EN);
+	regmap_write(lvds->regmap, LVDS_CMN,
+		     LVDS_CMN_RST_PHY0_SEL | LVDS_CMN_PHY_RESET);
+	fsleep(100);
+}
+
+static void rzg3l_lvds_atomic_disable(struct drm_bridge *bridge,
+				      struct drm_atomic_commit *state)
+{
+	struct rzg3l_lvds *lvds = bridge_to_rzg3l_lvds(bridge);
+
+	regmap_update_bits(lvds->regmap, LVDS_CMN, LVDS_CMN_PHY_RESET, 0);
+	regmap_update_bits(lvds->regmap, LVDS_0_PHY_OFFSET,
+			   LVDS_0_PHY_CH_IO_EN_MSK, 0);
+	regmap_update_bits(lvds->regmap, LVDS_0_PHY_OFFSET,
+			   LVDS_0_PHY_CH_EN_LDO, 0);
+	regmap_update_bits(lvds->regmap, LVDS_0_PHY_OFFSET,
+			   LVDS_0_PHY_CH_EN_BGR, 0);
+
+	pm_runtime_put(lvds->dev);
+}
+
+static int rzg3l_lvds_attach(struct drm_bridge *bridge,
+			     struct drm_encoder *encoder,
+			     enum drm_bridge_attach_flags flags)
+{
+	struct rzg3l_lvds *lvds = bridge_to_rzg3l_lvds(bridge);
+
+	if (!lvds->bridge.next_bridge)
+		return 0;
+
+	return drm_bridge_attach(encoder, lvds->bridge.next_bridge, bridge, flags);
+}
+
+static enum drm_mode_status
+rzg3l_lvds_bridge_mode_valid(struct drm_bridge *bridge,
+			     const struct drm_display_info *info,
+			     const struct drm_display_mode *mode)
+{
+	if (mode->clock > 87000)
+		return MODE_CLOCK_HIGH;
+
+	if (mode->clock < 25000)
+		return MODE_CLOCK_LOW;
+
+	return MODE_OK;
+}
+
+static const struct drm_bridge_funcs rzg3l_lvds_bridge_ops = {
+	.attach = rzg3l_lvds_attach,
+	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
+	.atomic_reset = drm_atomic_helper_bridge_reset,
+	.atomic_enable = rzg3l_lvds_atomic_enable,
+	.atomic_disable = rzg3l_lvds_atomic_disable,
+	.mode_valid = rzg3l_lvds_bridge_mode_valid,
+};
+
+/* -----------------------------------------------------------------------------
+ * Power Management
+ */
+
+static int rzg3l_lvds_pm_runtime_suspend(struct device *dev)
+{
+	struct rzg3l_lvds *lvds = dev_get_drvdata(dev);
+	struct reset_control_bulk_data resets[] = {
+		{ .rstc = lvds->lvd_rstc },
+		{ .rstc = lvds->prstc },
+	};
+
+	return reset_control_bulk_assert(ARRAY_SIZE(resets), resets);
+}
+
+static int rzg3l_lvds_pm_runtime_resume(struct device *dev)
+{
+	struct rzg3l_lvds *lvds = dev_get_drvdata(dev);
+	struct reset_control_bulk_data resets[] = {
+		{ .rstc = lvds->lvd_rstc },
+		{ .rstc = lvds->prstc },
+	};
+
+	return reset_control_bulk_deassert(ARRAY_SIZE(resets), resets);
+}
+
+static DEFINE_RUNTIME_DEV_PM_OPS(rzg3l_lvds_pm_ops,
+				 rzg3l_lvds_pm_runtime_suspend,
+				 rzg3l_lvds_pm_runtime_resume, NULL);
+
+/* -----------------------------------------------------------------------------
+ * Probe & Remove
+ */
+
+static int rzg3l_lvds_probe(struct platform_device *pdev)
+{
+	struct reset_control *rstc, *arstc;
+	struct device *dev = &pdev->dev;
+	struct rzg3l_lvds *lvds;
+	int ret;
+
+	lvds = devm_drm_bridge_alloc(dev, struct rzg3l_lvds, bridge,
+				     &rzg3l_lvds_bridge_ops);
+	if (IS_ERR(lvds))
+		return PTR_ERR(lvds);
+
+	lvds->dev = dev;
+	lvds->bridge.of_node = pdev->dev.of_node;
+
+	lvds->regmap = syscon_node_to_regmap(dev->of_node->parent);
+	if (IS_ERR(lvds->regmap))
+		return PTR_ERR(lvds->regmap);
+
+	rstc = devm_reset_control_get_optional_exclusive(dev, "rst");
+	if (IS_ERR(rstc))
+		return dev_err_probe(dev, PTR_ERR(rstc), "failed to get rst\n");
+
+	arstc = devm_reset_control_get_optional_exclusive(dev, "arst");
+	if (IS_ERR(arstc))
+		return dev_err_probe(dev, PTR_ERR(arstc),
+				     "failed to get arst\n");
+
+	lvds->prstc = devm_reset_control_get_shared(dev, "prst");
+	if (IS_ERR(lvds->prstc))
+		return dev_err_probe(dev, PTR_ERR(lvds->prstc),
+				     "failed to get prst\n");
+
+	lvds->lvd_rstc = devm_reset_control_get_shared(dev, "lvdrst");
+	if (IS_ERR(lvds->lvd_rstc))
+		return dev_err_probe(dev, PTR_ERR(lvds->lvd_rstc),
+				     "failed to get core reset\n");
+
+	platform_set_drvdata(pdev, lvds);
+	ret = devm_pm_runtime_enable(dev);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to enable Runtime PM\n");
+
+	lvds->bridge.next_bridge = devm_drm_of_get_bridge(dev, dev->of_node, 1, 0);
+	if (IS_ERR(lvds->bridge.next_bridge))
+		return dev_err_probe(dev, PTR_ERR(lvds->bridge.next_bridge),
+				     "failed to get next bridge\n");
+
+	ret = reset_control_assert(rstc);
+	if (ret < 0)
+		return ret;
+
+	ret = reset_control_assert(arstc);
+	if (ret < 0)
+		return ret;
+
+	ret = devm_drm_bridge_add(dev, &lvds->bridge);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "Failed to register drm bridge\n");
+
+	return ret;
+}
+
+static const struct of_device_id rzg3l_lvds_of_table[] = {
+	{ .compatible = "renesas,r9a08g046-lvds" },
+	{ /* sentinel */ }
+};
+
+MODULE_DEVICE_TABLE(of, rzg3l_lvds_of_table);
+
+static struct platform_driver rzg3l_lvds_platform_driver = {
+	.probe		= rzg3l_lvds_probe,
+	.driver		= {
+		.name	= "rzg3l-lvds",
+		.pm	= pm_ptr(&rzg3l_lvds_pm_ops),
+		.of_match_table = rzg3l_lvds_of_table,
+	},
+};
+
+module_platform_driver(rzg3l_lvds_platform_driver);
+
+MODULE_AUTHOR("Biju Das <biju.das.jz@bp.renesas.com>");
+MODULE_AUTHOR("Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>");
+MODULE_DESCRIPTION("Renesas RZ/G3L LVDS Encoder Driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/gpu/drm/renesas/rz-du/rzg3l_lvds_regs.h b/drivers/gpu/drm/renesas/rz-du/rzg3l_lvds_regs.h
new file mode 100644
index 000000000000..281b7648f168
--- /dev/null
+++ b/drivers/gpu/drm/renesas/rz-du/rzg3l_lvds_regs.h
@@ -0,0 +1,26 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * RZ/G3L LVDS Interface Registers Definitions
+ *
+ * Copyright (C) 2026 Renesas Electronics Corporation
+ *
+ */
+
+#ifndef __RZG3L_LVDS_REGS_H__
+#define __RZG3L_LVDS_REGS_H__
+
+#define LVDS_CMN			0x00
+#define LVDS_CMN_RST_PHY0_SEL		(1 << 24)
+#define LVDS_CMN_RST_PHY0_SEL_CH0	(1 << 24)
+#define LVDS_CMN_PHY_RESET		(1 << 0)
+
+#define LVDS_0_PHY_OFFSET		0x10
+#define LVDS_0_PHY_CH_IO_EN_MSK		(0x1f)
+#define LVDS_0_PHY_CH_IO_EN		(LVDS_0_PHY_CH_IO_EN_MSK << 0)
+#define LVDS_0_PHY_CH_EN_BGR		BIT(8)
+#define LVDS_0_PHY_CH_EN_LDO		BIT(9)
+
+#define LVDS_0_CTL_OFFSET		0x14
+#define LVDS_0_CTL_FMT_SEL_MSK		GENMASK(23, 20)
+
+#endif /* __RZG3L_LVDS_REGS_H__ */
-- 
2.43.0


