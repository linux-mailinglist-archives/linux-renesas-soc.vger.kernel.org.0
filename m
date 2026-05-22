Return-Path: <linux-renesas-soc+bounces-32988-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SA9jDpxWEGraWQYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32988-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 15:14:04 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id D82B75B4E82
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 15:14:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2EE1F306A917
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 12:51:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B84F9385D6F;
	Fri, 22 May 2026 12:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tz1NFSk7"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86BBC37B3F1
	for <linux-renesas-soc@vger.kernel.org>; Fri, 22 May 2026 12:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779454295; cv=none; b=l0iwNyB6qgmDW17wYV6AH5HgEei+uxcq9zT5uzBvXIyI/RiiXOMbb/T44lOupiGBq1dr2xXbgMq3E3etdpFCBGt18X7dwCoGD2End0VmlDmtjDzOlVR1HZe/aj23KO0qxaZWCK5tm2pLE1YT+PKa/ayfqCwCbhhrEbXD4Y10btk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779454295; c=relaxed/simple;
	bh=JRWiSNcCWz74tZ5lNWf4fzktoaOO5yUe7eH/qQ0N/iM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JniV/NTc2UpUrrpNuqXrHb+Juc9MHssJuYwycS6KUU9dZW4I1kcSN/mAKuewPsiJI8PS50CfOs/o2Jd7nW9XFXIKNrrmfMrqil3vqW5r48P4VMKOA78xZITrdOaxVIhQM7Kwc0ngKcAOIm7U7vNx4tZQDTpiVh7YB7AqUoJYscA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tz1NFSk7; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-48a3e9862f0so40872255e9.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 22 May 2026 05:51:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779454292; x=1780059092; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t/Gj4xx8JXNPuQDfjNH9kbCKJVapsqs4nXJWFIlUE58=;
        b=tz1NFSk7oBIwm1NOExeaPTrWxzwsvffiKOolaoQHXR2YS5/R73i7EDDkAhkLTR1Tv0
         ddxwmnOsjx2dm9I5IdZJ8CpxcrACYGo3v2XsZTU6qIWRht2JIpYtoMHs3DqrmApOvFxP
         dctsf/MDyQVji343+MzlmPxOKbncp9bTdy9ltBkKz1aOurIPOFw7XJwPTjtudn1ZU3fd
         R6ksdd9SVbj7q6A52NE7dD0mUG6suN0BOgVgqw3L4TQv2rZunT1Cdxlmgd9f1jEIhpZw
         Ts1TievoCyeTyzmDX6h6tSoxjVtLYmkJyDc5B7LICYztt1EOgMgEVk6b7ebKy8SFzdUA
         LSqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779454292; x=1780059092;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=t/Gj4xx8JXNPuQDfjNH9kbCKJVapsqs4nXJWFIlUE58=;
        b=GQP9mzXgEFRZxovK09P79jbL/1pGXjCuaxKdfd5zMso9+Erts2zVcX/RGYeonZlmFE
         XOrjQuGvQaxDbRWKeXlBcPPThhTbRLFz1KAyiF5y8r3n1pvOqQPa0RgmWtkBvdPLROSy
         32QkvIYHpN7bcv4nlbBGAVhcu+5WHbiWFsv+uW+hhgidgzpXY6BlKI/ArnVcgpwz/nvc
         tLhdI7Sivn8IuePeIm0q5AY+5XzheKq1vjKnkSczz01AwvDKCeBDjiOK1KmCZm5m1LoF
         6f260b0M1ayiCN/QPdPYdOSMXUNFUBm8izNNlMRUhrNICr9v8H/FAFMj4XzX4iYK7eqr
         de5w==
X-Forwarded-Encrypted: i=1; AFNElJ8ezzost5mMOcB0c4RLQOKBpLeDMrxZYNGnmKqLSgmf7nb9KHInAKK61/+c24g2bqf7hVO8UrQN8Ag9/52gd1jEIg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzvg9cL8jD1TEiqw0p3jfANCD18JArxZY6LT97WnSMdls+/ugsm
	/oG6uboXgictoDPG/aND3MDiJA2AWVXctqoVzQ1acLZquRHk/9yh5lLaRLUdpxnKEvg=
X-Gm-Gg: Acq92OH0OCcuKOQQQ0MFIl0wjFoot/1KnFIz06zYSvTWbVmyprKlT/b/FHiMLlKjK8S
	cpi2i7M3i47tMhW3WactXeCjdjjdeiQ5LOTbtKJ2C2fgftykiCdCU7lQlasDy6xou1vuXXnyhUe
	B5k2fjt62QUUFUzu+oERmKJGd9+EbDyGFOtrf9HSqOxQOdPiGfEP2o7tk+E7yYdfZfRZnd973fs
	7Rx7KF1RQL9Z6nrWGWFsCqmkN3Q5XuLKLR13mI/ELmSbC9kwrzHuPj1uKGX1AGkzBxl3sU2jd9O
	CkcLVcXYSBe1tuglwyENmqqGAdVL0JxtwyUZEBgBMbaMJIHkIiTm46uDqn0Y6TfnfqlR2dWjDyE
	5e+QSsQib8eU0pz+wsOqgWqzIysqh5NjFtncON/dObEUGOIlqdbxIfBaUVzJ7Jf3vJ4GczZp0gA
	JV1zwBNq7JxonlfmujtT+mwkuzg8fDQ9PwcRSoJ8wJIJSE
X-Received: by 2002:a05:600c:1497:b0:490:3cf0:8d81 with SMTP id 5b1f17b1804b1-490424ad286mr24550375e9.13.1779454291868;
        Fri, 22 May 2026 05:51:31 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49042af0ac1sm15046735e9.31.2026.05.22.05.51.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 05:51:31 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 22 May 2026 14:51:25 +0200
Subject: [PATCH v6 2/2] drm: panel: add support for the Renesas R63419
 based dual-DSI video mode Display Panels
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260522-topic-sm8650-ayaneo-pocket-s2-r63419-v6-2-16edddda9951@linaro.org>
References: <20260522-topic-sm8650-ayaneo-pocket-s2-r63419-v6-0-16edddda9951@linaro.org>
In-Reply-To: <20260522-topic-sm8650-ayaneo-pocket-s2-r63419-v6-0-16edddda9951@linaro.org>
To: Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 KancyJoe <kancy2333@outlook.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=13507;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=QPQR4xBZOTZlZK4dEPUXsVBJg3o7CPdcfWBb0RyDDg8=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqEFFPDNRYWCpeDHTGt3HltfMYhwqpqjr7KxN9v6+x
 Mk43vZiJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCahBRTwAKCRB33NvayMhJ0b8SD/
 9pR2RaKlcLnU3ZR46PXWrRD1j9WbYxtrcdJbiMbctM6w6RSJHotUtS+olNdQIkX/6ey7yUWccakL5b
 BidI8nYr9z15XpEwg6nIEsY5jTtgwnamiNL/EY+y/Bf0+1ZHJWhWcNbCoFaYFtiH+SqOvyCvMCfNCA
 P7Dh5Y5hHgYWjHoNawhXnbG/d62OF3E0z52FlhcT2PeF8MgStA/zEe26uvt6bRraN/JQTd55xkbRxB
 iGSc90Y6RzkF7nYKa0sww9n2Nl9T7EQjP/5/B0Z3bI+m/KwplcWXgKoaTHn9QGpK+qyTg4Teek8/Hh
 2JjjLF2tX6Pg7jrDzX0bI2CpnJyEiyUKSlnlNg4y2oD6GfGoF7seoggP1FQ5yMmNuTqXO5n8lqRzJd
 kvO/zc1UM56DzpXVCdzzYdSWRlAt/t++qZphBoV2eSq8o9Qtop6j2JvtnlQSmwrALawlN5qwqZZkUD
 OTU/lL07ZIQC0FWKH86FmsA7oOycMPC1ZurRwIeCjfzgkr2oSlZn1VZzROYLoo5Di2KKChyWlj7+Fk
 ezIToTQJ6d79wgZS2ch+oO2tkKhS5cwPcEtj096/ZWDLJjGtGPh2tP32OKxMjDJjPzIqRiOUPwAQ5F
 cpB4XMoP2pzuM3qlBSknqOkgKBqc6eCcZ820sbwoLMvm1qpyDUEsp0QNwy+w==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,oss.qualcomm.com,linaro.org,outlook.com];
	TAGGED_FROM(0.00)[bounces-32988-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,linux.intel.com,kernel.org,suse.de,ffwll.ch,glider.be];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCPT_COUNT_TWELVE(0.00)[18];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: D82B75B4E82
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: KancyJoe <kancy2333@outlook.com>

Implement support for the Renesas 63419 based dual-DSI video mode
Display Panels found in the Ayaneo gaming handled devices.

Signed-off-by: KancyJoe <kancy2333@outlook.com>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/gpu/drm/panel/Kconfig                |  12 +
 drivers/gpu/drm/panel/Makefile               |   1 +
 drivers/gpu/drm/panel/panel-renesas-r63419.c | 364 +++++++++++++++++++++++++++
 3 files changed, 377 insertions(+)

diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index 7450b27622a2..7295246cfa58 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -796,6 +796,18 @@ config DRM_PANEL_RENESAS_R61307
 	  This panel controller can be found in LG Optimus Vu P895 smartphone
 	  in combination with LCD panel.
 
+config DRM_PANEL_RENESAS_R63419
+	tristate "Renesas R63419 dual-DSI video mode panels"
+	depends on OF && GPIOLIB
+	depends on DRM_MIPI_DSI
+	depends on BACKLIGHT_CLASS_DEVICE
+	help
+	  Say Y here if you want to enable support for Ayaneo WT0600 and WT0630
+	  1440x2560 60Hz dual-DSI video mode display panels with Renesas
+	  R63419 IC.
+
+	  These panels are used in Ayaneo handheld gaming devices.
+
 config DRM_PANEL_RENESAS_R69328
 	tristate "Renesas R69328 720x1280 DSI video mode panel"
 	depends on OF
diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
index c2c5cf817116..be9a6f3c9743 100644
--- a/drivers/gpu/drm/panel/Makefile
+++ b/drivers/gpu/drm/panel/Makefile
@@ -78,6 +78,7 @@ obj-$(CONFIG_DRM_PANEL_RAYDIUM_RM68200) += panel-raydium-rm68200.o
 obj-$(CONFIG_DRM_PANEL_RAYDIUM_RM692E5) += panel-raydium-rm692e5.o
 obj-$(CONFIG_DRM_PANEL_RAYDIUM_RM69380) += panel-raydium-rm69380.o
 obj-$(CONFIG_DRM_PANEL_RENESAS_R61307) += panel-renesas-r61307.o
+obj-$(CONFIG_DRM_PANEL_RENESAS_R63419) += panel-renesas-r63419.o
 obj-$(CONFIG_DRM_PANEL_RENESAS_R69328) += panel-renesas-r69328.o
 obj-$(CONFIG_DRM_PANEL_RONBO_RB070D30) += panel-ronbo-rb070d30.o
 obj-$(CONFIG_DRM_PANEL_SAMSUNG_AMS581VF01) += panel-samsung-ams581vf01.o
diff --git a/drivers/gpu/drm/panel/panel-renesas-r63419.c b/drivers/gpu/drm/panel/panel-renesas-r63419.c
new file mode 100644
index 000000000000..dba156f8427c
--- /dev/null
+++ b/drivers/gpu/drm/panel/panel-renesas-r63419.c
@@ -0,0 +1,364 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * DRM driver for Renesas R63419 based dual-DSI video mode panels
+ *
+ * Copyright (c) 2025, Kancy Joe <kancy2333@outlook.com>
+ * Copyright (C) 2026 Linaro Limited
+ * Author: Neil Armstrong <neil.armstrong@linaro.org>
+ */
+
+#include <linux/backlight.h>
+#include <linux/delay.h>
+#include <linux/gpio/consumer.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_graph.h>
+#include <linux/regulator/consumer.h>
+
+#include <video/mipi_display.h>
+
+#include <drm/drm_connector.h>
+#include <drm/drm_mipi_dsi.h>
+#include <drm/drm_modes.h>
+#include <drm/drm_panel.h>
+#include <drm/drm_probe_helper.h>
+
+struct renesas_r63419_panel {
+	struct drm_panel panel;
+	struct mipi_dsi_device *dsi[2];
+	const struct panel_desc *desc;
+
+	struct gpio_desc *reset_gpio;
+	struct regulator_bulk_data *vdd_supplies;
+	struct regulator_bulk_data *vcc_supplies;
+	enum drm_panel_orientation orientation;
+};
+
+/* VDDIO/VDD Supplies */
+static const struct regulator_bulk_data renesas_r63419_vdd_supplies[] = {
+	{ .supply = "vddio" },
+	{ .supply = "vdd" },
+};
+
+/* VSP/VSN/VCI Supplies */
+static const struct regulator_bulk_data renesas_r63419_vcc_supplies[] = {
+	{ .supply = "vsp" },
+	{ .supply = "vsn" },
+	{ .supply = "vci" },
+};
+
+struct panel_desc {
+	const struct drm_display_mode *mode;
+	unsigned int lanes;
+	unsigned long mode_flags;
+	enum mipi_dsi_pixel_format format;
+	const struct mipi_dsi_device_info dsi_info;
+};
+
+static const struct drm_display_mode wt0600_mode = {
+	/* Dual dsi */
+	.clock = 2 * (720 + 100 + 8 + 40) * (2560 + 15 + 2 + 8) * 60 / 1000,
+	.hdisplay = 2 * 720,
+	.hsync_start = 2 * (720 + 100),
+	.hsync_end = 2 * (720 + 100 + 8),
+	.htotal = 2 * (720 + 100 + 8 + 40),
+	.vdisplay = 2560,
+	.vsync_start = 2560 + 15,
+	.vsync_end = 2560 + 15 + 2,
+	.vtotal = 2560 + 15 + 2 + 8,
+	.type = DRM_MODE_TYPE_DRIVER,
+	.width_mm = 74,
+	.height_mm = 131,
+};
+
+static const struct drm_display_mode wt0630_mode = {
+	/* Dual dsi */
+	.clock = 2 * (720 + 100 + 8 + 40) * (2560 + 15 + 2 + 8) * 60 / 1000,
+	.hdisplay = 2 * 720,
+	.hsync_start = 2 * (720 + 100),
+	.hsync_end = 2 * (720 + 100 + 8),
+	.htotal = 2 * (720 + 100 + 8 + 40),
+	.vdisplay = 2560,
+	.vsync_start = 2560 + 15,
+	.vsync_end = 2560 + 15 + 2,
+	.vtotal = 2560 + 15 + 2 + 8,
+	.type = DRM_MODE_TYPE_DRIVER,
+	.width_mm = 78,
+	.height_mm = 140,
+};
+
+static struct panel_desc wt0600_desc = {
+	.lanes = 4,
+	.mode = &wt0600_mode,
+	.mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
+		      MIPI_DSI_CLOCK_NON_CONTINUOUS | MIPI_DSI_MODE_LPM,
+	.format = MIPI_DSI_FMT_RGB888,
+};
+
+static struct panel_desc wt0630_desc = {
+	.lanes = 4,
+	.mode = &wt0630_mode,  /* wt0600 only has different screen size */
+	.mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
+		      MIPI_DSI_CLOCK_NON_CONTINUOUS | MIPI_DSI_MODE_LPM,
+	.format = MIPI_DSI_FMT_RGB888,
+};
+
+static inline struct renesas_r63419_panel *
+to_renesas_r63419_panel(struct drm_panel *panel)
+{
+	return container_of(panel, struct renesas_r63419_panel, panel);
+}
+
+/*
+ * Helper to switch between DSI links, so we share a single dsi_ctx
+ * for both links, so in case of an error all writes & sleep for
+ * both links are ignored.
+ */
+static inline void dsi_link_switch(struct renesas_r63419_panel *ctx,
+				   struct mipi_dsi_multi_context *dsi_ctx,
+				   unsigned int link)
+{
+	dsi_ctx->dsi = ctx->dsi[link];
+}
+
+static int renesas_r63419_on(struct renesas_r63419_panel *ctx)
+{
+	struct mipi_dsi_multi_context dsi_ctx = { 0 };
+
+	dsi_link_switch(ctx, &dsi_ctx, 0);
+	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
+	dsi_link_switch(ctx, &dsi_ctx, 1);
+	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
+	mipi_dsi_msleep(&dsi_ctx, 150);
+
+	dsi_link_switch(ctx, &dsi_ctx, 0);
+	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
+	dsi_link_switch(ctx, &dsi_ctx, 1);
+	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
+	mipi_dsi_msleep(&dsi_ctx, 50);
+
+	return dsi_ctx.accum_err;
+}
+
+static int renesas_r63419_disable(struct drm_panel *panel)
+{
+	struct renesas_r63419_panel *ctx = to_renesas_r63419_panel(panel);
+	struct mipi_dsi_multi_context dsi_ctx = { 0 };
+
+	dsi_link_switch(ctx, &dsi_ctx, 0);
+	mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
+	dsi_link_switch(ctx, &dsi_ctx, 1);
+	mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
+	mipi_dsi_msleep(&dsi_ctx, 50);
+
+	dsi_link_switch(ctx, &dsi_ctx, 0);
+	mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
+	dsi_link_switch(ctx, &dsi_ctx, 1);
+	mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
+	mipi_dsi_msleep(&dsi_ctx, 120);
+
+	return dsi_ctx.accum_err;
+}
+
+static int renesas_r63419_prepare(struct drm_panel *panel)
+{
+	struct renesas_r63419_panel *ctx = to_renesas_r63419_panel(panel);
+	int ret;
+
+	ret = regulator_bulk_enable(ARRAY_SIZE(renesas_r63419_vdd_supplies),
+				    ctx->vdd_supplies);
+	if (ret < 0)
+		return ret;
+
+	usleep_range(1000, 2000);
+
+	ret = regulator_bulk_enable(ARRAY_SIZE(renesas_r63419_vcc_supplies),
+				    ctx->vcc_supplies);
+	if (ret < 0) {
+		regulator_bulk_disable(ARRAY_SIZE(renesas_r63419_vdd_supplies),
+				       ctx->vdd_supplies);
+		return ret;
+	}
+
+	usleep_range(1000, 2000);
+
+	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
+
+	usleep_range(3000, 4000);
+
+	ret = renesas_r63419_on(ctx);
+	if (ret < 0) {
+		dev_err(panel->dev, "Failed to initialize panel: %d\n", ret);
+
+		/* Power off sequence from the r63419 datasheet */
+		regulator_bulk_disable(ARRAY_SIZE(renesas_r63419_vcc_supplies),
+				       ctx->vcc_supplies);
+		regulator_bulk_disable(ARRAY_SIZE(renesas_r63419_vdd_supplies),
+				       ctx->vdd_supplies);
+
+		gpiod_set_value_cansleep(ctx->reset_gpio, 1);
+
+		return ret;
+	}
+
+	return 0;
+}
+
+static int renesas_r63419_unprepare(struct drm_panel *panel)
+{
+	struct renesas_r63419_panel *ctx = to_renesas_r63419_panel(panel);
+
+	/* Power off sequence from the r63419 datasheet */
+	regulator_bulk_disable(ARRAY_SIZE(renesas_r63419_vcc_supplies), ctx->vcc_supplies);
+	regulator_bulk_disable(ARRAY_SIZE(renesas_r63419_vdd_supplies), ctx->vdd_supplies);
+
+	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
+
+	return 0;
+}
+
+static int renesas_r63419_get_modes(struct drm_panel *panel,
+				    struct drm_connector *connector)
+{
+	struct renesas_r63419_panel *ctx = to_renesas_r63419_panel(panel);
+	const struct drm_display_mode *mode = ctx->desc->mode;
+
+	drm_connector_set_panel_orientation(connector, ctx->orientation);
+
+	return drm_connector_helper_get_modes_fixed(connector, mode);
+}
+
+static enum drm_panel_orientation
+renesas_r63419_get_orientation(struct drm_panel *panel)
+{
+	struct renesas_r63419_panel *ctx = to_renesas_r63419_panel(panel);
+
+	return ctx->orientation;
+}
+
+static const struct drm_panel_funcs renesas_r63419_panel_funcs = {
+	.disable = renesas_r63419_disable,
+	.prepare = renesas_r63419_prepare,
+	.unprepare = renesas_r63419_unprepare,
+	.get_modes = renesas_r63419_get_modes,
+	.get_orientation = renesas_r63419_get_orientation,
+};
+
+static int renesas_r63419_probe(struct mipi_dsi_device *dsi)
+{
+	struct mipi_dsi_device_info info = { };
+	struct device *dev = &dsi->dev;
+	struct renesas_r63419_panel *ctx;
+	struct device_node *dsi1_node;
+	struct mipi_dsi_host *dsi1_host;
+	int ret, i;
+
+	ctx = devm_drm_panel_alloc(dev, struct renesas_r63419_panel, panel,
+				   &renesas_r63419_panel_funcs, DRM_MODE_CONNECTOR_DSI);
+	if (IS_ERR(ctx))
+		return PTR_ERR(ctx);
+
+	ctx->desc = of_device_get_match_data(dev);
+	if (!ctx->desc)
+		return dev_err_probe(dev, -ENODEV,
+				     "Failed to get panel description\n");
+
+	ret = devm_regulator_bulk_get_const(&dsi->dev,
+					    ARRAY_SIZE(renesas_r63419_vdd_supplies),
+					    renesas_r63419_vdd_supplies, &ctx->vdd_supplies);
+	if (ret < 0)
+		return ret;
+
+	ret = devm_regulator_bulk_get_const(&dsi->dev,
+					    ARRAY_SIZE(renesas_r63419_vcc_supplies),
+					    renesas_r63419_vcc_supplies, &ctx->vcc_supplies);
+	if (ret < 0)
+		return ret;
+
+	ctx->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
+	if (IS_ERR(ctx->reset_gpio))
+		return dev_err_probe(dev, PTR_ERR(ctx->reset_gpio),
+				     "Failed to get reset gpio\n");
+
+	/* Get second DSI host */
+	dsi1_node = of_graph_get_remote_node(dsi->dev.of_node, 1, -1);
+	if (!dsi1_node)
+		return dev_err_probe(dev, -ENODEV,
+				     "Failed to get remote node for second DSI\n");
+
+	dsi1_host = of_find_mipi_dsi_host_by_node(dsi1_node);
+	of_node_put(dsi1_node);
+	if (!dsi1_host)
+		return dev_err_probe(dev, -EPROBE_DEFER,
+				     "Failed to find second DSI host\n");
+
+	/* Copy current DSI info, do not provide OF node since no driver needs to be attached */
+	strscpy(info.type, dsi->name, sizeof(info.type));
+	info.channel = dsi->channel;
+
+	/* Register the second DSI device */
+	ctx->dsi[1] = devm_mipi_dsi_device_register_full(dev, dsi1_host, &info);
+	if (IS_ERR(ctx->dsi[1]))
+		return dev_err_probe(dev, PTR_ERR(ctx->dsi[1]),
+				     "Failed to register second DSI device\n");
+
+	ctx->dsi[0] = dsi;
+	mipi_dsi_set_drvdata(dsi, ctx);
+
+	/* Get panel orientation */
+	ret = of_drm_get_panel_orientation(dev->of_node, &ctx->orientation);
+	if (ret < 0 && ret != -ENODEV)
+		return dev_err_probe(dev, ret,
+				     "Failed to get panel orientation\n");
+
+	ctx->panel.prepare_prev_first = true;
+
+	ret = drm_panel_of_backlight(&ctx->panel);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to get backlight\n");
+
+	ret = devm_drm_panel_add(dev, &ctx->panel);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to add panel\n");
+
+	/* Configure and attach both DSI devices */
+	for (i = 0; i < ARRAY_SIZE(ctx->dsi); i++) {
+		ctx->dsi[i]->lanes = ctx->desc->lanes;
+		ctx->dsi[i]->format = ctx->desc->format;
+		ctx->dsi[i]->mode_flags = ctx->desc->mode_flags;
+
+		ret = devm_mipi_dsi_attach(dev, ctx->dsi[i]);
+		if (ret < 0)
+			return dev_err_probe(dev, ret,
+					     "Failed to attach DSI device %d\n", i);
+	}
+
+	return 0;
+}
+
+static const struct of_device_id renesas_r63419_of_match[] = {
+	{
+		.compatible = "ayaneo,wt0600-2k",
+		.data = &wt0600_desc,
+	},
+	{
+		.compatible = "ayaneo,wt0630-2k",
+		.data = &wt0630_desc,
+	},
+	{}
+};
+MODULE_DEVICE_TABLE(of, renesas_r63419_of_match);
+
+static struct mipi_dsi_driver renesas_r63419_driver = {
+	.probe = renesas_r63419_probe,
+	.driver = {
+		.name = "panel-renesas-r63419",
+		.of_match_table = renesas_r63419_of_match,
+	},
+};
+module_mipi_dsi_driver(renesas_r63419_driver);
+
+MODULE_AUTHOR("Kancy Joe <kancy2333@outlook.com>");
+MODULE_AUTHOR("Neil Armstrong <neil.armstrong@linaro.org>");
+MODULE_DESCRIPTION("DRM driver for Renesas R63419 based dual-DSI video mode panels");
+MODULE_LICENSE("GPL");

-- 
2.34.1


