Return-Path: <linux-renesas-soc+bounces-3752-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E6CCB87B153
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 Mar 2024 20:13:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5F143B2F5D4
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 Mar 2024 19:04:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18C2560879;
	Wed, 13 Mar 2024 18:16:25 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A1B36BFD2;
	Wed, 13 Mar 2024 18:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710353785; cv=none; b=MhfOlWv0dJoCai5e4RWO/AsQuIN0I8jkbcD3MvRTH85mJb7qMKP5xDoNmcX4oENP5VpZznMaNtw6SX18hrjDI6uXNPfRQLqFYWPVEmP2Tqck7GFjXPThgEtUsdjHV40pnHKcSFR4XPwTilPyQka2+2Zo1/VhAjWkmTFbSXe6ANk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710353785; c=relaxed/simple;
	bh=I9s/VQmSnogfdi0VvuoUJ2sFhIIt3XNLWSLACBoRO9Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=XlZrpmsQhZcyzAOUBRxN0I7PLkmqBBT0juIMBb8iVkICGSYH24iM+VJ8c/ezg5OtuhWUrw+OfpDAR2CMR/By2738X7btm4vJbYC/OYghvX5R4OgWeWlxozg6eaODq4E6Bjdmn8QtQxADSz8hWhZrAhvzV0NcMHYyqx33y42y3O0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.07,123,1708354800"; 
   d="scan'208";a="197599037"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 14 Mar 2024 03:16:22 +0900
Received: from localhost.localdomain (unknown [10.226.92.104])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 4A2654045874;
	Thu, 14 Mar 2024 03:16:18 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Huy Nguyen <huy.nguyen.wh@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Rob Herring <robh@kernel.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	linux-usb@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v2 3/5] usb: renesas_usbhs: Update usbhs pipe configuration for RZ/G2L family
Date: Wed, 13 Mar 2024 18:16:00 +0000
Message-Id: <20240313181602.156840-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240313181602.156840-1-biju.das.jz@bp.renesas.com>
References: <20240313181602.156840-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Huy Nguyen <huy.nguyen.wh@renesas.com>

The RZ/G2L family SoCs has 10 PIPE buffers compared to 16 pipe
buffers on RZ/A2M. Update the pipe configuration for RZ/G2L family
SoCs and use family SoC specific compatible to handle this difference.

Added SoC specific compatible to OF table toavoid ABI breakage with old
DTB. To optimize memory usage the SoC specific compatible will be removed
later.

Signed-off-by: Huy Nguyen <huy.nguyen.wh@renesas.com>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * Dropped using of_device_is_compatible() in probe.
 * Added usbhs_rzg2l_plat_info and replaced the device data for RZ/G2L
   from usbhs_rza2_plat_info->usbhs_rzg2l_plat_info.
 * Moved usbhsc_rzg2l_pipe table near to the user.
 * Updated commit description.
---
 drivers/usb/renesas_usbhs/common.c | 25 +++++++++++++++++++++++--
 drivers/usb/renesas_usbhs/rza.h    |  1 +
 drivers/usb/renesas_usbhs/rza2.c   | 30 ++++++++++++++++++++++++++++++
 3 files changed, 54 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/renesas_usbhs/common.c b/drivers/usb/renesas_usbhs/common.c
index 0c62e4c6c88d..47c37c2043cb 100644
--- a/drivers/usb/renesas_usbhs/common.c
+++ b/drivers/usb/renesas_usbhs/common.c
@@ -565,6 +565,18 @@ static const struct of_device_id usbhs_of_match[] = {
 		.compatible = "renesas,usbhs-r8a77995",
 		.data = &usbhs_rcar_gen3_with_pll_plat_info,
 	},
+	{
+		.compatible = "renesas,usbhs-r9a07g043",
+		.data = &usbhs_rzg2l_plat_info,
+	},
+	{
+		.compatible = "renesas,usbhs-r9a07g044",
+		.data = &usbhs_rzg2l_plat_info,
+	},
+	{
+		.compatible = "renesas,usbhs-r9a07g054",
+		.data = &usbhs_rzg2l_plat_info,
+	},
 	{
 		.compatible = "renesas,rcar-gen2-usbhs",
 		.data = &usbhs_rcar_gen2_plat_info,
@@ -581,6 +593,10 @@ static const struct of_device_id usbhs_of_match[] = {
 		.compatible = "renesas,rza2-usbhs",
 		.data = &usbhs_rza2_plat_info,
 	},
+	{
+		.compatible = "renesas,rzg2l-usbhs",
+		.data = &usbhs_rzg2l_plat_info,
+	},
 	{ },
 };
 MODULE_DEVICE_TABLE(of, usbhs_of_match);
@@ -640,8 +656,13 @@ static int usbhs_probe(struct platform_device *pdev)
 
 	/* set default param if platform doesn't have */
 	if (usbhs_get_dparam(priv, has_new_pipe_configs)) {
-		priv->dparam.pipe_configs = usbhsc_new_pipe;
-		priv->dparam.pipe_size = ARRAY_SIZE(usbhsc_new_pipe);
+		if (info->driver_param.pipe_configs) {
+			priv->dparam.pipe_configs = info->driver_param.pipe_configs;
+			priv->dparam.pipe_size = info->driver_param.pipe_size;
+		} else {
+			priv->dparam.pipe_configs = usbhsc_new_pipe;
+			priv->dparam.pipe_size = ARRAY_SIZE(usbhsc_new_pipe);
+		}
 	} else if (!priv->dparam.pipe_configs) {
 		priv->dparam.pipe_configs = usbhsc_default_pipe;
 		priv->dparam.pipe_size = ARRAY_SIZE(usbhsc_default_pipe);
diff --git a/drivers/usb/renesas_usbhs/rza.h b/drivers/usb/renesas_usbhs/rza.h
index a29b75fef057..8b879aa34a20 100644
--- a/drivers/usb/renesas_usbhs/rza.h
+++ b/drivers/usb/renesas_usbhs/rza.h
@@ -3,3 +3,4 @@
 
 extern const struct renesas_usbhs_platform_info usbhs_rza1_plat_info;
 extern const struct renesas_usbhs_platform_info usbhs_rza2_plat_info;
+extern const struct renesas_usbhs_platform_info usbhs_rzg2l_plat_info;
diff --git a/drivers/usb/renesas_usbhs/rza2.c b/drivers/usb/renesas_usbhs/rza2.c
index f079817250bb..0336b419b37c 100644
--- a/drivers/usb/renesas_usbhs/rza2.c
+++ b/drivers/usb/renesas_usbhs/rza2.c
@@ -58,6 +58,36 @@ static int usbhs_rza2_power_ctrl(struct platform_device *pdev,
 	return retval;
 }
 
+/* commonly used on RZ/G2L family */
+static struct renesas_usbhs_driver_pipe_config usbhsc_rzg2l_pipe[] = {
+	RENESAS_USBHS_PIPE(USB_ENDPOINT_XFER_CONTROL, 64, 0x00, false),
+	RENESAS_USBHS_PIPE(USB_ENDPOINT_XFER_ISOC, 1024, 0x08, true),
+	RENESAS_USBHS_PIPE(USB_ENDPOINT_XFER_ISOC, 1024, 0x28, true),
+	RENESAS_USBHS_PIPE(USB_ENDPOINT_XFER_BULK, 512, 0x48, true),
+	RENESAS_USBHS_PIPE(USB_ENDPOINT_XFER_BULK, 512, 0x58, true),
+	RENESAS_USBHS_PIPE(USB_ENDPOINT_XFER_BULK, 512, 0x68, true),
+	RENESAS_USBHS_PIPE(USB_ENDPOINT_XFER_INT, 64, 0x04, false),
+	RENESAS_USBHS_PIPE(USB_ENDPOINT_XFER_INT, 64, 0x05, false),
+	RENESAS_USBHS_PIPE(USB_ENDPOINT_XFER_INT, 64, 0x06, false),
+	RENESAS_USBHS_PIPE(USB_ENDPOINT_XFER_INT, 64, 0x07, false),
+};
+
+const struct renesas_usbhs_platform_info usbhs_rzg2l_plat_info = {
+	.platform_callback = {
+		.hardware_init = usbhs_rza2_hardware_init,
+		.hardware_exit = usbhs_rza2_hardware_exit,
+		.power_ctrl = usbhs_rza2_power_ctrl,
+		.get_id = usbhs_get_id_as_gadget,
+	},
+	.driver_param = {
+		.pipe_configs = usbhsc_rzg2l_pipe,
+		.pipe_size = ARRAY_SIZE(usbhsc_rzg2l_pipe),
+		.has_cnen = 1,
+		.cfifo_byte_addr = 1,
+		.has_new_pipe_configs = 1,
+	},
+};
+
 const struct renesas_usbhs_platform_info usbhs_rza2_plat_info = {
 	.platform_callback = {
 		.hardware_init = usbhs_rza2_hardware_init,
-- 
2.25.1


