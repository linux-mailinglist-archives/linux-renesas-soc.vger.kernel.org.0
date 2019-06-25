Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1234152303
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Jun 2019 07:39:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728441AbfFYFjp (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 25 Jun 2019 01:39:45 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:21682 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728362AbfFYFjh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 25 Jun 2019 01:39:37 -0400
X-IronPort-AV: E=Sophos;i="5.62,413,1554735600"; 
   d="scan'208";a="19393835"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 25 Jun 2019 14:39:32 +0900
Received: from localhost.localdomain (unknown [10.166.17.210])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id BC47740031EF;
        Tue, 25 Jun 2019 14:39:32 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     gregkh@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 08/13] usb: renesas_usbhs: Add has_new_pipe_configs flag
Date:   Tue, 25 Jun 2019 14:38:52 +0900
Message-Id: <1561441137-3090-9-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1561441137-3090-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1561441137-3090-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

In the future, each struct renesas_usbhs_driver_param is stored on
the each platform related source code (e.g. rcar3.c). So, to simplify
the source code, this patch adds a new flag has_new_pipe_configs.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/usb/renesas_usbhs/common.c | 20 +++++++++-----------
 include/linux/usb/renesas_usbhs.h  |  1 +
 2 files changed, 10 insertions(+), 11 deletions(-)

diff --git a/drivers/usb/renesas_usbhs/common.c b/drivers/usb/renesas_usbhs/common.c
index 35b06e7..f9476a07 100644
--- a/drivers/usb/renesas_usbhs/common.c
+++ b/drivers/usb/renesas_usbhs/common.c
@@ -529,8 +529,7 @@ static const struct usbhs_of_data rcar_gen2_data = {
 	.platform_callback = &usbhs_rcar2_ops,
 	.param = {
 		.has_usb_dmac = 1,
-		.pipe_configs = usbhsc_new_pipe,
-		.pipe_size = ARRAY_SIZE(usbhsc_new_pipe),
+		.has_new_pipe_configs = 1,
 	}
 };
 
@@ -539,8 +538,7 @@ static const struct usbhs_of_data rcar_gen3_data = {
 	.param = {
 		.has_usb_dmac = 1,
 		.multi_clks = 1,
-		.pipe_configs = usbhsc_new_pipe,
-		.pipe_size = ARRAY_SIZE(usbhsc_new_pipe),
+		.has_new_pipe_configs = 1,
 	}
 };
 
@@ -549,16 +547,14 @@ static const struct usbhs_of_data rcar_gen3_with_pll_data = {
 	.param = {
 		.has_usb_dmac = 1,
 		.multi_clks = 1,
-		.pipe_configs = usbhsc_new_pipe,
-		.pipe_size = ARRAY_SIZE(usbhsc_new_pipe),
+		.has_new_pipe_configs = 1,
 	}
 };
 
 static const struct usbhs_of_data rza1_data = {
 	.platform_callback = &usbhs_rza1_ops,
 	.param = {
-		.pipe_configs = usbhsc_new_pipe,
-		.pipe_size = ARRAY_SIZE(usbhsc_new_pipe),
+		.has_new_pipe_configs = 1,
 	}
 };
 
@@ -567,8 +563,7 @@ static const struct usbhs_of_data rza2_data = {
 	.param = {
 		.has_cnen = 1,
 		.cfifo_byte_addr = 1,
-		.pipe_configs = usbhsc_new_pipe,
-		.pipe_size = ARRAY_SIZE(usbhsc_new_pipe),
+		.has_new_pipe_configs = 1,
 	}
 };
 
@@ -715,7 +710,10 @@ static int usbhs_probe(struct platform_device *pdev)
 	priv->pfunc = info->platform_callback;
 
 	/* set default param if platform doesn't have */
-	if (!priv->dparam.pipe_configs) {
+	if (usbhs_get_dparam(priv, has_new_pipe_configs)) {
+		priv->dparam.pipe_configs = usbhsc_new_pipe;
+		priv->dparam.pipe_size = ARRAY_SIZE(usbhsc_new_pipe);
+	} else if (!priv->dparam.pipe_configs) {
 		priv->dparam.pipe_configs = usbhsc_default_pipe;
 		priv->dparam.pipe_size = ARRAY_SIZE(usbhsc_default_pipe);
 	}
diff --git a/include/linux/usb/renesas_usbhs.h b/include/linux/usb/renesas_usbhs.h
index fee84b7..6914475 100644
--- a/include/linux/usb/renesas_usbhs.h
+++ b/include/linux/usb/renesas_usbhs.h
@@ -181,6 +181,7 @@ struct renesas_usbhs_driver_param {
 	u32 cfifo_byte_addr:1; /* CFIFO is byte addressable */
 #define USBHS_USB_DMAC_XFER_SIZE	32	/* hardcode the xfer size */
 	u32 multi_clks:1;
+	u32 has_new_pipe_configs:1;
 };
 
 /*
-- 
2.7.4

