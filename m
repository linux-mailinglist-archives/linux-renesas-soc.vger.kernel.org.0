Return-Path: <linux-renesas-soc+bounces-31710-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kAcTN+bH8GkqYgEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31710-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Apr 2026 16:44:54 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B4D04873CF
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Apr 2026 16:44:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 72D973046271
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Apr 2026 14:06:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCAA743E9FC;
	Tue, 28 Apr 2026 14:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CX4I/ZaX"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6125D24E4C4
	for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Apr 2026 14:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777385157; cv=none; b=ERXeiN+WG2L4MvrU0dryJdNpsz0hbPzy9BoOua+HP4mceMI4gOMLILLn4eSSsKwA3kbasCfbnRMOx7FEiPqT247czpNnSwS7hO+fD8v6qJCoWsKlXNrv/RzhKeC3aMtDIlqSZa0x6d6u/jOKYF3Y8dWief7J6Gr4RMAEoaDkMes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777385157; c=relaxed/simple;
	bh=QwLk3Rt5xXaoZ6skQucP5sBlR6hQ6tO5Cq9c1hdGbv0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=vFMJR4Usx5GpGqpyktjzhAT8sRHLQvInlZovSCm0kglWdKLcjCjsYRd1FeYCkNtXSwEQwPwDmn+AZXzLBANpHQHM3Y8nEZA7AsQYc+RBG8eRWfKr5w0uNUNqpWmbyLMRPruqqFBvNBS27KINiLLY01wAtXiNxbi/m5tcI8zGEw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CX4I/ZaX; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-43fe3e22e33so7432006f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Apr 2026 07:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777385153; x=1777989953; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FudvciPbQh66CQVlQx9qR0a4iS/GQ4J8s0VZ/c5V0Ws=;
        b=CX4I/ZaXdxSbBACi+f6k68i2UDZygAu2he6rY6K2UO6Xok7uPE64KgawDOBkQ5vjPq
         V2l/E66beZUVN9x5ku0t6oglJ9P9crewxAXt/CNhYvpWvcWuBpKhPFMZgFg/a4qMF3Dk
         Pu0HphnMDgKXxWc6hoC+TrI0TDKMTTnGVtTdzkJFXJHjtfWU+b1Tnv3Jm3qjdcuoFQ15
         8gHgHxMe7wzCwiAV2GSZhqIVmY8ONcjB+7wgDUugFc1rNt55ZofoZ4ZJIyykjxGbk9Cq
         nF2w9Oa864ObUxjJ7cLpK6z8g0WNc5R7ZJWGDv+Ce4us7L64FwycnwiRqXBshY/RyT9A
         O8Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777385153; x=1777989953;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FudvciPbQh66CQVlQx9qR0a4iS/GQ4J8s0VZ/c5V0Ws=;
        b=m0VssfdSEJKKwOzcx607RzPpxFdBdbtyHqBIyqDfE+HYclmoTPCeDbKcj2Y5OiQbXy
         xNe5U7OJ2o4wOa8Am4EK+endzbFwpYhNFr9Ei3BndZ0N1lGhjWa1/GrGFUibMRqyIWGg
         VJUu77OEvfngvI2pV+hYYyMI8vjJqSEScBM6N0vosadQJg5so1YA4Ssjf48eMou+fEa6
         D9Ie+8j/0Vwlnn0V8FNve3pCqCgPX+pyIY3hPd21PoEpCg71pSE4hCxf4b54YndNI46q
         VBqJkCWxsW1Ht8AJwTNV7FT/l++v1p8Ba7ZnZuAoqDGQ27jvsS/GOV0+TAYjzmuQrYio
         fe6w==
X-Forwarded-Encrypted: i=1; AFNElJ/bKxw8uFWv940Fs/85JjEgpSrKAytGkbIA8yCc4dd50rsOvJsnkRT7pFtPej0lYKmzV++rO7/NcpUxL+hGQIn5ew==@vger.kernel.org
X-Gm-Message-State: AOJu0YzoNfpEB831mNuSFHha9bFgXuwKtiN6D5z2MluirjS1VKcXUaEp
	5xBEmsxk4Qtk6oTBT4G8ITf57/+u/qf0eNLz6Dtw6j2p4Ky4+IDtfu66mIz7vrVvkUs=
X-Gm-Gg: AeBDievA9df3+6yQKD3L/64dtjOVadYAl2fh0PmuU8BHYw/C22/jQKpFP3a3OLL0r5X
	densLTd2kVCOldKnjqfRLRSr6Wt1QVte0DeINNbR5LhqiCzjuggG9iW+NRLrv3XXQHc2xkoki/0
	u0k470Sj7FZEg6rM86WE3k1H6s54enXY6vA7E5qR3d6SpwySLu3eBnmZ4JkgLNfQkuvozo3PlBc
	3tZynqM3JNbwaCF5J566yRYJzRPe5CeRCxqFy3T7S054/x/PqfOYLESd9aY+dAvz7pTasWTA3U7
	M3wPBNPf6Pg7iK8oKSQL9nD/pIv6awQLPWO6mOAfC3XDKWiW590/Hp/kDKNI9JBj7/PUqYkh4Wp
	YE2BhEv3PsgcO+RUcZW1VuSw+fj3WXUFZ1aGQ99KouMtNgwtA91GU5EfyPsQ4D6t+rpxmZ4oVBf
	wUl7Tth2DvJsdABGwZJuHxCupnkBg3mYy0hRgKD3Pf+VCjtpQcwK71FBs=
X-Received: by 2002:a5d:64c3:0:b0:43d:3004:5fef with SMTP id ffacd0b85a97d-44648f28ef6mr5714427f8f.7.1777385152430;
        Tue, 28 Apr 2026 07:05:52 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4464004ed80sm7143264f8f.34.2026.04.28.07.05.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 07:05:52 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 28 Apr 2026 16:05:47 +0200
Subject: [PATCH 2/2] drm: panel: add support for the R63419 based dual-DSI
 video mode Display Panels
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260428-topic-sm8650-ayaneo-pocket-s2-r63419-v1-2-981eb5ab5a51@linaro.org>
References: <20260428-topic-sm8650-ayaneo-pocket-s2-r63419-v1-0-981eb5ab5a51@linaro.org>
In-Reply-To: <20260428-topic-sm8650-ayaneo-pocket-s2-r63419-v1-0-981eb5ab5a51@linaro.org>
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
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBp8L68afQkKuJn1zxyo60zyCwtAA2LZ5ULoL84Blkb
 W96QN9GJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCafC+vAAKCRB33NvayMhJ0WclD/
 9rSeNBMq0D1Ph5yHEXqIn0F+kcLO2xZSKMxqaF32QLp64w+TMbpSPLdolnBp9OhchgBPQyy2FzwH39
 GEMrtrmRAZkcfDgN/vxubaUrkCuPo2dPwyVDv5FqkvswXS+CXiAzxH9uwbIKjrY8UGGvoaHnkV6kmH
 9WervAigDQ7vDk+BzxsuLl27dhC4tiitYyczU2cxwXAHkdg1g17wUEq97Z9VDOm1g7rIi5cEhuJvAI
 gquA0SMCl73I6JiwnWo55CmmHivk7CawISkZs/c9N6W/Lk5hx3+hzjc0dGmh4Wz5yZipvzMPE/NVjs
 AXN3vt6Y0p513oDygP3gca9zwb7N7T1E94xMX6L5I6olYnjuD6JhaXGvKFr4BApbcINwUBBmf7WZSu
 nK5hOEifTkZO5/N9rzfMAMMqRxq1Ilp2VPrbhdvowWS4cQ/3rYNjVrD9Wohz8TYZUKrUdYUaXHh3q7
 6snm8gp8SCcEJ1QQbHgmrZ7uyVjPnoboB+CGkIdVVLHXr90h0MBDdPecT74CS/nobupX+qt/+qBVei
 fxuO7TDzeNfCLE/J0m+yIBWkpwZqL+ugBlNXkkkg/9XG31tAuEwgUfxq4ZK8YKs8DmppLCqAO0ilmn
 mQsNXPLnfU64zcFxo++Ooagp2HrrIBNxCjFVGzYXvRaIrvt9rBE4mU27HBDA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Rspamd-Queue-Id: 8B4D04873CF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31710-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,linux.intel.com,kernel.org,suse.de,ffwll.ch,glider.be];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,linaro.org,outlook.com];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[outlook.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linaro.org:email,linaro.org:dkim,linaro.org:mid]

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


