Return-Path: <linux-renesas-soc+bounces-3614-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BB621876A87
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  8 Mar 2024 19:09:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 770D2282988
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  8 Mar 2024 18:09:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3170D54BDA;
	Fri,  8 Mar 2024 18:09:43 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B0AA56478;
	Fri,  8 Mar 2024 18:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709921383; cv=none; b=vBYA8Z+O92+R5Ru2c2pFxCYD0uYjxYHEVb2TeWZ59rYTMiC0HHseIn/A1AHmUM9wrSFbx7Q3jM4i/aPv0PiW1JL3GTpgnggjd5zmlFwdfLedNTMQ29i6VgHrUlbM7SI9OIgeDHnsV/jqD3F2dMUzjZ4ZE3XKBGhaGSjjbkw1sis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709921383; c=relaxed/simple;
	bh=n9EB9OEUJhcepHPTJ6GNjobg2zfPZjJCry1HFFr1mtA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=XEm3MkD8RiHLGrXRyIYG+7YKVt+ETOWEh1kmx3KdICtiFngoUtJMMjoj7QaHIpkRrIPutML471y9zq2xpul18Gy7nW1mQNPDLm0+9B4L2i++HUupuyH6fWRPlOHse2LyOE6+zt2GbfH8XEe2NSlh8UnPmpL0OBl1GUmxx23BBCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.07,110,1708354800"; 
   d="scan'208";a="200889932"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 09 Mar 2024 03:09:35 +0900
Received: from localhost.localdomain (unknown [10.226.92.24])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 70CB940158E6;
	Sat,  9 Mar 2024 03:09:31 +0900 (JST)
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
Subject: [PATCH 2/4] usb: renesas_usbhs: Update usbhs pipe configuration for RZ/G2L family
Date: Fri,  8 Mar 2024 18:09:17 +0000
Message-Id: <20240308180919.6603-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240308180919.6603-1-biju.das.jz@bp.renesas.com>
References: <20240308180919.6603-1-biju.das.jz@bp.renesas.com>
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
SoCs. For the backward compatibility SoC specific compatible is used
and will remove the same after few kernel releases.

Signed-off-by: Huy Nguyen <huy.nguyen.wh@renesas.com>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/usb/renesas_usbhs/common.c | 31 ++++++++++++++++++++++++++++--
 1 file changed, 29 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/renesas_usbhs/common.c b/drivers/usb/renesas_usbhs/common.c
index dd1c17542439..030ec36deb64 100644
--- a/drivers/usb/renesas_usbhs/common.c
+++ b/drivers/usb/renesas_usbhs/common.c
@@ -397,6 +397,20 @@ static struct renesas_usbhs_driver_pipe_config usbhsc_new_pipe[] = {
 	RENESAS_USBHS_PIPE(USB_ENDPOINT_XFER_BULK, 512, 0xd8, true),
 };
 
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
 /*
  *		power control
  */
@@ -581,6 +595,10 @@ static const struct of_device_id usbhs_of_match[] = {
 		.compatible = "renesas,rza2-usbhs",
 		.data = &usbhs_rza2_plat_info,
 	},
+	{
+		.compatible = "renesas,rzg2l-usbhs",
+		.data = &usbhs_rza2_plat_info,
+	},
 	{ },
 };
 MODULE_DEVICE_TABLE(of, usbhs_of_match);
@@ -645,8 +663,17 @@ static int usbhs_probe(struct platform_device *pdev)
 
 	/* set default param if platform doesn't have */
 	if (usbhs_get_dparam(priv, has_new_pipe_configs)) {
-		priv->dparam.pipe_configs = usbhsc_new_pipe;
-		priv->dparam.pipe_size = ARRAY_SIZE(usbhsc_new_pipe);
+		/* for backward compatibility check soc specific compatible */
+		if (of_device_is_compatible(pdev->dev.of_node, "renesas,usbhs-r9a07g043") ||
+		    of_device_is_compatible(pdev->dev.of_node, "renesas,usbhs-r9a07g044") ||
+		    of_device_is_compatible(pdev->dev.of_node, "renesas,usbhs-r9a07g054") ||
+		    of_device_is_compatible(pdev->dev.of_node, "renesas,rzg2l-usbhs")) {
+			priv->dparam.pipe_configs = usbhsc_rzg2l_pipe;
+			priv->dparam.pipe_size = ARRAY_SIZE(usbhsc_rzg2l_pipe);
+		} else {
+			priv->dparam.pipe_configs = usbhsc_new_pipe;
+			priv->dparam.pipe_size = ARRAY_SIZE(usbhsc_new_pipe);
+		}
 	} else if (!priv->dparam.pipe_configs) {
 		priv->dparam.pipe_configs = usbhsc_default_pipe;
 		priv->dparam.pipe_size = ARRAY_SIZE(usbhsc_default_pipe);
-- 
2.25.1


