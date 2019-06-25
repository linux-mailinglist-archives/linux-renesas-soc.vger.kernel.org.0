Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7B148522FE
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Jun 2019 07:39:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728311AbfFYFji (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 25 Jun 2019 01:39:38 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:1147 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728352AbfFYFjh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 25 Jun 2019 01:39:37 -0400
X-IronPort-AV: E=Sophos;i="5.62,413,1554735600"; 
   d="scan'208";a="19393838"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 25 Jun 2019 14:39:32 +0900
Received: from localhost.localdomain (unknown [10.166.17.210])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id D49324007F41;
        Tue, 25 Jun 2019 14:39:32 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     gregkh@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 10/13] usb: renesas_usbhs: move device tree properties parsing
Date:   Tue, 25 Jun 2019 14:38:54 +0900
Message-Id: <1561441137-3090-11-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1561441137-3090-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1561441137-3090-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

In the future, each struct renesas_usbhs_driver_param is stored on
the each platform related source code (e.g. rcar3.c) to remove
usbhs_parse_dt(). So, this patch moves device tree properties
parsing to usbhs_probe().

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/usb/renesas_usbhs/common.c | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/drivers/usb/renesas_usbhs/common.c b/drivers/usb/renesas_usbhs/common.c
index 379b4a0e..dc5e80d 100644
--- a/drivers/usb/renesas_usbhs/common.c
+++ b/drivers/usb/renesas_usbhs/common.c
@@ -628,8 +628,6 @@ static struct renesas_usbhs_platform_info *usbhs_parse_dt(struct device *dev)
 	struct renesas_usbhs_platform_info *info;
 	struct renesas_usbhs_driver_param *dparam;
 	const struct usbhs_of_data *data;
-	u32 tmp;
-	int gpio;
 
 	info = devm_kzalloc(dev, sizeof(*info), GFP_KERNEL);
 	if (!info)
@@ -643,13 +641,6 @@ static struct renesas_usbhs_platform_info *usbhs_parse_dt(struct device *dev)
 	*dparam = data->param;
 	info->platform_callback = *data->platform_callback;
 
-	if (!of_property_read_u32(dev_of_node(dev), "renesas,buswait", &tmp))
-		dparam->buswait_bwait = tmp;
-	gpio = of_get_named_gpio_flags(dev_of_node(dev), "renesas,enable-gpio",
-				       0, NULL);
-	if (gpio > 0)
-		dparam->enable_gpio = gpio;
-
 	return info;
 }
 
@@ -659,7 +650,8 @@ static int usbhs_probe(struct platform_device *pdev)
 	struct usbhs_priv *priv;
 	struct resource *res, *irq_res;
 	struct device *dev = &pdev->dev;
-	int ret;
+	int ret, gpio;
+	u32 tmp;
 
 	/* check device node */
 	if (dev_of_node(dev))
@@ -720,6 +712,12 @@ static int usbhs_probe(struct platform_device *pdev)
 	}
 	if (!priv->dparam.pio_dma_border)
 		priv->dparam.pio_dma_border = 64; /* 64byte */
+	if (!of_property_read_u32(dev_of_node(dev), "renesas,buswait", &tmp))
+		priv->dparam.buswait_bwait = tmp;
+	gpio = of_get_named_gpio_flags(dev_of_node(dev), "renesas,enable-gpio",
+				       0, NULL);
+	if (gpio > 0)
+		priv->dparam.enable_gpio = gpio;
 
 	/* FIXME */
 	/* runtime power control ? */
-- 
2.7.4

