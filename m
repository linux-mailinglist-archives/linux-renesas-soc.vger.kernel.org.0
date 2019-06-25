Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 71A4D522F3
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Jun 2019 07:39:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728379AbfFYFjh (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 25 Jun 2019 01:39:37 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:1147 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727064AbfFYFjg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 25 Jun 2019 01:39:36 -0400
X-IronPort-AV: E=Sophos;i="5.62,413,1554735600"; 
   d="scan'208";a="19393829"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 25 Jun 2019 14:39:32 +0900
Received: from localhost.localdomain (unknown [10.166.17.210])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 97B0A4005157;
        Tue, 25 Jun 2019 14:39:32 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     gregkh@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 05/13] usb: renesas_usbhs: Use a specific flag instead of type for multi_clks
Date:   Tue, 25 Jun 2019 14:38:49 +0900
Message-Id: <1561441137-3090-6-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1561441137-3090-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1561441137-3090-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

To remove the type of renesas_usbhs_driver_param in the future, this
patch uses a specific flag "multi_clks".

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/usb/renesas_usbhs/common.c | 8 +++-----
 include/linux/usb/renesas_usbhs.h  | 1 +
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/renesas_usbhs/common.c b/drivers/usb/renesas_usbhs/common.c
index 739fe4b..530e2eb7 100644
--- a/drivers/usb/renesas_usbhs/common.c
+++ b/drivers/usb/renesas_usbhs/common.c
@@ -288,11 +288,7 @@ static void usbhsc_set_buswait(struct usbhs_priv *priv)
 
 static bool usbhsc_is_multi_clks(struct usbhs_priv *priv)
 {
-	if (priv->dparam.type == USBHS_TYPE_RCAR_GEN3 ||
-	    priv->dparam.type == USBHS_TYPE_RCAR_GEN3_WITH_PLL)
-		return true;
-
-	return false;
+	return priv->dparam.multi_clks;
 }
 
 static int usbhsc_clk_get(struct device *dev, struct usbhs_priv *priv)
@@ -544,6 +540,7 @@ static const struct usbhs_of_data rcar_gen3_data = {
 	.param = {
 		.type = USBHS_TYPE_RCAR_GEN3,
 		.has_usb_dmac = 1,
+		.multi_clks = 1,
 		.pipe_configs = usbhsc_new_pipe,
 		.pipe_size = ARRAY_SIZE(usbhsc_new_pipe),
 	}
@@ -554,6 +551,7 @@ static const struct usbhs_of_data rcar_gen3_with_pll_data = {
 	.param = {
 		.type = USBHS_TYPE_RCAR_GEN3_WITH_PLL,
 		.has_usb_dmac = 1,
+		.multi_clks = 1,
 		.pipe_configs = usbhsc_new_pipe,
 		.pipe_size = ARRAY_SIZE(usbhsc_new_pipe),
 	}
diff --git a/include/linux/usb/renesas_usbhs.h b/include/linux/usb/renesas_usbhs.h
index ac601be..e249c21 100644
--- a/include/linux/usb/renesas_usbhs.h
+++ b/include/linux/usb/renesas_usbhs.h
@@ -181,6 +181,7 @@ struct renesas_usbhs_driver_param {
 	u32 has_cnen:1;
 	u32 cfifo_byte_addr:1; /* CFIFO is byte addressable */
 #define USBHS_USB_DMAC_XFER_SIZE	32	/* hardcode the xfer size */
+	u32 multi_clks:1;
 };
 
 #define USBHS_TYPE_RCAR_GEN2		1
-- 
2.7.4

