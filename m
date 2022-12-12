Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A356E64A5CD
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 Dec 2022 18:28:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232816AbiLLR2i (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 12 Dec 2022 12:28:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232958AbiLLR2e (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 12 Dec 2022 12:28:34 -0500
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 8FBF1FD00;
        Mon, 12 Dec 2022 09:28:32 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.96,239,1665414000"; 
   d="scan'208";a="143082651"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 13 Dec 2022 02:28:32 +0900
Received: from localhost.localdomain (unknown [10.226.93.82])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 80D46406F1D2;
        Tue, 13 Dec 2022 02:28:29 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH 06/16] usb: host: xhci-plat: Add reset support
Date:   Mon, 12 Dec 2022 17:27:54 +0000
Message-Id: <20221212172804.1277751-7-biju.das.jz@bp.renesas.com>
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

Add optional reset support. This is in preparation to adding USB xHCI
support for RZ/V2M SoC.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/usb/host/xhci-plat.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
index 11b3a0d6722d..c5fc175a5fd1 100644
--- a/drivers/usb/host/xhci-plat.c
+++ b/drivers/usb/host/xhci-plat.c
@@ -19,6 +19,7 @@
 #include <linux/slab.h>
 #include <linux/acpi.h>
 #include <linux/usb/of.h>
+#include <linux/reset.h>
 
 #include "xhci.h"
 #include "xhci-plat.h"
@@ -263,10 +264,20 @@ static int xhci_plat_probe(struct platform_device *pdev)
 		goto put_hcd;
 	}
 
-	ret = clk_prepare_enable(xhci->reg_clk);
+	xhci->reset = devm_reset_control_array_get_optional_shared(&pdev->dev);
+	if (IS_ERR(xhci->reset)) {
+		ret = PTR_ERR(xhci->reset);
+		goto put_hcd;
+	}
+
+	ret = reset_control_deassert(xhci->reset);
 	if (ret)
 		goto put_hcd;
 
+	ret = clk_prepare_enable(xhci->reg_clk);
+	if (ret)
+		goto err_reset;
+
 	ret = clk_prepare_enable(xhci->clk);
 	if (ret)
 		goto disable_reg_clk;
@@ -377,6 +388,9 @@ static int xhci_plat_probe(struct platform_device *pdev)
 disable_reg_clk:
 	clk_disable_unprepare(xhci->reg_clk);
 
+err_reset:
+	reset_control_assert(xhci->reset);
+
 put_hcd:
 	usb_put_hcd(hcd);
 
@@ -412,6 +426,7 @@ static int xhci_plat_remove(struct platform_device *dev)
 
 	clk_disable_unprepare(clk);
 	clk_disable_unprepare(reg_clk);
+	reset_control_assert(xhci->reset);
 	usb_put_hcd(hcd);
 
 	pm_runtime_disable(&dev->dev);
-- 
2.25.1

