Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C2DF51C83BF
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 May 2020 09:47:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725939AbgEGHrR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 7 May 2020 03:47:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725802AbgEGHrQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 7 May 2020 03:47:16 -0400
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 991DAC061A10
        for <linux-renesas-soc@vger.kernel.org>; Thu,  7 May 2020 00:47:16 -0700 (PDT)
Received: from ramsan ([IPv6:2a02:1810:ac12:ed60:6572:4a1f:d283:9ae8])
        by michel.telenet-ops.be with bizsmtp
        id bjnE2200R3ZRV0X06jnEJW; Thu, 07 May 2020 09:47:15 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jWbFS-0001JH-Dv; Thu, 07 May 2020 09:47:14 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jWbFS-0007qQ-Cn; Thu, 07 May 2020 09:47:14 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Chris Brandt <chris.brandt@renesas.com>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] clk: renesas: cpg-mssr: Fix STBCR suspend/resume handling
Date:   Thu,  7 May 2020 09:47:13 +0200
Message-Id: <20200507074713.30113-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On SoCs with Standby Control Registers (STBCRs) instead of Module Stop
Control Registers (MSTPCRs), the suspend handler saves the wrong
registers, and the resume handler prints the wrong register in an error
message.

Fortunately this cannot happen yet, as the suspend/resume code is used
on PSCI systems only, and systems with STBCRs (RZ/A1 and RZ/A2) do not
use PSCI.  Still, it is better to fix this, to avoid this becoming a
problem in the future.

Distinguish between STBCRs and MSTPCRs where needed.  Replace the
useless printing of the virtual register address in the resume error
message by printing the register index.

Fixes: fde35c9c7db5732c ("clk: renesas: cpg-mssr: Add R7S9210 support")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in clk-renesas for v5.8.

 drivers/clk/renesas/renesas-cpg-mssr.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/renesas/renesas-cpg-mssr.c b/drivers/clk/renesas/renesas-cpg-mssr.c
index 8f6dff362869bde4..dcb6e2706d372085 100644
--- a/drivers/clk/renesas/renesas-cpg-mssr.c
+++ b/drivers/clk/renesas/renesas-cpg-mssr.c
@@ -818,7 +818,8 @@ static int cpg_mssr_suspend_noirq(struct device *dev)
 	/* Save module registers with bits under our control */
 	for (reg = 0; reg < ARRAY_SIZE(priv->smstpcr_saved); reg++) {
 		if (priv->smstpcr_saved[reg].mask)
-			priv->smstpcr_saved[reg].val =
+			priv->smstpcr_saved[reg].val = priv->stbyctrl ?
+				readb(priv->base + STBCR(reg)) :
 				readl(priv->base + SMSTPCR(reg));
 	}
 
@@ -878,8 +879,9 @@ static int cpg_mssr_resume_noirq(struct device *dev)
 		}
 
 		if (!i)
-			dev_warn(dev, "Failed to enable SMSTP %p[0x%x]\n",
-				 priv->base + SMSTPCR(reg), oldval & mask);
+			dev_warn(dev, "Failed to enable %s%u[0x%x]\n",
+				 priv->stbyctrl ? "STB" : "SMSTP", reg,
+				 oldval & mask);
 	}
 
 	return 0;
-- 
2.17.1

