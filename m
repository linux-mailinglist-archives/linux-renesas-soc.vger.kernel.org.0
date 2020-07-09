Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 329CA219DF6
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Jul 2020 12:36:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726513AbgGIKg2 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 9 Jul 2020 06:36:28 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:2222 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726510AbgGIKg2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 9 Jul 2020 06:36:28 -0400
X-IronPort-AV: E=Sophos;i="5.75,331,1589209200"; 
   d="scan'208";a="51715516"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 09 Jul 2020 19:36:26 +0900
Received: from localhost.localdomain (unknown [10.166.252.89])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 5CA88422A5A9;
        Thu,  9 Jul 2020 19:36:26 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     kishon@ti.com, vkoul@kernel.org
Cc:     wsa+renesas@sang-engineering.com, geert+renesas@glider.be,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH] phy: renesas: rcar-gen3-usb2: fix SError happen if DEBUG_SHIRQ is enabled
Date:   Thu,  9 Jul 2020 19:36:18 +0900
Message-Id: <1594290978-8205-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

If CONFIG_DEBUG_SHIRQ was enabled, r8a77951-salvator-xs could boot
correctly. If we appended "earlycon keep_bootcon" to the kernel
command like, we could get kernel log like below.

    SError Interrupt on CPU0, code 0xbf000002 -- SError
    CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.8.0-rc3-salvator-x-00505-g6c843129e6faaf01 #785
    Hardware name: Renesas Salvator-X 2nd version board based on r8a77951 (DT)
    pstate: 60400085 (nZCv daIf +PAN -UAO BTYPE=--)
    pc : rcar_gen3_phy_usb2_irq+0x14/0x54
    lr : free_irq+0xf4/0x27c

This means free_irq() calls the interrupt handler while PM runtime
is not getting if DEBUG_SHIRQ is enabled and rcar_gen3_phy_usb2_probe()
failed. To fix the issue, add a condition into the interrupt
handler to avoid register access if any phys are not initialized.

Note that rcar_gen3_is_any_rphy_initialized() was introduced on v5.2.
So, if we backports this patch to v5.1 or less, we need to make
other way.

Reported-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Reported-by: Geert Uytterhoeven <geert+renesas@glider.be>
Fixes: 9f391c574efc ("phy: rcar-gen3-usb2: add runtime ID/VBUS pin detection")
Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/phy/renesas/phy-rcar-gen3-usb2.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/renesas/phy-rcar-gen3-usb2.c b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
index bfb22f8..91c732d 100644
--- a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
+++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
@@ -507,9 +507,13 @@ static irqreturn_t rcar_gen3_phy_usb2_irq(int irq, void *_ch)
 {
 	struct rcar_gen3_chan *ch = _ch;
 	void __iomem *usb2_base = ch->base;
-	u32 status = readl(usb2_base + USB2_OBINTSTA);
+	u32 status;
 	irqreturn_t ret = IRQ_NONE;
 
+	if (!rcar_gen3_is_any_rphy_initialized(ch))
+		return ret;
+
+	status = readl(usb2_base + USB2_OBINTSTA);
 	if (status & USB2_OBINT_BITS) {
 		dev_vdbg(ch->dev, "%s: %08x\n", __func__, status);
 		writel(USB2_OBINT_BITS, usb2_base + USB2_OBINTSTA);
-- 
2.7.4

