Return-Path: <linux-renesas-soc+bounces-3815-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 497A587D3C1
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 Mar 2024 19:40:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B8C051F24334
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 Mar 2024 18:40:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CBB81BC27;
	Fri, 15 Mar 2024 18:39:48 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90F0043AC5;
	Fri, 15 Mar 2024 18:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710527988; cv=none; b=U+arDIfN9SVBtCky6tasAyp4K5OlLaRxdFmvq0TgoukgXTPx1Mq3y9xnExc/3qCPaL3G26Hth53wGNobskBn4P7s+F1V4uyl7/5uVLeqdcqUQOQ0kBXXielhAGyL3SWj3lt3RFJIOxlX45FFhzxfzvKujIMebZoPbo0zWFZy/0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710527988; c=relaxed/simple;
	bh=5mKg1D2/N9WmO+ZmUupePx/E4JWaLPFDqevm1TsLp5c=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=YhWKU6+NtLg39Rd+B3qskzt3IFebO0eeTTSc81dAygi3VnNVhkzab7RUb80pmiVNEsv0Tkonk6UN6KwD+qJo86Oorimt+o0/3pNgnTSBcB7plbAb3AjTcvIOsbLLgoHCbUdq/94JH91AFLtYtJNeHTYNF8U7E55psgxzD68+NC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.07,129,1708354800"; 
   d="scan'208";a="197917687"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 16 Mar 2024 03:39:43 +0900
Received: from localhost.localdomain (unknown [10.226.93.102])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id F1E0F4066237;
	Sat, 16 Mar 2024 03:39:39 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	linux-usb@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v3 4/7] usb: renesas_usbhs: Drop has_new_pipe_configs from struct renesas_usbhs_driver_param
Date: Fri, 15 Mar 2024 18:39:18 +0000
Message-Id: <20240315183921.375751-5-biju.das.jz@bp.renesas.com>
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

Drop has_new_pipe_configs variable from struct renesas_usbhs_driver_param
and use info for getting device pipe configuration data by renaming
usbhs_new_pipe[]->usbhs_rcar_pipe[] and changing the static qualifier to
global so that struct renesas_usbhs_platform_info can be filled by
respective devices.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v3:
 * New patch
---
 drivers/usb/renesas_usbhs/common.c | 9 ++++-----
 drivers/usb/renesas_usbhs/common.h | 2 ++
 drivers/usb/renesas_usbhs/rcar2.c  | 3 ++-
 drivers/usb/renesas_usbhs/rcar3.c  | 6 ++++--
 drivers/usb/renesas_usbhs/rza.c    | 3 ++-
 drivers/usb/renesas_usbhs/rza2.c   | 3 ++-
 include/linux/usb/renesas_usbhs.h  | 1 -
 7 files changed, 16 insertions(+), 11 deletions(-)

diff --git a/drivers/usb/renesas_usbhs/common.c b/drivers/usb/renesas_usbhs/common.c
index 177fa3144a47..013bc1583610 100644
--- a/drivers/usb/renesas_usbhs/common.c
+++ b/drivers/usb/renesas_usbhs/common.c
@@ -378,7 +378,7 @@ static struct renesas_usbhs_driver_pipe_config usbhsc_default_pipe[] = {
 };
 
 /* commonly used on newer SH-Mobile and R-Car SoCs */
-static struct renesas_usbhs_driver_pipe_config usbhsc_new_pipe[] = {
+struct renesas_usbhs_driver_pipe_config usbhsc_rcar_pipe[] = {
 	RENESAS_USBHS_PIPE(USB_ENDPOINT_XFER_CONTROL, 64, 0x00, false),
 	RENESAS_USBHS_PIPE(USB_ENDPOINT_XFER_ISOC, 1024, 0x08, true),
 	RENESAS_USBHS_PIPE(USB_ENDPOINT_XFER_ISOC, 1024, 0x28, true),
@@ -639,10 +639,9 @@ static int usbhs_probe(struct platform_device *pdev)
 	priv->pfunc = &info->platform_callback;
 
 	/* set default param if platform doesn't have */
-	if (usbhs_get_dparam(priv, has_new_pipe_configs)) {
-		priv->dparam.pipe_configs = usbhsc_new_pipe;
-		priv->dparam.pipe_size = ARRAY_SIZE(usbhsc_new_pipe);
-	} else if (!priv->dparam.pipe_configs) {
+	priv->dparam.pipe_configs = info->driver_param.pipe_configs;
+	priv->dparam.pipe_size = info->driver_param.pipe_size;
+	if (!priv->dparam.pipe_configs) {
 		priv->dparam.pipe_configs = usbhsc_default_pipe;
 		priv->dparam.pipe_size = ARRAY_SIZE(usbhsc_default_pipe);
 	}
diff --git a/drivers/usb/renesas_usbhs/common.h b/drivers/usb/renesas_usbhs/common.h
index 3fb5bc94dc0d..f6f527ca9b45 100644
--- a/drivers/usb/renesas_usbhs/common.h
+++ b/drivers/usb/renesas_usbhs/common.h
@@ -343,4 +343,6 @@ struct usbhs_priv *usbhs_pdev_to_priv(struct platform_device *pdev);
 #define usbhs_priv_to_dev(priv)		(&priv->pdev->dev)
 #define usbhs_priv_to_lock(priv)	(&priv->lock)
 
+extern struct renesas_usbhs_driver_pipe_config usbhsc_rcar_pipe[];
+
 #endif /* RENESAS_USB_DRIVER_H */
diff --git a/drivers/usb/renesas_usbhs/rcar2.c b/drivers/usb/renesas_usbhs/rcar2.c
index 52756fc2ac9c..170584f8de74 100644
--- a/drivers/usb/renesas_usbhs/rcar2.c
+++ b/drivers/usb/renesas_usbhs/rcar2.c
@@ -69,7 +69,8 @@ const struct renesas_usbhs_platform_info usbhs_rcar_gen2_plat_info = {
 		.get_id = usbhs_get_id_as_gadget,
 	},
 	.driver_param = {
+		.pipe_configs = usbhsc_rcar_pipe,
+		.pipe_size = 16,
 		.has_usb_dmac = 1,
-		.has_new_pipe_configs = 1,
 	},
 };
diff --git a/drivers/usb/renesas_usbhs/rcar3.c b/drivers/usb/renesas_usbhs/rcar3.c
index c181b2a0b9d3..da5c013cfd07 100644
--- a/drivers/usb/renesas_usbhs/rcar3.c
+++ b/drivers/usb/renesas_usbhs/rcar3.c
@@ -101,9 +101,10 @@ const struct renesas_usbhs_platform_info usbhs_rcar_gen3_plat_info = {
 		.get_id = usbhs_get_id_as_gadget,
 	},
 	.driver_param = {
+		.pipe_configs = usbhsc_rcar_pipe,
+		.pipe_size = 16,
 		.has_usb_dmac = 1,
 		.multi_clks = 1,
-		.has_new_pipe_configs = 1,
 	},
 };
 
@@ -113,8 +114,9 @@ const struct renesas_usbhs_platform_info usbhs_rcar_gen3_with_pll_plat_info = {
 		.get_id = usbhs_get_id_as_gadget,
 	},
 	.driver_param = {
+		.pipe_configs = usbhsc_rcar_pipe,
+		.pipe_size = 16,
 		.has_usb_dmac = 1,
 		.multi_clks = 1,
-		.has_new_pipe_configs = 1,
 	},
 };
diff --git a/drivers/usb/renesas_usbhs/rza.c b/drivers/usb/renesas_usbhs/rza.c
index 97b5217c5a90..91c1971c3949 100644
--- a/drivers/usb/renesas_usbhs/rza.c
+++ b/drivers/usb/renesas_usbhs/rza.c
@@ -51,6 +51,7 @@ const struct renesas_usbhs_platform_info usbhs_rza1_plat_info = {
 		.get_id = usbhs_get_id_as_gadget,
 	},
 	.driver_param = {
-		.has_new_pipe_configs = 1,
+		.pipe_configs = usbhsc_rcar_pipe,
+		.pipe_size = 16,
 	},
 };
diff --git a/drivers/usb/renesas_usbhs/rza2.c b/drivers/usb/renesas_usbhs/rza2.c
index f079817250bb..f6660628eea9 100644
--- a/drivers/usb/renesas_usbhs/rza2.c
+++ b/drivers/usb/renesas_usbhs/rza2.c
@@ -66,8 +66,9 @@ const struct renesas_usbhs_platform_info usbhs_rza2_plat_info = {
 		.get_id = usbhs_get_id_as_gadget,
 	},
 	.driver_param = {
+		.pipe_configs = usbhsc_rcar_pipe,
+		.pipe_size = 16,
 		.has_cnen = 1,
 		.cfifo_byte_addr = 1,
-		.has_new_pipe_configs = 1,
 	},
 };
diff --git a/include/linux/usb/renesas_usbhs.h b/include/linux/usb/renesas_usbhs.h
index 372898d9eeb0..41f58cfbd876 100644
--- a/include/linux/usb/renesas_usbhs.h
+++ b/include/linux/usb/renesas_usbhs.h
@@ -169,7 +169,6 @@ struct renesas_usbhs_driver_param {
 	u32 cfifo_byte_addr:1; /* CFIFO is byte addressable */
 #define USBHS_USB_DMAC_XFER_SIZE	32	/* hardcode the xfer size */
 	u32 multi_clks:1;
-	u32 has_new_pipe_configs:1;
 };
 
 /*
-- 
2.25.1


