Return-Path: <linux-renesas-soc+bounces-34236-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id J7wAGbUVNWo0mwYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34236-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 19 Jun 2026 12:11:01 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C21A96A5229
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 19 Jun 2026 12:11:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="HtM/9a6O";
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34236-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34236-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3AD2630031D2
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 19 Jun 2026 10:10:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EFEC370AFB;
	Fri, 19 Jun 2026 10:10:37 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CF9336F8EA
	for <linux-renesas-soc@vger.kernel.org>; Fri, 19 Jun 2026 10:10:32 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781863837; cv=none; b=UtOCnoZ95Wca/f57BghK26DoTqlMRSGA694lXlu6e5EkD11zUq5kykSd+PSaJHhXjxA1GH3/caBvnl779ySHhgwJYoCevX0XAV6qlWfFzRfaZJw6MzIM2OAe6iFdVCkYKWcQSWlPLWgXbIfwcYZZzhPBB/KT3xmbNue9yxsedRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781863837; c=relaxed/simple;
	bh=7HXDu9AQLJ2MXQno8fXwJXGH9TAuNCxBR7X+FyV1XLo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LZDItLuQxqXJ2phyDSsM+AGB2w/LszKIP59ZLQKjZgBbqBHTG5Zxf5gvIZhJcdcaJgDc0VBqJpDLimAjGTr4sIFvtVce1ksoWnMeKx0Um11j0ZlSA/pswIqXrzW7tDic8imuVFx50FN+Tpc2f8xU8i32Iz6Sa5GYf8huktydGVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HtM/9a6O; arc=none smtp.client-ip=209.85.128.47
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-492329c5514so8030695e9.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 19 Jun 2026 03:10:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781863830; x=1782468630; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=taVH6VDsxr0epaBEYBPBztJ59H1NN+zH7RTG3Yoq7WU=;
        b=HtM/9a6OEDvzPvNhAWnrJTVcPT5rn8VolAPT8KBgbwQ9YAuM57Qp8sTX/xm7jIreQb
         9Kx9yLTVhoqGr7da8FYtCkCQWBPz1Ls9KDsf8qbDhebfBNN2f997rUjVniXg0DirAOi8
         cwO9XVJ5y2rKRwzm6DvCvd45KRp0zhGPhUfijQye2lD6oyLkq26En34zVYwbiZiD7I4/
         37Vsfiyfzj3guNxSr3lBlzdI99PRnZcZrMX5LH4WcMOD2qzFM0iL/RBldMy0dGJN0QCz
         oBsV4nYbHr6fPPmTmhFs/jHNKebKGeKrgC66OAJ6W2DQzxy8E76yv+NpMNIWVnFSlH27
         wl1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781863830; x=1782468630;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=taVH6VDsxr0epaBEYBPBztJ59H1NN+zH7RTG3Yoq7WU=;
        b=L9oo3wuoupDVqANH0f7ZmaDLhe7WMV6JlFbz8bSiSYXxI/WiLTYAsWCBRxS/WIk8lf
         Fo+v59POiiKeuQS1L998T2FvebO8g1nz8vupBDNvuZprKlo+sAg/MiKkV1ZLVhF+AYPz
         TyfjYEgvBoSAs7rzor/NQ/9AI1DLc3ePiu44oOIdEkXxGfRciqE+WJDJZ7odinFR/iMT
         lJpMxP/lMtqXirk6N5bNURPy1/HtzIZUD10Jps6i5dY/3V6Cenr+iDzhRzmdu2+DxLwu
         A25SAzncGn+4NZEsy2riVudAY4yskO57dMk3G6Zk1VFgSmzQjfxmEVQiCN9mqNCvPXkA
         GU2g==
X-Forwarded-Encrypted: i=1; AFNElJ8XMOVsSxjsfkWnJoRkR+m5L77xk/lw3/kfc66WDno15x9IGe/sCFZZ0Cwrhbr4+As+Eca+42lgFkmKc9S8hjJYYA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxwCj3XkGfAyqkk/H7vCESxI0gulIGb0bxUJkIEgjLrZEInd4GZ
	PpoyZy0LIxP5n31/i3rOCgHyaniP+FcvNXUmad8GdwCIdNy+YMycEG2b
X-Gm-Gg: AfdE7cmmMjrqh2jzLVJgQGo5YB7xb3YkLqJUk1y8D1SzTGZB305SzIRH71l2U2SkvMC
	9Ds4yEz2n9kYjOCpTvSK5Z4M4HddFiiryLU5cwDnveMyFGhAD3SRk8x3IHodgR+XV/thoCIs5uJ
	b6j3PO6i2sOSOhrQuZVUlL5/Ym+RqhDM/5HX2gRndFyLF6oKOuN37dhdBryR2dCxPkl3a5uEyDa
	qP9LnPsk6DsJ30UOciRfvsB+2f7W7+2ix6G1/rIac2u9SSMeRZGBfq6BC6V8Atwdf/fFSo+jzkJ
	bD32mladDI2ZY64c+XBP2rT0tgbwUqjDru9wUItqMN4myHtgjJ+C8bYdDTFkCQCTJZGjB2+E/0w
	Xm6NQr/lhp2/lqp4SNE7OCX2pRnfx5o707IK5SYccVep9quLQV0sPLSGTctJ7ZRUk6eINNy1sUe
	J5Lufa2/CrWbi0LJ9hrQ==
X-Received: by 2002:a05:600c:4e4f:b0:48f:e230:29f5 with SMTP id 5b1f17b1804b1-49240a486cemr35738875e9.16.1781863830318;
        Fri, 19 Jun 2026 03:10:30 -0700 (PDT)
Received: from biju.lan ([2a00:23c4:a702:d301:435:f63f:6fb:bfa4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4923fcdd08esm34577555e9.0.2026.06.19.03.10.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2026 03:10:30 -0700 (PDT)
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
Subject: [PATCH v4 2/2] drm: renesas: rz-du: Add support for RZ/G3L LVDS encoder
Date: Fri, 19 Jun 2026 11:10:17 +0100
Message-ID: <20260619101026.323633-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260619101026.323633-1-biju.das.jz@bp.renesas.com>
References: <20260619101026.323633-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_TO(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34236-lists,linux-renesas-soc=lfdr.de];
	FORGED_SENDER(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:biju.das.jz@bp.renesas.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:p.zabel@pengutronix.de,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:linux-kernel@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-renesas-soc@vger.kernel.org,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:biju.das.au@gmail.com,m:tommaso.merciai.xr@bp.renesas.com,m:geert@glider.be,m:magnusdamm@gmail.com,m:bijudasau@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[bp.renesas.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,pengutronix.de,glider.be];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,bp.renesas.com,gmail.com];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C21A96A5229

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
v3->v4:
 * Dropped the header files clk.h and syscon.h
 * Dropped next_bridge check in attach().
 * Dropped syscon for getting regmap.
 * Replaced the below macros to match with hardware manual:
	LVDS_0_CTL_FMT_SEL_MSK->LVDS_0_CTL_FMT_SEL0_MSK
	LVDS_0_PHY_CH_IO_EN_MSK->LVDS_0_PHY_CH_IO_EN0_MSK
	Replaced LVDS_0_PHY_CH_IO_EN->LVDS_0_PHY_CH_IO_EN0
 * Replaced atomic_reset()->atomic_create_state()
 * Dropped the tags as there are new changes.
v2->v3:
 * Collected tags.
v2->v2[1]:
 * Replace drm_atomic_state with drm_atomic_commit in
   rzg3l_lvds_atomic_{en,dis}able().
 * Drop local variable ret and dev_err() messages in
   rzg3l_lvds_atomic_enable(); use WARN_ON() instead to
   capture unexpected failures since atomic_enable should not fail.
 * Drop local variable next_bridge from rzg3l_lvds_probe().
[1] https://lore.kernel.org/all/20260524194457.479681-3-biju.das.jz@bp.renesas.com/
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
 drivers/gpu/drm/renesas/rz-du/rzg3l_lvds.c    | 285 ++++++++++++++++++
 .../gpu/drm/renesas/rz-du/rzg3l_lvds_regs.h   |  26 ++
 4 files changed, 325 insertions(+)
 create mode 100644 drivers/gpu/drm/renesas/rz-du/rzg3l_lvds.c
 create mode 100644 drivers/gpu/drm/renesas/rz-du/rzg3l_lvds_regs.h

diff --git a/drivers/gpu/drm/renesas/rz-du/Kconfig b/drivers/gpu/drm/renesas/rz-du/Kconfig
index 7f2ef7137ae5..1e5b3dd1c0de 100644
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
+	  Enable support for the RZ/G3L Display Unit embedded LVDS encoder.
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
index 000000000000..6100888ea728
--- /dev/null
+++ b/drivers/gpu/drm/renesas/rz-du/rzg3l_lvds.c
@@ -0,0 +1,285 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * RZ/G3L LVDS Encoder Driver
+ *
+ * Copyright (C) 2026 Renesas Electronics Corporation
+ */
+
+#include <linux/bitfield.h>
+#include <linux/delay.h>
+#include <linux/io.h>
+#include <linux/media-bus-format.h>
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
+static const struct regmap_config rzg3l_lvds_regmap_config = {
+	.reg_bits = 32,
+	.val_bits = 32,
+	.reg_stride = 4,
+	.max_register = LVDS_0_CTL_OFFSET,
+};
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
+			   LVDS_0_CTL_FMT_SEL0_MSK,
+			   FIELD_PREP(LVDS_0_CTL_FMT_SEL0_MSK, fmt));
+	regmap_update_bits(lvds->regmap, LVDS_0_PHY_OFFSET,
+			   LVDS_0_PHY_CH_IO_EN0_MSK, LVDS_0_PHY_CH_IO_EN0);
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
+			   LVDS_0_PHY_CH_IO_EN0_MSK, 0);
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
+	.atomic_create_state = drm_atomic_helper_bridge_create_state,
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
+	void __iomem *base;
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
+	base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+
+	lvds->regmap = devm_regmap_init_mmio(dev, base, &rzg3l_lvds_regmap_config);
+	if (IS_ERR(lvds->regmap))
+		return dev_err_probe(dev, PTR_ERR(lvds->regmap),
+				     "failed to init regmap\n");
+
+	rstc = devm_reset_control_get_exclusive(dev, "rst");
+	if (IS_ERR(rstc))
+		return dev_err_probe(dev, PTR_ERR(rstc), "failed to get rst\n");
+
+	arstc = devm_reset_control_get_exclusive(dev, "arst");
+	if (IS_ERR(arstc))
+		return dev_err_probe(dev, PTR_ERR(arstc),
+				     "failed to get arst\n");
+
+	lvds->prstc = devm_reset_control_get_exclusive(dev, "prst");
+	if (IS_ERR(lvds->prstc))
+		return dev_err_probe(dev, PTR_ERR(lvds->prstc),
+				     "failed to get prst\n");
+
+	lvds->lvd_rstc = devm_reset_control_get_exclusive(dev, "lvdrst");
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
index 000000000000..3dca3b630818
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
+#define LVDS_0_PHY_CH_IO_EN0_MSK	(0x1f)
+#define LVDS_0_PHY_CH_IO_EN0		(LVDS_0_PHY_CH_IO_EN0_MSK << 0)
+#define LVDS_0_PHY_CH_EN_BGR		BIT(8)
+#define LVDS_0_PHY_CH_EN_LDO		BIT(9)
+
+#define LVDS_0_CTL_OFFSET		0x14
+#define LVDS_0_CTL_FMT_SEL0_MSK		GENMASK(23, 20)
+
+#endif /* __RZG3L_LVDS_REGS_H__ */
-- 
2.43.0


