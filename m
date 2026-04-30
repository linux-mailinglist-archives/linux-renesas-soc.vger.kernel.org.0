Return-Path: <linux-renesas-soc+bounces-31823-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 56zgC41J82ngzAEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31823-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Apr 2026 14:22:37 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EC7494A2B6A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Apr 2026 14:22:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 85EC03005A8B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Apr 2026 12:22:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2CCC406264;
	Thu, 30 Apr 2026 12:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lCLHD/de"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAA063FE358
	for <linux-renesas-soc@vger.kernel.org>; Thu, 30 Apr 2026 12:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777551747; cv=none; b=h1V8dtRVQFbyVOWAqu1tKuu0CzieWqOhQsbEFE9bKN+scY6C6MyTDXwEvlszuT0qLBeLHxU0nCXsPTzop3SS5S81z67m8JtJk2gKKEPa3JtM/xQTegk89zjZ9gfUNSUDVoXBddfcHV5h77b9AU9X2K3XUpJHEkcFtZhD0mHhPLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777551747; c=relaxed/simple;
	bh=QwLk3Rt5xXaoZ6skQucP5sBlR6hQ6tO5Cq9c1hdGbv0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YKfwsRvsWntfZ87nD8UiC7Wg1bphtv9G0VxuooYSkJ7S/jvG8gmB2Pf/2Slt4th7F935vIg6ZQIB+YP5VIBlQdXpUrlrlyZJrbFzjII9+NTVjYjrdo3sKfkM/TVPGIMo2IWTSKJTd2tW/9sFC9kx7+azrMhqWMDnV9zUI5I7eLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lCLHD/de; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-448528f4e69so552653f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 30 Apr 2026 05:22:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777551744; x=1778156544; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FudvciPbQh66CQVlQx9qR0a4iS/GQ4J8s0VZ/c5V0Ws=;
        b=lCLHD/deNMpAl/VxUlmozZdX0+FxS2I+DYHTblEjW/ziW5NHzfiWLljJBV9olRrt5M
         3IGa3yugNNazT+KrQFfwma62b2kYpOIrgpdxmMhlo5TJx9DL2wcsKtQOLiStRaXKLotF
         ZhPe5OjMDeZdO8ei29Mayqkme1ko9n6pxd0g9zfh61q1ispWzGH3Dr9S3zgy6PKbURST
         gRH6rFOu6cEcY9CwK/WrJNM7gSeyQG7Ghv2Mp013DUxR8PZtGCL9eHJOVrUXxbBprnnJ
         4TqHUW6hqo5Jjqg9gl1ySVg2ILwIlTNqxGG5J51xD20Tochi4FgP7TYzkwO67kk1D0JE
         lCUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777551744; x=1778156544;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FudvciPbQh66CQVlQx9qR0a4iS/GQ4J8s0VZ/c5V0Ws=;
        b=s1IGRgBEmAp6iDpgpp8mMlz5StOrCqvT6A1SPwddjv8ZM95mNHdQrV+uIIURN/+fNd
         iCC6RRmuMv9ENIf4pNuXqvyJewKhnifbUMVyns8ogyJoZlps6EeN2UuRIti5ckbyXPgt
         ZfSJwS2iAWS+8OSkWpVFKeqN3S8uyJuWjaPTrLQrHopc91pq5mOO3IQ+vVlGU0NmEjQe
         O1rXe9j5U0hOMEM3cnY1yl5LRlC4S8unKZIMXYrmwjbyQFiN0/BN9d3YfdKxU+FV9wdR
         cBq/Dur1KedU4cIwhRB+tTnv3nWeB4syQJ9u2JBsBPrkrcgNCv2iCEPJDJMF83t4AXqT
         IR5w==
X-Forwarded-Encrypted: i=1; AFNElJ8xvFkXjaId9ng+645YGC5IpxPzTmKZ9a5A4zC4eyu4HWQb3DyhglgIkdE+KZZhtItnbM+UIdhtrvnGJhRqsDBAgg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxdS6psjsIG4hmCsuDKflConCun0Fq1rFXAoWh7w2J8C7wlrV7Q
	YJSEyy4OmKhi76PU2EjeKqk54xSMPGXqeJXWo2Lg8s569ywKnm8BF9bH/ZZ3MXNCOPc=
X-Gm-Gg: AeBDiev8C+MZhCQO4jU2HjWlNeND9a+dlZ8HbgS4zeUhX6Xc1fL+IkoiFIsLEg/mqDU
	hEuOJteWOKw3NiydhIdYgWUcgVYWp9iqBLMgaULw4Ia6KApPKKLmnV9e0j7AWd0ZQsV01ucAn6O
	dgpPsZwzUKAJ+PJkpQN1H7fx32BOOEqBKI4fWEQBus1Ky+EUU2vdN5AfweBycNQXp1afgqNX88l
	Ctj5LUOI39jgzCVADpuab0VVTTgPUTSrMOqnBfP2g3lNJqmDLwsptUsgRcqeBigYJJ/CqCoXLo0
	daxHe3cXd7j9Zt1fig6XQn93dAfT9iqAr+K5Uo6sbuAf6Y5cfXAo3COX1ykPXSg8hq/jm1EJlSB
	Sft5kvYN0vxQf3KG7SEiDHYR3pnnCMtjfG1jLCglUZt2OTzeukqkiHPF4w4YMi6goFWG18EnyEI
	ZxxjbW80JIxqNUxtZjwUBJke8+ThQnVBtVNjBq61yITKVTFYWFQ/9b66c=
X-Received: by 2002:adf:e690:0:b0:449:6a23:dd1f with SMTP id ffacd0b85a97d-4496a23dd94mr2438129f8f.15.1777551743956;
        Thu, 30 Apr 2026 05:22:23 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-447b76e5afesm11163639f8f.30.2026.04.30.05.22.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 05:22:23 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 30 Apr 2026 14:22:18 +0200
Subject: [PATCH v2 2/2] drm: panel: add support for the Renesas R63419
 based dual-DSI video mode Display Panels
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260430-topic-sm8650-ayaneo-pocket-s2-r63419-v2-2-91ac10453d0c@linaro.org>
References: <20260430-topic-sm8650-ayaneo-pocket-s2-r63419-v2-0-91ac10453d0c@linaro.org>
In-Reply-To: <20260430-topic-sm8650-ayaneo-pocket-s2-r63419-v2-0-91ac10453d0c@linaro.org>
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
 Neil Armstrong <neil.armstrong@linaro.org>, 
 KancyJoe <kancy2333@outlook.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=12821;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=Lg2heIFXpUjxNVvz0DHXOITtCdWX7bdwih4yMCzmWj0=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBp80l7SFmt+RvkimM6ezEDWHUYwny3eezSOM1Hhunk
 f2qI/l6JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCafNJewAKCRB33NvayMhJ0XcXD/
 wMwIzsqnqVi0JPynkmFHldlE8ERo7Y4jMM+JLmT9CQZk9bLR7np1/6KZapYAJmK9dSoQ9VSDYL1kAY
 HxBD8BW3DT7hRfsATDvfyopmdsyQ6FlT6Flhl6US2wQIvbpLmlY5ockzxOuD4+nkpeZmcKIa4/TFEG
 ekA0l4ZF3QOJFF4G0Rzgz/kQhMk7fzBs8pPH3Cqi0Hkp8F9FgFFMU1kr45/gRvewtXGZFIbxsn2laH
 IfCv/FQJmS529TlQSUJxDyvEKweMaH14TPHAKPz7zdb6mNbK51n9SJgfxJTd+hpNIaS5tO35CiiZu0
 quQCs2S/yD3iGfH0w7I1d+ayHNuazGmf1bnYGf9nQq3AA4RJAKF2uoFQ6B4Xm3GcZYQl6m7zFRnSsa
 Oma9yV/rjDBkXzOlQnFGBlAFhZJeBNKPoAdk00h5NVydJPdsdSe+nNjlK1TZixFC9E8yjK7WsV6LEc
 ObrmrSWia4A9X8I08+piCO+lV5eyqkGqg871UkFHsQ+hVMR+rhwTcPkaDKncgJjVw2vxYA3s9H6osy
 FkVtVZCVa14OkfM6BMUftkxV4d6bmldVi0LBhr3Jvjme3KEP6Mxe1sccaWF7nWjE91batvHKL9P/jS
 h+RCy+qJn3g3maTd23P+r0QDZw3lVHLoPBpdUoszTVphHa9ywEUSH4djaxSg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Rspamd-Queue-Id: EC7494A2B6A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31823-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,linux.intel.com,kernel.org,suse.de,ffwll.ch,glider.be];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,linaro.org,outlook.com];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,linaro.org:dkim,linaro.org:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,outlook.com:email]

From: KancyJoe <kancy2333@outlook.com>

Implement support for the Renesas 63419 based dual-DSI video mode
Display Panels found in the Ayaneo gaming handled devices.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: KancyJoe <kancy2333@outlook.com>
---
 drivers/gpu/drm/panel/Kconfig                |  12 +
 drivers/gpu/drm/panel/Makefile               |   1 +
 drivers/gpu/drm/panel/panel-renesas-r63419.c | 356 +++++++++++++++++++++++++++
 3 files changed, 369 insertions(+)

diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index d6863b28ddc5..5404d918677f 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -755,6 +755,18 @@ config DRM_PANEL_RENESAS_R61307
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
index a4291dc3905b..b498ee9b5929 100644
--- a/drivers/gpu/drm/panel/Makefile
+++ b/drivers/gpu/drm/panel/Makefile
@@ -75,6 +75,7 @@ obj-$(CONFIG_DRM_PANEL_RAYDIUM_RM68200) += panel-raydium-rm68200.o
 obj-$(CONFIG_DRM_PANEL_RAYDIUM_RM692E5) += panel-raydium-rm692e5.o
 obj-$(CONFIG_DRM_PANEL_RAYDIUM_RM69380) += panel-raydium-rm69380.o
 obj-$(CONFIG_DRM_PANEL_RENESAS_R61307) += panel-renesas-r61307.o
+obj-$(CONFIG_DRM_PANEL_RENESAS_R63419) += panel-renesas-r63419.o
 obj-$(CONFIG_DRM_PANEL_RENESAS_R69328) += panel-renesas-r69328.o
 obj-$(CONFIG_DRM_PANEL_RONBO_RB070D30) += panel-ronbo-rb070d30.o
 obj-$(CONFIG_DRM_PANEL_SAMSUNG_AMS581VF01) += panel-samsung-ams581vf01.o
diff --git a/drivers/gpu/drm/panel/panel-renesas-r63419.c b/drivers/gpu/drm/panel/panel-renesas-r63419.c
new file mode 100644
index 000000000000..cb4957914241
--- /dev/null
+++ b/drivers/gpu/drm/panel/panel-renesas-r63419.c
@@ -0,0 +1,356 @@
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
+	u16 height_mm;
+	u16 width_mm;
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
+	.type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED,
+};
+
+static struct panel_desc wt0600_desc = {
+	.lanes = 4,
+	.width_mm = 74,
+	.height_mm = 131,
+	.mode = &wt0600_mode,
+	.mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
+		      MIPI_DSI_CLOCK_NON_CONTINUOUS | MIPI_DSI_MODE_LPM,
+	.format = MIPI_DSI_FMT_RGB888,
+	.dsi_info = {
+		.type = "wt0600-2k",
+		.channel = 0,
+		.node = NULL,
+	},
+};
+
+static struct panel_desc wt0630_desc = {
+	.lanes = 4,
+	.width_mm = 78,
+	.height_mm = 140,
+	.mode = &wt0600_mode,  /* wt0600 only has different screen size */
+	.mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
+		      MIPI_DSI_CLOCK_NON_CONTINUOUS | MIPI_DSI_MODE_LPM,
+	.format = MIPI_DSI_FMT_RGB888,
+	.dsi_info = {
+		.type = "wt0630-2k",
+		.channel = 0,
+		.node = NULL,
+	},
+};
+
+static inline struct renesas_r63419_panel *
+to_renesas_r63419_panel(struct drm_panel *panel)
+{
+	return container_of(panel, struct renesas_r63419_panel, panel);
+}
+
+static int renesas_r63419_on(struct renesas_r63419_panel *ctx)
+{
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = ctx->dsi[0] };
+	struct mipi_dsi_multi_context dsi_ctx1 = { .dsi = ctx->dsi[1] };
+
+	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
+	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx1);
+	mipi_dsi_msleep(&dsi_ctx, 150);
+
+	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
+	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx1);
+	mipi_dsi_msleep(&dsi_ctx, 50);
+
+	return dsi_ctx.accum_err;
+}
+
+static int renesas_r63419_disable(struct drm_panel *panel)
+{
+	struct renesas_r63419_panel *ctx = to_renesas_r63419_panel(panel);
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = ctx->dsi[0] };
+	struct mipi_dsi_multi_context dsi_ctx1 = { .dsi = ctx->dsi[1] };
+
+	mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
+	mipi_dsi_dcs_set_display_off_multi(&dsi_ctx1);
+	mipi_dsi_msleep(&dsi_ctx, 50);
+
+	mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
+	mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx1);
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
+	if (ret < 0)
+		return ret;
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
+	struct drm_display_mode *mode;
+	struct renesas_r63419_panel *ctx = to_renesas_r63419_panel(panel);
+
+	mode = drm_mode_duplicate(connector->dev, ctx->desc->mode);
+	if (!mode)
+		return -ENOMEM;
+
+	/* Update panel size */
+	mode->width_mm = ctx->desc->width_mm;
+	mode->height_mm = ctx->desc->height_mm;
+
+	drm_mode_set_name(mode);
+	connector->display_info.width_mm = mode->width_mm;
+	connector->display_info.height_mm = mode->height_mm;
+	drm_mode_probed_add(connector, mode);
+
+	return 1;
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
+	/* Register the second DSI device */
+	ctx->dsi[1] = devm_mipi_dsi_device_register_full(dev, dsi1_host,
+							 &ctx->desc->dsi_info);
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
+	drm_panel_add(&ctx->panel);
+
+	/* Configure and attach both DSI devices */
+	for (i = 0; i < ARRAY_SIZE(ctx->dsi); i++) {
+		ctx->dsi[i]->lanes = ctx->desc->lanes;
+		ctx->dsi[i]->format = ctx->desc->format;
+		ctx->dsi[i]->mode_flags = ctx->desc->mode_flags;
+
+		ret = mipi_dsi_attach(ctx->dsi[i]);
+		if (ret < 0) {
+			drm_panel_remove(&ctx->panel);
+			return dev_err_probe(dev, ret,
+					     "Failed to attach DSI device %d\n", i);
+		}
+	}
+
+	return 0;
+}
+
+static void renesas_r63419_remove(struct mipi_dsi_device *dsi)
+{
+	struct renesas_r63419_panel *ctx = mipi_dsi_get_drvdata(dsi);
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(ctx->dsi); i++)
+		mipi_dsi_detach(ctx->dsi[i]);
+
+	drm_panel_remove(&ctx->panel);
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
+	.remove = renesas_r63419_remove,
+	.driver = {
+		.name = "panel-renesas-r63419",
+		.of_match_table = renesas_r63419_of_match,
+	},
+};
+module_mipi_dsi_driver(renesas_r63419_driver);
+
+MODULE_AUTHOR("Kancy Joe <kancy2333@outlook.com>");
+MODULE_DESCRIPTION("DRM driver for Renesas R63419 based dual-DSI video mode panels");
+MODULE_LICENSE("GPL");

-- 
2.34.1


