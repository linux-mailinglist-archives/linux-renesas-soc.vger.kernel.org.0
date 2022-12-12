Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D9CB364A5D7
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 Dec 2022 18:29:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233003AbiLLR3C (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 12 Dec 2022 12:29:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232950AbiLLR2w (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 12 Dec 2022 12:28:52 -0500
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 2FFBF13E25;
        Mon, 12 Dec 2022 09:28:47 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.96,239,1665414000"; 
   d="scan'208";a="143082687"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 13 Dec 2022 02:28:46 +0900
Received: from localhost.localdomain (unknown [10.226.93.82])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 325AC406F1D1;
        Tue, 13 Dec 2022 02:28:43 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Adam Ford <aford173@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        linux-usb@vger.kernel.org,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH 10/16] usb: gadget: udc: renesas_usb3: Remove drd_reset handling
Date:   Mon, 12 Dec 2022 17:27:58 +0000
Message-Id: <20221212172804.1277751-11-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221212172804.1277751-1-biju.das.jz@bp.renesas.com>
References: <20221212172804.1277751-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

As we have now support for DRD reset support in USB3DRD driver,
remove the redundant reset handling from peri module.

This patch drops the unused macros DRD_CON_PERI_RST and DRD_CON_HOST_RST.

Whilst, update reset handling for peripheral reset as per bindings
(ie, as it is a single reset, drop reset names).

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/usb/gadget/udc/renesas_usb3.c | 25 ++++---------------------
 1 file changed, 4 insertions(+), 21 deletions(-)

diff --git a/drivers/usb/gadget/udc/renesas_usb3.c b/drivers/usb/gadget/udc/renesas_usb3.c
index 615ba0a6fbee..af29de32e08b 100644
--- a/drivers/usb/gadget/udc/renesas_usb3.c
+++ b/drivers/usb/gadget/udc/renesas_usb3.c
@@ -20,6 +20,7 @@
 #include <linux/reset.h>
 #include <linux/sizes.h>
 #include <linux/slab.h>
+#include <linux/soc/renesas/rzv2m_usb3drd.h>
 #include <linux/string.h>
 #include <linux/sys_soc.h>
 #include <linux/uaccess.h>
@@ -136,8 +137,6 @@
 #define USB_STA_VBUS_STA	BIT(0)
 
 /* DRD_CON */
-#define DRD_CON_PERI_RST	BIT(31)		/* rzv2m only */
-#define DRD_CON_HOST_RST	BIT(30)		/* rzv2m only */
 #define DRD_CON_PERI_CON	BIT(24)
 #define DRD_CON_VBOUT		BIT(0)
 
@@ -334,7 +333,6 @@ struct renesas_usb3_priv {
 
 struct renesas_usb3 {
 	void __iomem *reg;
-	struct reset_control *drd_rstc;
 	struct reset_control *usbp_rstc;
 
 	struct usb_gadget gadget;
@@ -682,13 +680,8 @@ static void renesas_usb3_role_work(struct work_struct *work)
 static void usb3_set_mode(struct renesas_usb3 *usb3, bool host)
 {
 	if (usb3->is_rzv2m) {
-		if (host) {
-			usb3_set_bit(usb3, DRD_CON_PERI_RST, USB3_DRD_CON(usb3));
-			usb3_clear_bit(usb3, DRD_CON_HOST_RST, USB3_DRD_CON(usb3));
-		} else {
-			usb3_set_bit(usb3, DRD_CON_HOST_RST, USB3_DRD_CON(usb3));
-			usb3_clear_bit(usb3, DRD_CON_PERI_RST, USB3_DRD_CON(usb3));
-		}
+		rzv2m_usb3drd_reset(usb3_to_dev(usb3)->parent, host);
+		return;
 	}
 
 	if (host)
@@ -2600,7 +2593,6 @@ static int renesas_usb3_remove(struct platform_device *pdev)
 
 	usb_del_gadget_udc(&usb3->gadget);
 	reset_control_assert(usb3->usbp_rstc);
-	reset_control_assert(usb3->drd_rstc);
 	renesas_usb3_dma_free_prd(usb3, &pdev->dev);
 
 	__renesas_usb3_ep_free_request(usb3->ep0_req);
@@ -2873,21 +2865,13 @@ static int renesas_usb3_probe(struct platform_device *pdev)
 		goto err_add_udc;
 	}
 
-	usb3->drd_rstc = devm_reset_control_get_optional_shared(&pdev->dev,
-								"drd_reset");
-	if (IS_ERR(usb3->drd_rstc)) {
-		ret = PTR_ERR(usb3->drd_rstc);
-		goto err_add_udc;
-	}
-
 	usb3->usbp_rstc = devm_reset_control_get_optional_shared(&pdev->dev,
-								 "aresetn_p");
+								 NULL);
 	if (IS_ERR(usb3->usbp_rstc)) {
 		ret = PTR_ERR(usb3->usbp_rstc);
 		goto err_add_udc;
 	}
 
-	reset_control_deassert(usb3->drd_rstc);
 	reset_control_deassert(usb3->usbp_rstc);
 
 	pm_runtime_enable(&pdev->dev);
@@ -2933,7 +2917,6 @@ static int renesas_usb3_probe(struct platform_device *pdev)
 
 err_reset:
 	reset_control_assert(usb3->usbp_rstc);
-	reset_control_assert(usb3->drd_rstc);
 
 err_add_udc:
 	renesas_usb3_dma_free_prd(usb3, &pdev->dev);
-- 
2.25.1

