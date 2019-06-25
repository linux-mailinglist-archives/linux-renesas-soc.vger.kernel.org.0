Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E0E2B522FB
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Jun 2019 07:39:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728428AbfFYFjl (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 25 Jun 2019 01:39:41 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:12131 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728365AbfFYFji (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 25 Jun 2019 01:39:38 -0400
X-IronPort-AV: E=Sophos;i="5.62,413,1554735600"; 
   d="scan'208";a="19393841"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 25 Jun 2019 14:39:33 +0900
Received: from localhost.localdomain (unknown [10.166.17.210])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id ED7DD4007F41;
        Tue, 25 Jun 2019 14:39:32 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     gregkh@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 12/13] usb: renesas_usbhs: Use renesas_usbhs_platform_info on of_device_id.data
Date:   Tue, 25 Jun 2019 14:38:56 +0900
Message-Id: <1561441137-3090-13-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1561441137-3090-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1561441137-3090-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

In device tree environment, the previous code allocates
renesas_usbhs_platform_info by using devm_kzalloc() and then copies
usbhs_of_data to the allocated memory. This reason is some values
(e.g. .platform_callback.get_vbus) are overwritten by the driver,
but the of_device_id.data is "const". Now the driver doesn't have
such a code, so this patch uses renesas_usbhs_platform_info on
of_device_id.data.

Note that the previous code set the pdev->dev.platform_data pointer
even if device tree environment, but the value is not used. So,
this patch also remove such a code.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/usb/renesas_usbhs/common.c | 93 +++++++-------------------------------
 drivers/usb/renesas_usbhs/common.h |  5 --
 drivers/usb/renesas_usbhs/rcar2.c  | 16 +++++--
 drivers/usb/renesas_usbhs/rcar2.h  |  3 +-
 drivers/usb/renesas_usbhs/rcar3.c  | 26 ++++++++---
 drivers/usb/renesas_usbhs/rcar3.h  |  5 +-
 drivers/usb/renesas_usbhs/rza.c    | 11 +++--
 drivers/usb/renesas_usbhs/rza.h    |  4 +-
 drivers/usb/renesas_usbhs/rza2.c   | 17 +++++--
 9 files changed, 73 insertions(+), 107 deletions(-)

diff --git a/drivers/usb/renesas_usbhs/common.c b/drivers/usb/renesas_usbhs/common.c
index 656f976..fe7dc91 100644
--- a/drivers/usb/renesas_usbhs/common.c
+++ b/drivers/usb/renesas_usbhs/common.c
@@ -530,128 +530,65 @@ int usbhsc_schedule_notify_hotplug(struct platform_device *pdev)
 	return 0;
 }
 
-static const struct usbhs_of_data rcar_gen2_data = {
-	.platform_callback = &usbhs_rcar2_ops,
-	.param = {
-		.has_usb_dmac = 1,
-		.has_new_pipe_configs = 1,
-	}
-};
-
-static const struct usbhs_of_data rcar_gen3_data = {
-	.platform_callback = &usbhs_rcar3_ops,
-	.param = {
-		.has_usb_dmac = 1,
-		.multi_clks = 1,
-		.has_new_pipe_configs = 1,
-	}
-};
-
-static const struct usbhs_of_data rcar_gen3_with_pll_data = {
-	.platform_callback = &usbhs_rcar3_with_pll_ops,
-	.param = {
-		.has_usb_dmac = 1,
-		.multi_clks = 1,
-		.has_new_pipe_configs = 1,
-	}
-};
-
-static const struct usbhs_of_data rza1_data = {
-	.platform_callback = &usbhs_rza1_ops,
-	.param = {
-		.has_new_pipe_configs = 1,
-	}
-};
-
-static const struct usbhs_of_data rza2_data = {
-	.platform_callback = &usbhs_rza2_ops,
-	.param = {
-		.has_cnen = 1,
-		.cfifo_byte_addr = 1,
-		.has_new_pipe_configs = 1,
-	}
-};
-
 /*
  *		platform functions
  */
 static const struct of_device_id usbhs_of_match[] = {
 	{
 		.compatible = "renesas,usbhs-r8a774c0",
-		.data = &rcar_gen3_with_pll_data,
+		.data = &usbhs_rcar_gen3_with_pll_plat_info,
 	},
 	{
 		.compatible = "renesas,usbhs-r8a7790",
-		.data = &rcar_gen2_data,
+		.data = &usbhs_rcar_gen2_plat_info,
 	},
 	{
 		.compatible = "renesas,usbhs-r8a7791",
-		.data = &rcar_gen2_data,
+		.data = &usbhs_rcar_gen2_plat_info,
 	},
 	{
 		.compatible = "renesas,usbhs-r8a7794",
-		.data = &rcar_gen2_data,
+		.data = &usbhs_rcar_gen2_plat_info,
 	},
 	{
 		.compatible = "renesas,usbhs-r8a7795",
-		.data = &rcar_gen3_data,
+		.data = &usbhs_rcar_gen3_plat_info,
 	},
 	{
 		.compatible = "renesas,usbhs-r8a7796",
-		.data = &rcar_gen3_data,
+		.data = &usbhs_rcar_gen3_plat_info,
 	},
 	{
 		.compatible = "renesas,usbhs-r8a77990",
-		.data = &rcar_gen3_with_pll_data,
+		.data = &usbhs_rcar_gen3_with_pll_plat_info,
 	},
 	{
 		.compatible = "renesas,usbhs-r8a77995",
-		.data = &rcar_gen3_with_pll_data,
+		.data = &usbhs_rcar_gen3_with_pll_plat_info,
 	},
 	{
 		.compatible = "renesas,rcar-gen2-usbhs",
-		.data = &rcar_gen2_data,
+		.data = &usbhs_rcar_gen2_plat_info,
 	},
 	{
 		.compatible = "renesas,rcar-gen3-usbhs",
-		.data = &rcar_gen3_data,
+		.data = &usbhs_rcar_gen3_plat_info,
 	},
 	{
 		.compatible = "renesas,rza1-usbhs",
-		.data = &rza1_data,
+		.data = &usbhs_rza1_plat_info,
 	},
 	{
 		.compatible = "renesas,rza2-usbhs",
-		.data = &rza2_data,
+		.data = &usbhs_rza2_plat_info,
 	},
 	{ },
 };
 MODULE_DEVICE_TABLE(of, usbhs_of_match);
 
-static struct renesas_usbhs_platform_info *usbhs_parse_dt(struct device *dev)
-{
-	struct renesas_usbhs_platform_info *info;
-	struct renesas_usbhs_driver_param *dparam;
-	const struct usbhs_of_data *data;
-
-	info = devm_kzalloc(dev, sizeof(*info), GFP_KERNEL);
-	if (!info)
-		return NULL;
-
-	data = of_device_get_match_data(dev);
-	if (!data)
-		return NULL;
-
-	dparam = &info->driver_param;
-	*dparam = data->param;
-	info->platform_callback = *data->platform_callback;
-
-	return info;
-}
-
 static int usbhs_probe(struct platform_device *pdev)
 {
-	struct renesas_usbhs_platform_info *info = renesas_usbhs_get_info(pdev);
+	const struct renesas_usbhs_platform_info *info;
 	struct usbhs_priv *priv;
 	struct resource *res, *irq_res;
 	struct device *dev = &pdev->dev;
@@ -660,7 +597,9 @@ static int usbhs_probe(struct platform_device *pdev)
 
 	/* check device node */
 	if (dev_of_node(dev))
-		info = pdev->dev.platform_data = usbhs_parse_dt(&pdev->dev);
+		info = of_device_get_match_data(dev);
+	else
+		info = renesas_usbhs_get_info(pdev);
 
 	/* check platform information */
 	if (!info) {
diff --git a/drivers/usb/renesas_usbhs/common.h b/drivers/usb/renesas_usbhs/common.h
index 65e9abc..f6ffdb2 100644
--- a/drivers/usb/renesas_usbhs/common.h
+++ b/drivers/usb/renesas_usbhs/common.h
@@ -282,11 +282,6 @@ struct usbhs_priv {
 	struct clk *clks[2];
 };
 
-struct usbhs_of_data {
-	const struct renesas_usbhs_platform_callback	*platform_callback;
-	const struct renesas_usbhs_driver_param		param;
-};
-
 /*
  * common
  */
diff --git a/drivers/usb/renesas_usbhs/rcar2.c b/drivers/usb/renesas_usbhs/rcar2.c
index 741bd81..440d213 100644
--- a/drivers/usb/renesas_usbhs/rcar2.c
+++ b/drivers/usb/renesas_usbhs/rcar2.c
@@ -63,9 +63,15 @@ static int usbhs_rcar2_power_ctrl(struct platform_device *pdev,
 	return retval;
 }
 
-const struct renesas_usbhs_platform_callback usbhs_rcar2_ops = {
-	.hardware_init = usbhs_rcar2_hardware_init,
-	.hardware_exit = usbhs_rcar2_hardware_exit,
-	.power_ctrl = usbhs_rcar2_power_ctrl,
-	.get_id = usbhs_get_id_as_gadget,
+const struct renesas_usbhs_platform_info usbhs_rcar_gen2_plat_info = {
+	.platform_callback = {
+		.hardware_init = usbhs_rcar2_hardware_init,
+		.hardware_exit = usbhs_rcar2_hardware_exit,
+		.power_ctrl = usbhs_rcar2_power_ctrl,
+		.get_id = usbhs_get_id_as_gadget,
+	},
+	.driver_param = {
+		.has_usb_dmac = 1,
+		.has_new_pipe_configs = 1,
+	},
 };
diff --git a/drivers/usb/renesas_usbhs/rcar2.h b/drivers/usb/renesas_usbhs/rcar2.h
index 45e3526..7d88732 100644
--- a/drivers/usb/renesas_usbhs/rcar2.h
+++ b/drivers/usb/renesas_usbhs/rcar2.h
@@ -1,5 +1,4 @@
 // SPDX-License-Identifier: GPL-2.0
 #include "common.h"
 
-extern const struct renesas_usbhs_platform_callback
-	usbhs_rcar2_ops;
+extern const struct renesas_usbhs_platform_info usbhs_rcar_gen2_plat_info;
diff --git a/drivers/usb/renesas_usbhs/rcar3.c b/drivers/usb/renesas_usbhs/rcar3.c
index 8dbbd14..c181b2a 100644
--- a/drivers/usb/renesas_usbhs/rcar3.c
+++ b/drivers/usb/renesas_usbhs/rcar3.c
@@ -95,12 +95,26 @@ static int usbhs_rcar3_power_and_pll_ctrl(struct platform_device *pdev,
 	return 0;
 }
 
-const struct renesas_usbhs_platform_callback usbhs_rcar3_ops = {
-	.power_ctrl = usbhs_rcar3_power_ctrl,
-	.get_id = usbhs_get_id_as_gadget,
+const struct renesas_usbhs_platform_info usbhs_rcar_gen3_plat_info = {
+	.platform_callback = {
+		.power_ctrl = usbhs_rcar3_power_ctrl,
+		.get_id = usbhs_get_id_as_gadget,
+	},
+	.driver_param = {
+		.has_usb_dmac = 1,
+		.multi_clks = 1,
+		.has_new_pipe_configs = 1,
+	},
 };
 
-const struct renesas_usbhs_platform_callback usbhs_rcar3_with_pll_ops = {
-	.power_ctrl = usbhs_rcar3_power_and_pll_ctrl,
-	.get_id = usbhs_get_id_as_gadget,
+const struct renesas_usbhs_platform_info usbhs_rcar_gen3_with_pll_plat_info = {
+	.platform_callback = {
+		.power_ctrl = usbhs_rcar3_power_and_pll_ctrl,
+		.get_id = usbhs_get_id_as_gadget,
+	},
+	.driver_param = {
+		.has_usb_dmac = 1,
+		.multi_clks = 1,
+		.has_new_pipe_configs = 1,
+	},
 };
diff --git a/drivers/usb/renesas_usbhs/rcar3.h b/drivers/usb/renesas_usbhs/rcar3.h
index 49e535a..c7c5ec1 100644
--- a/drivers/usb/renesas_usbhs/rcar3.h
+++ b/drivers/usb/renesas_usbhs/rcar3.h
@@ -1,5 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 #include "common.h"
 
-extern const struct renesas_usbhs_platform_callback usbhs_rcar3_ops;
-extern const struct renesas_usbhs_platform_callback usbhs_rcar3_with_pll_ops;
+extern const struct renesas_usbhs_platform_info usbhs_rcar_gen3_plat_info;
+extern const struct renesas_usbhs_platform_info
+					usbhs_rcar_gen3_with_pll_plat_info;
diff --git a/drivers/usb/renesas_usbhs/rza.c b/drivers/usb/renesas_usbhs/rza.c
index 64ce584..24de64edb 100644
--- a/drivers/usb/renesas_usbhs/rza.c
+++ b/drivers/usb/renesas_usbhs/rza.c
@@ -41,7 +41,12 @@ static int usbhs_rza1_hardware_init(struct platform_device *pdev)
 	return 0;
 }
 
-const struct renesas_usbhs_platform_callback usbhs_rza1_ops = {
-	.hardware_init = usbhs_rza1_hardware_init,
-	.get_id = usbhs_get_id_as_gadget,
+const struct renesas_usbhs_platform_info usbhs_rza1_plat_info = {
+	.platform_callback = {
+		.hardware_init = usbhs_rza1_hardware_init,
+		.get_id = usbhs_get_id_as_gadget,
+	},
+	.driver_param = {
+		.has_new_pipe_configs = 1,
+	},
 };
diff --git a/drivers/usb/renesas_usbhs/rza.h b/drivers/usb/renesas_usbhs/rza.h
index 073a53d..1ca42a6 100644
--- a/drivers/usb/renesas_usbhs/rza.h
+++ b/drivers/usb/renesas_usbhs/rza.h
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0
 #include "common.h"
 
-extern const struct renesas_usbhs_platform_callback usbhs_rza1_ops;
-extern const struct renesas_usbhs_platform_callback usbhs_rza2_ops;
+extern const struct renesas_usbhs_platform_info usbhs_rza1_plat_info;
+extern const struct renesas_usbhs_platform_info usbhs_rza2_plat_info;
diff --git a/drivers/usb/renesas_usbhs/rza2.c b/drivers/usb/renesas_usbhs/rza2.c
index 6e32768..0217495 100644
--- a/drivers/usb/renesas_usbhs/rza2.c
+++ b/drivers/usb/renesas_usbhs/rza2.c
@@ -59,9 +59,16 @@ static int usbhs_rza2_power_ctrl(struct platform_device *pdev,
 	return retval;
 }
 
-const struct renesas_usbhs_platform_callback usbhs_rza2_ops = {
-	.hardware_init = usbhs_rza2_hardware_init,
-	.hardware_exit = usbhs_rza2_hardware_exit,
-	.power_ctrl = usbhs_rza2_power_ctrl,
-	.get_id = usbhs_get_id_as_gadget,
+const struct renesas_usbhs_platform_info usbhs_rza2_plat_info = {
+	.platform_callback = {
+		.hardware_init = usbhs_rza2_hardware_init,
+		.hardware_exit = usbhs_rza2_hardware_exit,
+		.power_ctrl = usbhs_rza2_power_ctrl,
+		.get_id = usbhs_get_id_as_gadget,
+	},
+	.driver_param = {
+		.has_cnen = 1,
+		.cfifo_byte_addr = 1,
+		.has_new_pipe_configs = 1,
+	},
 };
-- 
2.7.4

