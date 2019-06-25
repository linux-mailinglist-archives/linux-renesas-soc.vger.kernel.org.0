Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6C7C0522F9
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Jun 2019 07:39:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728408AbfFYFjj (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 25 Jun 2019 01:39:39 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:48886 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728372AbfFYFji (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 25 Jun 2019 01:39:38 -0400
X-IronPort-AV: E=Sophos;i="5.62,413,1554735600"; 
   d="scan'208";a="19607562"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 25 Jun 2019 14:39:32 +0900
Received: from localhost.localdomain (unknown [10.166.17.210])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id C8424400856C;
        Tue, 25 Jun 2019 14:39:32 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     gregkh@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 09/13] usb: renesas_usbhs: Add struct device * declaration in usbhs_probe()
Date:   Tue, 25 Jun 2019 14:38:53 +0900
Message-Id: <1561441137-3090-10-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1561441137-3090-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1561441137-3090-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Since this can remove over 80 charactors in a line, this patch adds
struct device * declaration in usbhs_probe().

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/usb/renesas_usbhs/common.c | 30 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/usb/renesas_usbhs/common.c b/drivers/usb/renesas_usbhs/common.c
index f9476a07..379b4a0e 100644
--- a/drivers/usb/renesas_usbhs/common.c
+++ b/drivers/usb/renesas_usbhs/common.c
@@ -658,27 +658,28 @@ static int usbhs_probe(struct platform_device *pdev)
 	struct renesas_usbhs_platform_info *info = renesas_usbhs_get_info(pdev);
 	struct usbhs_priv *priv;
 	struct resource *res, *irq_res;
+	struct device *dev = &pdev->dev;
 	int ret;
 
 	/* check device node */
-	if (dev_of_node(&pdev->dev))
+	if (dev_of_node(dev))
 		info = pdev->dev.platform_data = usbhs_parse_dt(&pdev->dev);
 
 	/* check platform information */
 	if (!info) {
-		dev_err(&pdev->dev, "no platform information\n");
+		dev_err(dev, "no platform information\n");
 		return -EINVAL;
 	}
 
 	/* platform data */
 	irq_res = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
 	if (!irq_res) {
-		dev_err(&pdev->dev, "Not enough Renesas USB platform resources.\n");
+		dev_err(dev, "Not enough Renesas USB platform resources.\n");
 		return -ENODEV;
 	}
 
 	/* usb private data */
-	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv)
 		return -ENOMEM;
 
@@ -687,13 +688,13 @@ static int usbhs_probe(struct platform_device *pdev)
 	if (IS_ERR(priv->base))
 		return PTR_ERR(priv->base);
 
-	if (of_property_read_bool(dev_of_node(&pdev->dev), "extcon")) {
-		priv->edev = extcon_get_edev_by_phandle(&pdev->dev, 0);
+	if (of_property_read_bool(dev_of_node(dev), "extcon")) {
+		priv->edev = extcon_get_edev_by_phandle(dev, 0);
 		if (IS_ERR(priv->edev))
 			return PTR_ERR(priv->edev);
 	}
 
-	priv->rsts = devm_reset_control_array_get_optional_shared(&pdev->dev);
+	priv->rsts = devm_reset_control_array_get_optional_shared(dev);
 	if (IS_ERR(priv->rsts))
 		return PTR_ERR(priv->rsts);
 
@@ -704,7 +705,7 @@ static int usbhs_probe(struct platform_device *pdev)
 	priv->dparam = info->driver_param;
 
 	if (!info->platform_callback.get_id) {
-		dev_err(&pdev->dev, "no platform callbacks");
+		dev_err(dev, "no platform callbacks\n");
 		return -EINVAL;
 	}
 	priv->pfunc = info->platform_callback;
@@ -755,7 +756,7 @@ static int usbhs_probe(struct platform_device *pdev)
 	if (ret)
 		goto probe_fail_rst;
 
-	ret = usbhsc_clk_get(&pdev->dev, priv);
+	ret = usbhsc_clk_get(dev, priv);
 	if (ret)
 		goto probe_fail_clks;
 
@@ -771,8 +772,7 @@ static int usbhs_probe(struct platform_device *pdev)
 		ret = !gpio_get_value(priv->dparam.enable_gpio);
 		gpio_free(priv->dparam.enable_gpio);
 		if (ret) {
-			dev_warn(&pdev->dev,
-				 "USB function not selected (GPIO %d)\n",
+			dev_warn(dev, "USB function not selected (GPIO %d)\n",
 				 priv->dparam.enable_gpio);
 			ret = -ENOTSUPP;
 			goto probe_end_mod_exit;
@@ -788,7 +788,7 @@ static int usbhs_probe(struct platform_device *pdev)
 	 */
 	ret = usbhs_platform_call(priv, hardware_init, pdev);
 	if (ret < 0) {
-		dev_err(&pdev->dev, "platform init failed.\n");
+		dev_err(dev, "platform init failed.\n");
 		goto probe_end_mod_exit;
 	}
 
@@ -796,7 +796,7 @@ static int usbhs_probe(struct platform_device *pdev)
 	usbhs_platform_call(priv, phy_reset, pdev);
 
 	/* power control */
-	pm_runtime_enable(&pdev->dev);
+	pm_runtime_enable(dev);
 	if (!usbhs_get_dparam(priv, runtime_pwctrl)) {
 		usbhsc_power_ctrl(priv, 1);
 		usbhs_mod_autonomy_mode(priv);
@@ -809,7 +809,7 @@ static int usbhs_probe(struct platform_device *pdev)
 	 */
 	usbhsc_schedule_notify_hotplug(pdev);
 
-	dev_info(&pdev->dev, "probed\n");
+	dev_info(dev, "probed\n");
 
 	return ret;
 
@@ -824,7 +824,7 @@ static int usbhs_probe(struct platform_device *pdev)
 probe_end_pipe_exit:
 	usbhs_pipe_remove(priv);
 
-	dev_info(&pdev->dev, "probe failed (%d)\n", ret);
+	dev_info(dev, "probe failed (%d)\n", ret);
 
 	return ret;
 }
-- 
2.7.4

