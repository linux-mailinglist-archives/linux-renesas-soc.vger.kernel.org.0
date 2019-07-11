Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7BD1C6578E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Jul 2019 15:04:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728294AbfGKNEG (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 11 Jul 2019 09:04:06 -0400
Received: from xavier.telenet-ops.be ([195.130.132.52]:56604 "EHLO
        xavier.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728124AbfGKNEF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 11 Jul 2019 09:04:05 -0400
Received: from ramsan ([84.194.98.4])
        by xavier.telenet-ops.be with bizsmtp
        id bR422000r05gfCL01R42Ad; Thu, 11 Jul 2019 15:04:03 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hlYjy-00085u-IG; Thu, 11 Jul 2019 15:04:02 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hlYjy-0000cu-GL; Thu, 11 Jul 2019 15:04:02 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Yao Lihua <Lihua.Yao@desay-svautomotive.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] clk: renesas: cpg-mssr: Fix reset control race condition
Date:   Thu, 11 Jul 2019 15:03:59 +0200
Message-Id: <20190711130359.1060-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The module reset code in the Renesas CPG/MSSR driver uses
read-modify-write (RMW) operations to write to a Software Reset Register
(SRCRn), and simple writes to write to a Software Reset Clearing
Register (SRSTCLRn), as was mandated by the R-Car Gen2 and Gen3 Hardware
User's Manuals.

However, this may cause a race condition when two devices are reset in
parallel: if the reset for device A completes in the middle of the RMW
operation for device B, device A may be reset again, causing subtle
failures (e.g. i2c timeouts):

	thread A			thread B
	--------			--------

	val = SRCRn
	val |= bit A
	SRCRn = val

	delay

					val = SRCRn (bit A is set)

	SRSTCLRn = bit A
	(bit A in SRCRn is cleared)

					val |= bit B
					SRCRn = val (bit A and B are set)

This can be reproduced on e.g. Salvator-XS using:

    $ while true; do i2cdump -f -y 4 0x6A b > /dev/null; done &
    $ while true; do i2cdump -f -y 2 0x10 b > /dev/null; done &

    i2c-rcar e6510000.i2c: error -110 : 40000002
    i2c-rcar e66d8000.i2c: error -110 : 40000002

According to the R-Car Gen3 Hardware Manual Errata for Rev.
0.80 of Feb 28, 2018, reflected in Rev. 1.00 of the R-Car Gen3 Hardware
User's Manual, writes to SRCRn do not require read-modify-write cycles.

Note that the R-Car Gen2 Hardware User's Manual has not been updated
yet, and still says a read-modify-write sequence is required.  According
to the hardware team, the reset hardware block is the same on both R-Car
Gen2 and Gen3, though.

Hence fix the issue by replacing the read-modify-write operations on
SRCRn by simple writes.

Reported-by: Yao Lihua <Lihua.Yao@desay-svautomotive.com>
Fixes: 6197aa65c4905532 ("clk: renesas: cpg-mssr: Add support for reset control")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
So far I haven't been able to reproduce the issue on R-Car Gen2 (after
forcing i2c reset on Gen2, too).  Perhaps my Koelsch doesn't have enough
CPU cores.  What about Lager?

Hi Mike, Stephen,

As this is a bugfix, can you please take this directly, if accepted?

Thanks!
---
 drivers/clk/renesas/renesas-cpg-mssr.c | 16 ++--------------
 1 file changed, 2 insertions(+), 14 deletions(-)

diff --git a/drivers/clk/renesas/renesas-cpg-mssr.c b/drivers/clk/renesas/renesas-cpg-mssr.c
index 52bbb9ce3807db31..d4075b13067429cd 100644
--- a/drivers/clk/renesas/renesas-cpg-mssr.c
+++ b/drivers/clk/renesas/renesas-cpg-mssr.c
@@ -572,17 +572,11 @@ static int cpg_mssr_reset(struct reset_controller_dev *rcdev,
 	unsigned int reg = id / 32;
 	unsigned int bit = id % 32;
 	u32 bitmask = BIT(bit);
-	unsigned long flags;
-	u32 value;
 
 	dev_dbg(priv->dev, "reset %u%02u\n", reg, bit);
 
 	/* Reset module */
-	spin_lock_irqsave(&priv->rmw_lock, flags);
-	value = readl(priv->base + SRCR(reg));
-	value |= bitmask;
-	writel(value, priv->base + SRCR(reg));
-	spin_unlock_irqrestore(&priv->rmw_lock, flags);
+	writel(bitmask, priv->base + SRCR(reg));
 
 	/* Wait for at least one cycle of the RCLK clock (@ ca. 32 kHz) */
 	udelay(35);
@@ -599,16 +593,10 @@ static int cpg_mssr_assert(struct reset_controller_dev *rcdev, unsigned long id)
 	unsigned int reg = id / 32;
 	unsigned int bit = id % 32;
 	u32 bitmask = BIT(bit);
-	unsigned long flags;
-	u32 value;
 
 	dev_dbg(priv->dev, "assert %u%02u\n", reg, bit);
 
-	spin_lock_irqsave(&priv->rmw_lock, flags);
-	value = readl(priv->base + SRCR(reg));
-	value |= bitmask;
-	writel(value, priv->base + SRCR(reg));
-	spin_unlock_irqrestore(&priv->rmw_lock, flags);
+	writel(bitmask, priv->base + SRCR(reg));
 	return 0;
 }
 
-- 
2.17.1

