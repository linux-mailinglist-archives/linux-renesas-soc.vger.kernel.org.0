Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C89571288C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 May 2023 16:37:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237436AbjEZOhj (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 26 May 2023 10:37:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243748AbjEZOhh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 26 May 2023 10:37:37 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id C19D3E42;
        Fri, 26 May 2023 07:37:17 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="6.00,194,1681138800"; 
   d="scan'208";a="160957158"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 26 May 2023 23:36:20 +0900
Received: from localhost.localdomain (unknown [10.226.93.166])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 60F9F4009BE8;
        Fri, 26 May 2023 23:36:17 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Zheng Wang <zyytlz.wz@163.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-usb@vger.kernel.org,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH] usb: gadget: udc: renesas_usb3: Fix RZ/V2M {modprobe,bind} error
Date:   Fri, 26 May 2023 15:36:15 +0100
Message-Id: <20230526143615.372338-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.3 required=5.0 tests=AC_FROM_MANY_DOTS,BAYES_00,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Currently {modprobe, bind} after {rmmod, unbind} results in probe failure.

genirq: Flags mismatch irq 22. 00000004 (85070400.usb3drd) vs. 00000004 (85070400.usb3drd)
renesas_usb3: probe of 85070000.usb3peri failed with error -16

Fix this issue by replacing "parent dev"->"dev" as the irq resource
is managed by this driver.

Fixes: 9cad72dfc556 ("usb: gadget: Add support for RZ/V2M USB3DRD driver"
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/usb/gadget/udc/renesas_usb3.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/udc/renesas_usb3.c b/drivers/usb/gadget/udc/renesas_usb3.c
index aac8bc185afa..4a37b2e4b9b3 100644
--- a/drivers/usb/gadget/udc/renesas_usb3.c
+++ b/drivers/usb/gadget/udc/renesas_usb3.c
@@ -2877,7 +2877,7 @@ static int renesas_usb3_probe(struct platform_device *pdev)
 		struct rzv2m_usb3drd *ddata = dev_get_drvdata(pdev->dev.parent);
 
 		usb3->drd_reg = ddata->reg;
-		ret = devm_request_irq(ddata->dev, ddata->drd_irq,
+		ret = devm_request_irq(&pdev->dev, ddata->drd_irq,
 				       renesas_usb3_otg_irq, 0,
 				       dev_name(ddata->dev), usb3);
 		if (ret < 0)
-- 
2.25.1

