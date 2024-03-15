Return-Path: <linux-renesas-soc+bounces-3816-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AC50F87D3C4
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 Mar 2024 19:40:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 37D3B1F24163
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 Mar 2024 18:40:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D56651EB48;
	Fri, 15 Mar 2024 18:39:52 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 537EC1D553;
	Fri, 15 Mar 2024 18:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710527992; cv=none; b=Z6sKV1BRnjm/FYxPz7Adhj7YPLONnBEvV9KSwdcZc6Hv/GLJ/ZTS6wZ9EYm6hL8AFQV6jQGnVmYRCLcbEqcdtgZUVYH5Ndq5SRuNHEK9bwtzIVNlND5h/QtOSf5yohC0Q03X7+V64LDXuIzHq8MQ/+gWDLz3YlNv/Vy0uSqoA8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710527992; c=relaxed/simple;
	bh=3PIwwpwwWVl2o8F0ie8MiD/RJToWhQwtHG9MopDzHH4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=l9lEk278uCgN2v6IX6QsWmT/UozKt78Xx50Ko6mwo+sPVXZU63SiJMmWiN6uEWK3oiDg9f3Buospr+CtbvWkoZxLXsu1GNRgCRsMtQutoaYy1khS0PoWft0uLhRUF77QkXbB9F29yv5pSb6o1FqrOeALHiUarLWJPawzUWDAnPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.07,129,1708354800"; 
   d="scan'208";a="201861075"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 16 Mar 2024 03:39:48 +0900
Received: from localhost.localdomain (unknown [10.226.93.102])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 2ECE24066236;
	Sat, 16 Mar 2024 03:39:43 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Huy Nguyen <huy.nguyen.wh@renesas.com>,
	Rob Herring <robh@kernel.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	linux-usb@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v3 5/7] usb: renesas_usbhs: Update usbhs pipe configuration for RZ/G2L family
Date: Fri, 15 Mar 2024 18:39:19 +0000
Message-Id: <20240315183921.375751-6-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240315183921.375751-1-biju.das.jz@bp.renesas.com>
References: <20240315183921.375751-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The RZ/G2L family SoCs has 10 PIPE buffers compared to 16 pipe buffers on
RZ/A2M. Update the pipe configuration for RZ/G2L family SoCs and use
family SoC specific compatible to handle this difference.

Added SoC specific compatible to OF table to avoid ABI breakage with old
DTB. To optimize memory usage the SoC specific compatible will be removed
later.

The pipe configuration of RZ/G2L is same as the default one, so reuse the
common table by renaming usbhs_default_pipe[]->usbhs_rcar_default_pipe[]
and changing static qualifier to global to fill the pipe configuration
data.

Signed-off-by: Huy Nguyen <huy.nguyen.wh@renesas.com>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2->v3:
 * Updated commit description
 * Dropped usbhsc_rzg2l_pipe[] and reusing the default_pipe[].
v1->v2:
 * Dropped using of_device_is_compatible() in probe.
 * Added usbhs_rzg2l_plat_info and replaced the device data for RZ/G2L
   from usbhs_rza2_plat_info->usbhs_rzg2l_plat_info.
 * Moved usbhsc_rzg2l_pipe table near to the user.
 * Updated commit description.
---
 drivers/usb/renesas_usbhs/common.c | 24 ++++++++++++++++++++----
 drivers/usb/renesas_usbhs/common.h |  1 +
 drivers/usb/renesas_usbhs/rza.h    |  1 +
 drivers/usb/renesas_usbhs/rza2.c   | 15 +++++++++++++++
 4 files changed, 37 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/renesas_usbhs/common.c b/drivers/usb/renesas_usbhs/common.c
index 013bc1583610..3c67cd9c4406 100644
--- a/drivers/usb/renesas_usbhs/common.c
+++ b/drivers/usb/renesas_usbhs/common.c
@@ -363,8 +363,8 @@ static void usbhsc_clk_disable_unprepare(struct usbhs_priv *priv)
  *		platform default param
  */
 
-/* commonly used on old SH-Mobile SoCs */
-static struct renesas_usbhs_driver_pipe_config usbhsc_default_pipe[] = {
+/* commonly used on old SH-Mobile and RZ/G2L family SoCs */
+struct renesas_usbhs_driver_pipe_config usbhsc_rcar_default_pipe[] = {
 	RENESAS_USBHS_PIPE(USB_ENDPOINT_XFER_CONTROL, 64, 0x00, false),
 	RENESAS_USBHS_PIPE(USB_ENDPOINT_XFER_ISOC, 1024, 0x08, true),
 	RENESAS_USBHS_PIPE(USB_ENDPOINT_XFER_ISOC, 1024, 0x28, true),
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
@@ -642,8 +658,8 @@ static int usbhs_probe(struct platform_device *pdev)
 	priv->dparam.pipe_configs = info->driver_param.pipe_configs;
 	priv->dparam.pipe_size = info->driver_param.pipe_size;
 	if (!priv->dparam.pipe_configs) {
-		priv->dparam.pipe_configs = usbhsc_default_pipe;
-		priv->dparam.pipe_size = ARRAY_SIZE(usbhsc_default_pipe);
+		priv->dparam.pipe_configs = usbhsc_rcar_default_pipe;
+		priv->dparam.pipe_size = ARRAY_SIZE(usbhsc_rcar_default_pipe);
 	}
 	if (!priv->dparam.pio_dma_border)
 		priv->dparam.pio_dma_border = 64; /* 64byte */
diff --git a/drivers/usb/renesas_usbhs/common.h b/drivers/usb/renesas_usbhs/common.h
index f6f527ca9b45..6b4b6f43d823 100644
--- a/drivers/usb/renesas_usbhs/common.h
+++ b/drivers/usb/renesas_usbhs/common.h
@@ -343,6 +343,7 @@ struct usbhs_priv *usbhs_pdev_to_priv(struct platform_device *pdev);
 #define usbhs_priv_to_dev(priv)		(&priv->pdev->dev)
 #define usbhs_priv_to_lock(priv)	(&priv->lock)
 
+extern struct renesas_usbhs_driver_pipe_config usbhsc_rcar_default_pipe[];
 extern struct renesas_usbhs_driver_pipe_config usbhsc_rcar_pipe[];
 
 #endif /* RENESAS_USB_DRIVER_H */
diff --git a/drivers/usb/renesas_usbhs/rza.h b/drivers/usb/renesas_usbhs/rza.h
index a29b75fef057..8b879aa34a20 100644
--- a/drivers/usb/renesas_usbhs/rza.h
+++ b/drivers/usb/renesas_usbhs/rza.h
@@ -3,3 +3,4 @@
 
 extern const struct renesas_usbhs_platform_info usbhs_rza1_plat_info;
 extern const struct renesas_usbhs_platform_info usbhs_rza2_plat_info;
+extern const struct renesas_usbhs_platform_info usbhs_rzg2l_plat_info;
diff --git a/drivers/usb/renesas_usbhs/rza2.c b/drivers/usb/renesas_usbhs/rza2.c
index f6660628eea9..de96c226c826 100644
--- a/drivers/usb/renesas_usbhs/rza2.c
+++ b/drivers/usb/renesas_usbhs/rza2.c
@@ -72,3 +72,18 @@ const struct renesas_usbhs_platform_info usbhs_rza2_plat_info = {
 		.cfifo_byte_addr = 1,
 	},
 };
+
+const struct renesas_usbhs_platform_info usbhs_rzg2l_plat_info = {
+	.platform_callback = {
+		.hardware_init = usbhs_rza2_hardware_init,
+		.hardware_exit = usbhs_rza2_hardware_exit,
+		.power_ctrl = usbhs_rza2_power_ctrl,
+		.get_id = usbhs_get_id_as_gadget,
+	},
+	.driver_param = {
+		.pipe_configs = usbhsc_rcar_default_pipe,
+		.pipe_size = 10,
+		.has_cnen = 1,
+		.cfifo_byte_addr = 1,
+	},
+};
-- 
2.25.1


