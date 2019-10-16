Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C5853D93D4
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Oct 2019 16:27:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392455AbfJPO1n (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 16 Oct 2019 10:27:43 -0400
Received: from laurent.telenet-ops.be ([195.130.137.89]:52576 "EHLO
        laurent.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726645AbfJPO1m (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 16 Oct 2019 10:27:42 -0400
Received: from ramsan ([84.194.98.4])
        by laurent.telenet-ops.be with bizsmtp
        id EETg2100E05gfCL01ETgy4; Wed, 16 Oct 2019 16:27:41 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iKkH6-0003md-O7; Wed, 16 Oct 2019 16:27:40 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iKkH6-0007Ob-Mc; Wed, 16 Oct 2019 16:27:40 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Kishon Vijay Abraham I <kishon@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2] phy: renesas: rcar-gen3-usb2: Use platform_get_irq_optional() for optional irq
Date:   Wed, 16 Oct 2019 16:27:33 +0200
Message-Id: <20191016142733.28387-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

As platform_get_irq() now prints an error when the interrupt does not
exist, a scary warning may be printed for an optional interrupt:

    phy_rcar_gen3_usb2 ee0a0200.usb-phy: IRQ index 0 not found

Fix this by calling platform_get_irq_optional() instead.

Fixes: 7723f4c5ecdb8d83 ("driver core: platform: Add an error message to platform_get_irq*()")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Tested-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
v2:
  - Add Reviewed-by, Tested-by.

This is a fix for v5.4.
---
 drivers/phy/renesas/phy-rcar-gen3-usb2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/renesas/phy-rcar-gen3-usb2.c b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
index b7f6b132439521ea..49ec67d46ccc5a37 100644
--- a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
+++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
@@ -614,7 +614,7 @@ static int rcar_gen3_phy_usb2_probe(struct platform_device *pdev)
 		return PTR_ERR(channel->base);
 
 	/* call request_irq for OTG */
-	irq = platform_get_irq(pdev, 0);
+	irq = platform_get_irq_optional(pdev, 0);
 	if (irq >= 0) {
 		INIT_WORK(&channel->work, rcar_gen3_phy_usb2_work);
 		irq = devm_request_irq(dev, irq, rcar_gen3_phy_usb2_irq,
-- 
2.17.1

