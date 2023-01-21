Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4B5306766ED
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 21 Jan 2023 15:59:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229575AbjAUO7c (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 21 Jan 2023 09:59:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229811AbjAUO7b (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 21 Jan 2023 09:59:31 -0500
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id A58682195E;
        Sat, 21 Jan 2023 06:59:28 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.97,235,1669042800"; 
   d="scan'208";a="150151064"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 21 Jan 2023 23:59:28 +0900
Received: from localhost.localdomain (unknown [10.226.92.25])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 94C5342BC25E;
        Sat, 21 Jan 2023 23:59:25 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>, linux-usb@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v3 07/12] usb: host: xhci-plat: Improve clock handling in probe()
Date:   Sat, 21 Jan 2023 14:58:48 +0000
Message-Id: <20230121145853.4792-8-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230121145853.4792-1-biju.das.jz@bp.renesas.com>
References: <20230121145853.4792-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

It is always better to acquire all the clock resources first and
then do the clock operations.

This patch acquires all the optional clocks first and then calls
corresponding prepare_enable().

There is no functional change.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2->v3:
 * No change.
v1->v2:
 * Added Rb tag from Geert.
---
 drivers/usb/host/xhci-plat.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
index 5fb55bf19493..11b3a0d6722d 100644
--- a/drivers/usb/host/xhci-plat.c
+++ b/drivers/usb/host/xhci-plat.c
@@ -257,16 +257,16 @@ static int xhci_plat_probe(struct platform_device *pdev)
 		goto put_hcd;
 	}
 
-	ret = clk_prepare_enable(xhci->reg_clk);
-	if (ret)
-		goto put_hcd;
-
 	xhci->clk = devm_clk_get_optional(&pdev->dev, NULL);
 	if (IS_ERR(xhci->clk)) {
 		ret = PTR_ERR(xhci->clk);
-		goto disable_reg_clk;
+		goto put_hcd;
 	}
 
+	ret = clk_prepare_enable(xhci->reg_clk);
+	if (ret)
+		goto put_hcd;
+
 	ret = clk_prepare_enable(xhci->clk);
 	if (ret)
 		goto disable_reg_clk;
-- 
2.25.1

