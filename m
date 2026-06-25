Return-Path: <linux-renesas-soc+bounces-34426-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id NpxHMzxkPWqn2QgAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34426-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Jun 2026 19:24:12 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 56A326C7C1B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Jun 2026 19:24:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=mw7wZJXJ;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34426-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34426-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6543B3039C64
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Jun 2026 17:24:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9FE73EBF0F;
	Thu, 25 Jun 2026 17:24:09 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6A1C3EBF01
	for <linux-renesas-soc@vger.kernel.org>; Thu, 25 Jun 2026 17:24:07 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782408249; cv=none; b=HsqhwGrFSRdCtI7rJZ1TYdL8hHJj2uYsNQb7+XSxsVKHspnc6RM9oMO4sE9dKqCwupt6R4OVpAKzuJTrp2/oVsJJeUDoImXiHamaXiBNgnN16KTqC+AbvVoNgNW7Jl0iJKYZihMzfpWvDS6CJX8v+so0++IaGYbZcfmFbd0vCJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782408249; c=relaxed/simple;
	bh=KXuCOLv2AAAT7KisVhrLp0H4Q/WNbVEhqErmz2j84nk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C6WlXGeyf6g8kn4Fcut1Kg5JUidYDbos8e8tVXoXolou1k+PRBYlJPkPTZzGkeW7T/kMzWddAeSlzflPXuVtJG0GYp+eCPeU+zB4hHxXV1xi4MYFFEPryJ4cLUe6UDh1ONlePh4bVklsVR4YX0Zd9bMLiJSkQ3dYopxOk24/9J8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mw7wZJXJ; arc=none smtp.client-ip=209.85.128.54
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-490b3637b90so692425e9.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 25 Jun 2026 10:24:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782408246; x=1783013046; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9hMWsPQh1XmsuT2039IFIQmQkOCxOR9DQJTZsp1WFcU=;
        b=mw7wZJXJqHIl2Osh0KwpfDo8HqYwIvGyQ8hMAIqrQS+1GpJF66zH+NUqDF/ptcfKlb
         qgLJ/HjrfYN1E+gZT3kXTSLXya7NEYPY19lFf72tcTe0LnYQzUhSlssq5uGwiRwf/0ZX
         VkqQYtfob1naghGF65/aehox8NIlJ/FpYaRHogAmYPJ4M/wTZBh3TWW0EI4o//RHKGpW
         P/nqDmMTHMQnrBQJK9fZNigTH29SWwkEIWf00K75NIvhpdhbejjyEuI+IG+jK8guDNU/
         Qix7owBt2TIozH0vuyKzw/2itwuqk53vVsMSSvb+DNkFgDTnuXrPv1n1EeTByWyRktNU
         WeuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782408246; x=1783013046;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9hMWsPQh1XmsuT2039IFIQmQkOCxOR9DQJTZsp1WFcU=;
        b=MWFT34iO5XgRhAZX2gJuP7WVMLELNiZd2BN83m1X9O76gPBEP/xUdYWOx612os5cdg
         luEji90lRgPdrxVdpH7FmX3Yw65rK36eV3k9xMFB2O2KMxSufCQh0owkp/ANKvKUzR5a
         g+T2SHnkQ6qC2DTe4en5DybsYewwDInotC4K9v8ieTgHJm1PW5gb5oeXgc2ALDOXJKH5
         Xa1UIhfZP/Pjd0lKEadMRueM0gN7WRGZC4Xbbzt0b8aOoIgZQbX87Wk/0DXUXKjOXq3V
         FPkNHU6kWdrEQzPvgDtq6hQLz3sYvzk3eGRLELOideiEhWrrlw99E7GZ41aYO7Xv/qGD
         lHXA==
X-Forwarded-Encrypted: i=1; AFNElJ+XDcOrIYBOySmRx1qI+1ZY7Zx0ImNFEg2jY/8T48fd4J54k+WA9d1ktsGAz6ptP8eI0SYoPX8rGsfDPh/Jq5oVFg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxGes+Sp3eycrcwcbnEj5rVp4CqxI9SSPKBNZCf1Xo6fpqFsCWh
	brvXOhlmstcWEWWNEFkHjg9Yxo6OKYyoSG0fyVtqF+G7jmFe/GNtGJYw
X-Gm-Gg: AfdE7ckBSWLpckcZRSQl0ra/KHLtWGFJAQFFflthTlyaytU3ZvBKTFgRWOhmgPDGJzC
	ucsCJnyPIJlFNKpgee9hXCWlaeDQZvR2NVHGfTgiN0XOxwSk6ZSQDmgzjfAeSuhcu2HHHWozDIe
	PIrQXxYfUA3GqckRTJ+8YqNZTwqaIIeCfjoQzxTRIvilnpb1+hiq/iNX41W26k34fH4svrxYvMW
	5YVa8zyJgyevtRp6nii5OraAcgF66Eb9r3XJt4Pw4bCZoQHsm9v2gOiln0usxUTeZttPMrzWswZ
	g6WrA43BzzcBx8uuvetIpnWAoBnUXqwU7B+7OU8ygIazMvJu2tenVjYRV9+Zf2o3dc4HP92LB00
	idawlREOOcnBnQc5nrjbGTIoAvkV1FIiOy74PK5/i8pdNwQ8/iyUK4hmHdCyk+55rJoUAHS6csC
	PoJfRZuF6yfbf+v2G0rf7s6/JRq9G1x1kN2cOfLdvdTgUoJ/g=
X-Received: by 2002:a05:600c:8b25:b0:492:40a1:1e16 with SMTP id 5b1f17b1804b1-4926684a70bmr51004945e9.8.1782408246001;
        Thu, 25 Jun 2026 10:24:06 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:6aa7:b2d:3460:b689])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49268fd9e77sm11167265e9.4.2026.06.25.10.24.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 10:24:05 -0700 (PDT)
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
Subject: [PATCH v5 2/2] drm: renesas: rz-du: Add support for RZ/G3L LVDS encoder
Date: Thu, 25 Jun 2026 18:23:49 +0100
Message-ID: <20260625172359.292631-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260625172359.292631-1-biju.das.jz@bp.renesas.com>
References: <20260625172359.292631-1-biju.das.jz@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34426-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,renesas.com:email,bp.renesas.com:mid,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 56A326C7C1B

From: Biju Das <biju.das.jz@bp.renesas.com>

Add support for the RZ/G3L LVDS encoder driver. It operates in single-link
mode with 4 lanes (Data) + 1 lane (Clock) and supports pixel clock rates
from 25 to 87 MHz. The LVDS module cannot be used at the same time as
MIPI-DSI. However, LVDS and the DSI interface share a peripheral clock and
the MIPI_DSI_PRESET_N reset signal. Also, the MIPI_DSI_CMN_RSTB and
MIPI_DSI_ARESET_N reset signals must be asserted before using the LVDS
module.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Tested-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Reviewed-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v4->v5:
 * Added Kconfig functional dependency for DRM_RZG2L_DU
 * Dropped DRM_PANEL from DRM_RZG3L_LVDS config
 * Dropped unused headers of_device.h,of_graph.h and drm_panel.h
 * Dropped the unused macro LVDS_CMN_RST_PHY0_SEL_CH0
 * Used plain number for macro LVDS_0_PHY_CH_IO_EN0_MSK
 * Retained the tag as the above changes are trivial.
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
 drivers/gpu/drm/renesas/rz-du/rzg3l_lvds.c    | 282 ++++++++++++++++++
 .../gpu/drm/renesas/rz-du/rzg3l_lvds_regs.h   |  25 ++
 4 files changed, 321 insertions(+)
 create mode 100644 drivers/gpu/drm/renesas/rz-du/rzg3l_lvds.c
 create mode 100644 drivers/gpu/drm/renesas/rz-du/rzg3l_lvds_regs.h

diff --git a/drivers/gpu/drm/renesas/rz-du/Kconfig b/drivers/gpu/drm/renesas/rz-du/Kconfig
index 7f2ef7137ae5..0dbe86bd65d0 100644
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
+	depends on DRM_RZG2L_DU || COMPILE_TEST
+	default DRM_RZG2L_DU
+	help
+	  Enable support for the RZ/G3L Display Unit embedded LVDS encoder.
+
+config DRM_RZG3L_LVDS
+	def_tristate DRM_RZG2L_DU
+	depends on DRM_RZG3L_USE_LVDS
+	select DRM_KMS_HELPER
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
index 000000000000..d8325de658c1
--- /dev/null
+++ b/drivers/gpu/drm/renesas/rz-du/rzg3l_lvds.c
@@ -0,0 +1,282 @@
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
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+#include <linux/regmap.h>
+#include <linux/reset.h>
+
+#include <drm/drm_atomic.h>
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_bridge.h>
+#include <drm/drm_of.h>
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
index 000000000000..2944f353745d
--- /dev/null
+++ b/drivers/gpu/drm/renesas/rz-du/rzg3l_lvds_regs.h
@@ -0,0 +1,25 @@
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
+#define LVDS_CMN_PHY_RESET		(1 << 0)
+
+#define LVDS_0_PHY_OFFSET		0x10
+#define LVDS_0_PHY_CH_IO_EN0_MSK	0x1f
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


