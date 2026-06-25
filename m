Return-Path: <linux-renesas-soc+bounces-34418-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9W0eFrz1PGohvAgAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34418-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Jun 2026 11:32:44 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A3EAC6C440F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Jun 2026 11:32:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=FvzcK1qU;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34418-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34418-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4A7C2303028D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Jun 2026 09:29:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 806A53921CE;
	Thu, 25 Jun 2026 09:29:17 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C8F8383C7D
	for <linux-renesas-soc@vger.kernel.org>; Thu, 25 Jun 2026 09:29:15 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782379757; cv=none; b=O44Qei0t6cubH3Z6poUBtIcHDpsqbgmqmdQkfuTL33SPey2KHlrFp7TWVVBx52UcCUfE13fNOu8171F2Asm2BLMPmBLh43+leDn2wTEKsZ0zCt9mk5Lh6ZdTiknU6Ye4emUKpKHqxpeOJyLPS1x8uNon8MMuAvzYjVCH6DzkMv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782379757; c=relaxed/simple;
	bh=qmEQyc18N4t2sHh0DdkjJYKjKcyN7/91OeVBkBosI3I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IwLnbaoKlZpl1E4fZJBqbQLKktRnp5RkqDhPeEshczSj63ZHORseVGR6I2CRGZO3gM2B4TxokWjrqgRTaAhZEBozwfS0orqkACtH35waQCgxSl1zdGQVpCe+Uzd8L6vLhx/BiQ4THvHIAp0fdcB21sYm+XHyDsq0lrgGWiMud6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FvzcK1qU; arc=none smtp.client-ip=209.85.128.53
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-49222fb062bso19226255e9.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 25 Jun 2026 02:29:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1782379754; x=1782984554; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QYkjcCmEhfEUF2KcloXBUOr8cqJNScbwNNsrSeHQqrw=;
        b=FvzcK1qU2ZJ8lQ4rrRmGixeBlSjbvMyCZeiHDrkT7YOSBE9FXx3yKx1hx8Gv2T48S6
         0R8BemSnRIx7nYG8Q9cEqp0x2FuMs94FZ6iiK4pN6Re2BnQ73eHQdxADtw60k+CRCFnG
         G0uFvs1qfHFxAVUUtRH3+SgWjhMmTHWZTAGTRqCdum/9E304Wna3lzdyH9Abk3NS33Ar
         ZuipXqbo8IOnXizapta2o7baN/6n9AcoGQXue/NZ1aysfLbwEhbM2kNBUgmqX1rNKtYp
         BmUXzp0iN6lS+rTUW2629qo1ZlnIuHfH0krMSpGYyu8ueVyfTpA0+8F/0Uocoy4GD3jV
         bRcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782379754; x=1782984554;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QYkjcCmEhfEUF2KcloXBUOr8cqJNScbwNNsrSeHQqrw=;
        b=a3pKnGTQQ+4PJ+eOJFJIGa8Z2wYZA7rVbTK7xTJcfAJ5WbosB6Opo4dsVTg0llGW1d
         0DKQecNjqkINkug4bTNcvQwCdU+vkdwTSLhyRZiozA5jQp+8exW/gmgL/SSetfrIG95y
         f0Tjb6aCpOYAvBKHnafwgeHjLt0c7IdE5e9AB69VyrPjBr+eTMBVSCWQC2gpIjpwQnQR
         z5zF8bCAmx4C/fYtPg4E+1dQpDIivASdgn1woqaBEiQ4XkO3hWViLpLTaCxSx1YtDVPn
         NHuhwwlpEV5RVdkl3viaRYCFKjCjvzXyZtU18UtK5KoW6KSw9bK8qV8g1Sm3ex37bXo+
         1utw==
X-Forwarded-Encrypted: i=1; AFNElJ86jrGoVVfbZ8lpWWIokqJ6j7NPtnq0s3CZ89waYLNjDMdSWcQc/4QtcoAIzenfRGAA6FzmkKFugLm14VyMximDRA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5zAfMrQmqezVfYo6e6eHLcVcbhamYDNF+Rvyuexxr4Js/1Ibl
	hs5hQD2ge9RCwePFch2KvMatuMhTnjWQ6gWuosyu2Y7mfaIOTZOnaxF1GOm9BuL0DRc=
X-Gm-Gg: AfdE7cn0JYG7ZiTd8nGB9I7B0WKnFMaT63G1Jm7gjJq7L5X5fxbh7mj49TILwkL8rvH
	rL/IotRgtUZnYcALAnAtH3wyLzbhDPUTI/aMX4nQGAlS7jxWH0rUEICM9hgIgwKTi464jHQfN2a
	pIVUo0ggVYYPnTEBTQqchgWa78V4Ng/6Nr1Lu3jyIacRiu24tSPnpDB67SpoRjM3HTEDavGX8KC
	upcMnOET4mlagkkvh39k+ivjWZmuW2r2BQzxpF1knNWFpueSlqbzLK3r9g2aYPy5//MygxEaHIN
	oiqdTFSkOMbxofC84vAHV1mSfkHUglAJTl6JvJp9JjYayVa/uzx/d6P6Jdfr5hKl3AU5xPAlcbk
	3GZKUZqcDUvb0TbZWETCp+nIvOdvEoL2M2HW+We+GkAYTqZL4zuj/UM8qaukREc9AX5079fdgEJ
	frPDEgdu/0neUeruv08UB3WwdXkgwUVZ7IBw==
X-Received: by 2002:a05:600c:4e87:b0:492:25a0:1730 with SMTP id 5b1f17b1804b1-49266893494mr22130595e9.32.1782379753804;
        Thu, 25 Jun 2026 02:29:13 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4926544dfaesm33846195e9.2.2026.06.25.02.29.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 02:29:13 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 25 Jun 2026 11:29:08 +0200
Subject: [PATCH v8 2/2] drm: panel: add support for the Renesas R63419
 based dual-DSI video mode Display Panels
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260625-topic-sm8650-ayaneo-pocket-s2-r63419-v8-2-8570e692143e@linaro.org>
References: <20260625-topic-sm8650-ayaneo-pocket-s2-r63419-v8-0-8570e692143e@linaro.org>
In-Reply-To: <20260625-topic-sm8650-ayaneo-pocket-s2-r63419-v8-0-8570e692143e@linaro.org>
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
 Doug Anderson <dianders@chromium.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 KancyJoe <kancy2333@outlook.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=12903;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=DJM3cyv6AVtAUz9+oU1PMmzRkTPf+tQLf+ttD3ny8lY=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqPPTl/nbwVvfl3OEvU4FaqvW7UVY+uH91EgFlHJ/J
 6jS1GJqJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCajz05QAKCRB33NvayMhJ0fVsEA
 CvfzB1Jk4rjlD/Lb9Z40ifhXN6rM4pQFygW+SMOBSpRhOzS31jpJ4sMnFiEB+oey/QKOzdgyAe2LlQ
 rJ6Q8+YXEppGo2agsDcptD4MjXSCROD99n1jWZLT3YRxzebnLtNFDXBbJ5aL1uJtGVXWK4X6qQMu7M
 oOVi+D6MlMDz9l/xLdukr0YpP5V3a4CvIjgQ+IsdlnTt/6LjdxprVR0JdAx/N4eUJID6aXzt6XiMoP
 E0P6UEh67MqUbtV+6hTrpyGdsiZZJQ5mg6pvKtZMlMEfvhSswnv4sKyM4ggt1/ME1N4FOhA3QvJsCc
 ieppn5Gb6i3cU1TPRbuKx7scUd32eZ2x7r80PHL734KS80NMkovDmEhBBVdx3FbgH7NFf3RGAa5N6s
 zgnr5sDRXK6pSaPVZUXQ4w75B6rTmS89Qtb2z1Nb3GgmpHbmSINZj9LxY4DRcBbt47mOadyTeduzWS
 ZPGBSavnTnJUyUFVtsbxfN9iUMVNGM5vB+AlZaG2X7HIqmj49hNG8LD0b0o3mOOaYUOQVQbLc5JnZ+
 rzZQkZiDHervNJQH4Vq0ElxNYuZdjR2xb9KBIO/zh5xY8ake+D66feYBM8IMCj/PsMn6vs4RBZjAky
 ngr0xMeQREhK3RPnwPCrs8gR73jEIBNcSkf/gVbLan5IiuLNxofIXs2eh/BA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34418-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jesszhan0024@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:dri-devel@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:dianders@chromium.org,m:neil.armstrong@linaro.org,m:kancy2333@outlook.com,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,linux.intel.com,kernel.org,suse.de,ffwll.ch,glider.be];
	FORGED_SENDER(0.00)[neil.armstrong@linaro.org,linux-renesas-soc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,oss.qualcomm.com,chromium.org,linaro.org,outlook.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[info.channel:url,linaro.org:dkim,linaro.org:email,linaro.org:mid,linaro.org:from_mime,outlook.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A3EAC6C440F

From: KancyJoe <kancy2333@outlook.com>

Implement support for the Renesas 63419 based dual-DSI video mode
Display Panels found in the Ayaneo gaming handled devices.

Signed-off-by: KancyJoe <kancy2333@outlook.com>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/gpu/drm/panel/Kconfig                |  12 +
 drivers/gpu/drm/panel/Makefile               |   1 +
 drivers/gpu/drm/panel/panel-renesas-r63419.c | 350 +++++++++++++++++++++++++++
 3 files changed, 363 insertions(+)

diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index c0cc2bb4a3eb..2e84f6ce8190 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -826,6 +826,18 @@ config DRM_PANEL_RENESAS_R61307
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
index 6926ef28ab8d..17bd4f51098f 100644
--- a/drivers/gpu/drm/panel/Makefile
+++ b/drivers/gpu/drm/panel/Makefile
@@ -81,6 +81,7 @@ obj-$(CONFIG_DRM_PANEL_RAYDIUM_RM68200) += panel-raydium-rm68200.o
 obj-$(CONFIG_DRM_PANEL_RAYDIUM_RM692E5) += panel-raydium-rm692e5.o
 obj-$(CONFIG_DRM_PANEL_RAYDIUM_RM69380) += panel-raydium-rm69380.o
 obj-$(CONFIG_DRM_PANEL_RENESAS_R61307) += panel-renesas-r61307.o
+obj-$(CONFIG_DRM_PANEL_RENESAS_R63419) += panel-renesas-r63419.o
 obj-$(CONFIG_DRM_PANEL_RENESAS_R69328) += panel-renesas-r69328.o
 obj-$(CONFIG_DRM_PANEL_RONBO_RB070D30) += panel-ronbo-rb070d30.o
 obj-$(CONFIG_DRM_PANEL_SAMSUNG_AMS581VF01) += panel-samsung-ams581vf01.o
diff --git a/drivers/gpu/drm/panel/panel-renesas-r63419.c b/drivers/gpu/drm/panel/panel-renesas-r63419.c
new file mode 100644
index 000000000000..59ac323f5276
--- /dev/null
+++ b/drivers/gpu/drm/panel/panel-renesas-r63419.c
@@ -0,0 +1,350 @@
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
+static int renesas_r63419_on(struct renesas_r63419_panel *ctx)
+{
+	struct mipi_dsi_multi_context dsi_ctx = { 0 };
+
+	/*
+	 * Panel registers are loaded from DDIC Non Volatile Memory
+	 *
+	 * The DDIC expects this sequence to get out of sleep and enable display
+	 */
+
+	mipi_dsi_dual(mipi_dsi_dcs_set_display_on_multi,
+		      &dsi_ctx, ctx->dsi[0], ctx->dsi[1]);
+	mipi_dsi_msleep(&dsi_ctx, 50);
+
+	mipi_dsi_dual(mipi_dsi_dcs_exit_sleep_mode_multi,
+		      &dsi_ctx, ctx->dsi[0], ctx->dsi[1]);
+	mipi_dsi_msleep(&dsi_ctx, 150);
+
+	return dsi_ctx.accum_err;
+}
+
+static int renesas_r63419_disable(struct drm_panel *panel)
+{
+	struct renesas_r63419_panel *ctx = to_renesas_r63419_panel(panel);
+	struct mipi_dsi_multi_context dsi_ctx = { 0 };
+
+	mipi_dsi_dual(mipi_dsi_dcs_set_display_off_multi,
+		      &dsi_ctx, ctx->dsi[0], ctx->dsi[1]);
+	mipi_dsi_msleep(&dsi_ctx, 50);
+
+	mipi_dsi_dual(mipi_dsi_dcs_enter_sleep_mode_multi,
+		      &dsi_ctx, ctx->dsi[0], ctx->dsi[1]);
+	mipi_dsi_msleep(&dsi_ctx, 120);
+
+	return 0;
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
+		regulator_bulk_disable(ARRAY_SIZE(renesas_r63419_vdd_supplies),
+				       ctx->vdd_supplies);
+
+		gpiod_set_value_cansleep(ctx->reset_gpio, 1);
+
+		regulator_bulk_disable(ARRAY_SIZE(renesas_r63419_vcc_supplies),
+				       ctx->vcc_supplies);
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
+	regulator_bulk_disable(ARRAY_SIZE(renesas_r63419_vdd_supplies), ctx->vdd_supplies);
+
+	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
+
+	regulator_bulk_disable(ARRAY_SIZE(renesas_r63419_vcc_supplies), ctx->vcc_supplies);
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
+	struct mipi_dsi_device_info info = { 0 };
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
+	strscpy(info.type, dsi->name);
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


