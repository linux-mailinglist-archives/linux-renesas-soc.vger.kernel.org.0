Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7BCEC43B7F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Jun 2019 17:29:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727535AbfFMP3w (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 13 Jun 2019 11:29:52 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:22282 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728643AbfFMLTM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 13 Jun 2019 07:19:12 -0400
X-IronPort-AV: E=Sophos;i="5.62,369,1554735600"; 
   d="scan'208";a="18384428"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 13 Jun 2019 20:19:10 +0900
Received: from localhost.localdomain (unknown [10.166.17.210])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 86BC2427E065;
        Thu, 13 Jun 2019 20:19:10 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     gregkh@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH] usb: renesas_usbhs: Use struct assignment instead of memcpy()
Date:   Thu, 13 Jun 2019 20:18:48 +0900
Message-Id: <1560424728-13929-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

To avoid the error-proneness of calls to sizeof() in the memcpy,
this patch uses struct assignment instead of memcpy.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 This patch is based on Greg's linux-usb.git / usb-next branch.
 Note that mod_host.c also has memcpy but we cannot use struct assignment
 for it because the type of urb->setup_patcket is just "unsigned char *".

 drivers/usb/renesas_usbhs/common.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/drivers/usb/renesas_usbhs/common.c b/drivers/usb/renesas_usbhs/common.c
index a501ea6..ebbe322 100644
--- a/drivers/usb/renesas_usbhs/common.c
+++ b/drivers/usb/renesas_usbhs/common.c
@@ -651,9 +651,8 @@ static struct renesas_usbhs_platform_info *usbhs_parse_dt(struct device *dev)
 		return NULL;
 
 	dparam = &info->driver_param;
-	memcpy(dparam, &data->param, sizeof(data->param));
-	memcpy(&info->platform_callback, data->platform_callback,
-	       sizeof(*data->platform_callback));
+	*dparam = data->param;
+	info->platform_callback = *data->platform_callback;
 
 	if (!of_property_read_u32(dev->of_node, "renesas,buswait", &tmp))
 		dparam->buswait_bwait = tmp;
@@ -714,17 +713,13 @@ static int usbhs_probe(struct platform_device *pdev)
 	 * care platform info
 	 */
 
-	memcpy(&priv->dparam,
-	       &info->driver_param,
-	       sizeof(struct renesas_usbhs_driver_param));
+	priv->dparam = info->driver_param;
 
 	if (!info->platform_callback.get_id) {
 		dev_err(&pdev->dev, "no platform callbacks");
 		return -EINVAL;
 	}
-	memcpy(&priv->pfunc,
-	       &info->platform_callback,
-	       sizeof(struct renesas_usbhs_platform_callback));
+	priv->pfunc = info->platform_callback;
 
 	/* set driver callback functions for platform */
 	dfunc			= &info->driver_callback;
-- 
2.7.4

