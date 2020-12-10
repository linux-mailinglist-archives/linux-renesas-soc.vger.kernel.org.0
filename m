Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 74F152D673D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Dec 2020 20:48:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393516AbgLJTrn (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 10 Dec 2020 14:47:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2393577AbgLJTrn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 10 Dec 2020 14:47:43 -0500
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58E2EC0613CF
        for <linux-renesas-soc@vger.kernel.org>; Thu, 10 Dec 2020 11:46:55 -0800 (PST)
Received: from ramsan.of.borg ([84.195.186.194])
        by michel.telenet-ops.be with bizsmtp
        id 2jmq2400G4C55Sk06jmqLb; Thu, 10 Dec 2020 20:46:51 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1knRtq-009VCz-Ga; Thu, 10 Dec 2020 20:46:50 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1knRtp-00CAva-NM; Thu, 10 Dec 2020 20:46:49 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>
Cc:     =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Magnus Damm <damm@opensource.se>,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] clocksource/drivers/sh_cmt: Make sure channel clock supply is enabled
Date:   Thu, 10 Dec 2020 20:46:48 +0100
Message-Id: <20201210194648.2901899-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
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
---
Tested on R-Mobile APE6, R-Car M2-W, and R-Car H3 ES2.0.
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

