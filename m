Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AA4CD66867F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Jan 2023 23:10:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240526AbjALWJx (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 12 Jan 2023 17:09:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240130AbjALWJE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 12 Jan 2023 17:09:04 -0500
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 32D953FA3D;
        Thu, 12 Jan 2023 13:59:40 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.97,212,1669042800"; 
   d="scan'208";a="146137088"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 13 Jan 2023 06:59:39 +0900
Received: from localhost.localdomain (unknown [10.226.92.132])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 8C1FF400A8BB;
        Fri, 13 Jan 2023 06:59:36 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>, linux-usb@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 07/12] usb: host: xhci-plat: Improve clock handling in probe()
Date:   Thu, 12 Jan 2023 21:59:01 +0000
Message-Id: <20230112215906.494394-8-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230112215906.494394-1-biju.das.jz@bp.renesas.com>
References: <20230112215906.494394-1-biju.das.jz@bp.renesas.com>
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

