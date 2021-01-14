Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD9932F61CB
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 Jan 2021 14:22:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728875AbhANNSp (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 14 Jan 2021 08:18:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728858AbhANNSp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 14 Jan 2021 08:18:45 -0500
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 806CDC061574
        for <linux-renesas-soc@vger.kernel.org>; Thu, 14 Jan 2021 05:18:03 -0800 (PST)
Received: from ramsan.of.borg ([84.195.186.194])
        by laurent.telenet-ops.be with bizsmtp
        id GdHy2400u4C55Sk01dHy0g; Thu, 14 Jan 2021 14:18:01 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1l02Vi-003YpD-AT; Thu, 14 Jan 2021 14:17:58 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1l02Vh-009NeQ-SO; Thu, 14 Jan 2021 14:17:57 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>
Cc:     Magnus Damm <damm@opensource.se>,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v2] clocksource/drivers/sh_cmt: Make sure channel clock supply is enabled
Date:   Thu, 14 Jan 2021 14:17:56 +0100
Message-Id: <20210114131756.2235821-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The Renesas Compare Match Timer 0 and 1 (CMT0/1) variants have a
register to control the clock supply to the individual channels.
Currently the driver does not touch this register, and relies on the
documented initial value, which has the clock supply enabled for all
channels present.

However, when Linux starts on the APE6-EVM development board, only the
clock supply to the first CMT1 channel is enabled.  Hence the first
channel (used as a clockevent) works, while the second channel (used as
a clocksource) does not.  Note that the default system clocksource is
the Cortex-A15 architectured timer, and the user needs to manually
switch to the CMT1 clocksource to trigger the broken behavior.

Fix this by removing the fragile dependency on implicit reset and/or
boot loader state, and by enabling the clock supply explicitly for all
channels used instead.  This requires postponing the clk_disable() call,
else the timer's registers cannot be accessed in sh_cmt_setup_channel().

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
Tested on R-Mobile APE6, R-Car M2-W, and R-Car H3 ES2.0.

v2:
  - Add Reviewed-by.
---
 drivers/clocksource/sh_cmt.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/clocksource/sh_cmt.c b/drivers/clocksource/sh_cmt.c
index e258230d432c0002..c98f8851fd680454 100644
--- a/drivers/clocksource/sh_cmt.c
+++ b/drivers/clocksource/sh_cmt.c
@@ -235,6 +235,8 @@ static const struct sh_cmt_info sh_cmt_info[] = {
 #define CMCNT 1 /* channel register */
 #define CMCOR 2 /* channel register */
 
+#define CMCLKE	0x1000	/* CLK Enable Register (R-Car Gen2) */
+
 static inline u32 sh_cmt_read_cmstr(struct sh_cmt_channel *ch)
 {
 	if (ch->iostart)
@@ -853,6 +855,7 @@ static int sh_cmt_setup_channel(struct sh_cmt_channel *ch, unsigned int index,
 				unsigned int hwidx, bool clockevent,
 				bool clocksource, struct sh_cmt_device *cmt)
 {
+	u32 value;
 	int ret;
 
 	/* Skip unused channels. */
@@ -882,6 +885,11 @@ static int sh_cmt_setup_channel(struct sh_cmt_channel *ch, unsigned int index,
 		ch->iostart = cmt->mapbase + ch->hwidx * 0x100;
 		ch->ioctrl = ch->iostart + 0x10;
 		ch->timer_bit = 0;
+
+		/* Enable the clock supply to the channel */
+		value = ioread32(cmt->mapbase + CMCLKE);
+		value |= BIT(hwidx);
+		iowrite32(value, cmt->mapbase + CMCLKE);
 		break;
 	}
 
@@ -1014,12 +1022,10 @@ static int sh_cmt_setup(struct sh_cmt_device *cmt, struct platform_device *pdev)
 	else
 		cmt->rate = clk_get_rate(cmt->clk) / 8;
 
-	clk_disable(cmt->clk);
-
 	/* Map the memory resource(s). */
 	ret = sh_cmt_map_memory(cmt);
 	if (ret < 0)
-		goto err_clk_unprepare;
+		goto err_clk_disable;
 
 	/* Allocate and setup the channels. */
 	cmt->num_channels = hweight8(cmt->hw_channels);
@@ -1047,6 +1053,8 @@ static int sh_cmt_setup(struct sh_cmt_device *cmt, struct platform_device *pdev)
 		mask &= ~(1 << hwidx);
 	}
 
+	clk_disable(cmt->clk);
+
 	platform_set_drvdata(pdev, cmt);
 
 	return 0;
@@ -1054,6 +1062,8 @@ static int sh_cmt_setup(struct sh_cmt_device *cmt, struct platform_device *pdev)
 err_unmap:
 	kfree(cmt->channels);
 	iounmap(cmt->mapbase);
+err_clk_disable:
+	clk_disable(cmt->clk);
 err_clk_unprepare:
 	clk_unprepare(cmt->clk);
 err_clk_put:
-- 
2.25.1

