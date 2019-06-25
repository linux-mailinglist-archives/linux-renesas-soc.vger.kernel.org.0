Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1469A522F0
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Jun 2019 07:39:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728366AbfFYFjh (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 25 Jun 2019 01:39:37 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:12131 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728360AbfFYFjg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 25 Jun 2019 01:39:36 -0400
X-IronPort-AV: E=Sophos;i="5.62,413,1554735600"; 
   d="scan'208";a="19393832"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 25 Jun 2019 14:39:32 +0900
Received: from localhost.localdomain (unknown [10.166.17.210])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id B02614007F41;
        Tue, 25 Jun 2019 14:39:32 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     gregkh@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 07/13] usb: renesas_usbhs: Use dev_of_node macro instead of open coded
Date:   Tue, 25 Jun 2019 14:38:51 +0900
Message-Id: <1561441137-3090-8-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1561441137-3090-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1561441137-3090-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch uses the dev_of_node macro instead of open coded
to be better.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/usb/renesas_usbhs/common.c | 14 +++++++-------
 drivers/usb/renesas_usbhs/fifo.c   |  3 ++-
 2 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/renesas_usbhs/common.c b/drivers/usb/renesas_usbhs/common.c
index 1872756..35b06e7 100644
--- a/drivers/usb/renesas_usbhs/common.c
+++ b/drivers/usb/renesas_usbhs/common.c
@@ -297,7 +297,7 @@ static int usbhsc_clk_get(struct device *dev, struct usbhs_priv *priv)
 		return 0;
 
 	/* The first clock should exist */
-	priv->clks[0] = of_clk_get(dev->of_node, 0);
+	priv->clks[0] = of_clk_get(dev_of_node(dev), 0);
 	if (IS_ERR(priv->clks[0]))
 		return PTR_ERR(priv->clks[0]);
 
@@ -305,7 +305,7 @@ static int usbhsc_clk_get(struct device *dev, struct usbhs_priv *priv)
 	 * To backward compatibility with old DT, this driver checks the return
 	 * value if it's -ENOENT or not.
 	 */
-	priv->clks[1] = of_clk_get(dev->of_node, 1);
+	priv->clks[1] = of_clk_get(dev_of_node(dev), 1);
 	if (PTR_ERR(priv->clks[1]) == -ENOENT)
 		priv->clks[1] = NULL;
 	else if (IS_ERR(priv->clks[1]))
@@ -648,10 +648,10 @@ static struct renesas_usbhs_platform_info *usbhs_parse_dt(struct device *dev)
 	*dparam = data->param;
 	info->platform_callback = *data->platform_callback;
 
-	if (!of_property_read_u32(dev->of_node, "renesas,buswait", &tmp))
+	if (!of_property_read_u32(dev_of_node(dev), "renesas,buswait", &tmp))
 		dparam->buswait_bwait = tmp;
-	gpio = of_get_named_gpio_flags(dev->of_node, "renesas,enable-gpio", 0,
-				       NULL);
+	gpio = of_get_named_gpio_flags(dev_of_node(dev), "renesas,enable-gpio",
+				       0, NULL);
 	if (gpio > 0)
 		dparam->enable_gpio = gpio;
 
@@ -666,7 +666,7 @@ static int usbhs_probe(struct platform_device *pdev)
 	int ret;
 
 	/* check device node */
-	if (pdev->dev.of_node)
+	if (dev_of_node(&pdev->dev))
 		info = pdev->dev.platform_data = usbhs_parse_dt(&pdev->dev);
 
 	/* check platform information */
@@ -692,7 +692,7 @@ static int usbhs_probe(struct platform_device *pdev)
 	if (IS_ERR(priv->base))
 		return PTR_ERR(priv->base);
 
-	if (of_property_read_bool(pdev->dev.of_node, "extcon")) {
+	if (of_property_read_bool(dev_of_node(&pdev->dev), "extcon")) {
 		priv->edev = extcon_get_edev_by_phandle(&pdev->dev, 0);
 		if (IS_ERR(priv->edev))
 			return PTR_ERR(priv->edev);
diff --git a/drivers/usb/renesas_usbhs/fifo.c b/drivers/usb/renesas_usbhs/fifo.c
index e84d2ac2..a345b2e 100644
--- a/drivers/usb/renesas_usbhs/fifo.c
+++ b/drivers/usb/renesas_usbhs/fifo.c
@@ -3,6 +3,7 @@
  * Renesas USB driver
  *
  * Copyright (C) 2011 Renesas Solutions Corp.
+ * Copyright (C) 2019 Renesas Electronics Corporation
  * Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
  */
 #include <linux/delay.h>
@@ -1277,7 +1278,7 @@ static void usbhsf_dma_init(struct usbhs_priv *priv, struct usbhs_fifo *fifo,
 {
 	struct device *dev = usbhs_priv_to_dev(priv);
 
-	if (dev->of_node)
+	if (dev_of_node(dev))
 		usbhsf_dma_init_dt(dev, fifo, channel);
 	else
 		usbhsf_dma_init_pdev(fifo);
-- 
2.7.4

