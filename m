Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E4932716905
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 May 2023 18:17:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232833AbjE3QRf (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 30 May 2023 12:17:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231929AbjE3QRd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 30 May 2023 12:17:33 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 08750E5;
        Tue, 30 May 2023 09:17:26 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="6.00,204,1681138800"; 
   d="scan'208";a="165023373"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 31 May 2023 01:17:26 +0900
Received: from localhost.localdomain (unknown [10.226.92.87])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id BD24640183F7;
        Wed, 31 May 2023 01:17:22 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Zheng Wang <zyytlz.wz@163.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-usb@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Marc Zyngier <maz@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2] usb: gadget: udc: renesas_usb3: Fix RZ/V2M {modprobe,bind} error
Date:   Tue, 30 May 2023 17:17:20 +0100
Message-Id: <20230530161720.179927-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.4 required=5.0 tests=AC_FROM_MANY_DOTS,BAYES_00,
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

The reason is, it is trying to register an interrupt handler for the same
IRQ twice. The devm_request_irq() was called with the parent device.
So the interrupt handler won't be unregistered when the usb3-peri device
is unbound.

Fix this issue by replacing "parent dev"->"dev" as the irq resource
is managed by this driver.

Fixes: 9cad72dfc556 ("usb: gadget: Add support for RZ/V2M USB3DRD driver")
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * Added missing ')' at the end of the line for fixes tag.
 * Updated commit description.
 * Replaced "ddata->dev"->"&pdev->dev" for the devname parameter.
---
 drivers/usb/gadget/udc/renesas_usb3.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/udc/renesas_usb3.c b/drivers/usb/gadget/udc/renesas_usb3.c
index aac8bc185afa..eb008e873361 100644
--- a/drivers/usb/gadget/udc/renesas_usb3.c
+++ b/drivers/usb/gadget/udc/renesas_usb3.c
@@ -2877,9 +2877,9 @@ static int renesas_usb3_probe(struct platform_device *pdev)
 		struct rzv2m_usb3drd *ddata = dev_get_drvdata(pdev->dev.parent);
 
 		usb3->drd_reg = ddata->reg;
-		ret = devm_request_irq(ddata->dev, ddata->drd_irq,
+		ret = devm_request_irq(&pdev->dev, ddata->drd_irq,
 				       renesas_usb3_otg_irq, 0,
-				       dev_name(ddata->dev), usb3);
+				       dev_name(&pdev->dev), usb3);
 		if (ret < 0)
 			return ret;
 	}
-- 
2.25.1

