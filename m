Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 61B0562EEAA
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Nov 2022 08:52:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235040AbiKRHwC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 18 Nov 2022 02:52:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234455AbiKRHwB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 Nov 2022 02:52:01 -0500
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8AB4A140D5
        for <linux-renesas-soc@vger.kernel.org>; Thu, 17 Nov 2022 23:51:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=k1; bh=jNRbaBEpi8D/1zmm8dNHXvtrSPF
        YcWw1ApOvaoKPAD0=; b=3dL8YI2tjLj5NTgSJ3Fn0MepGngz3zGfh3ooQCsnHRO
        5d0Cg3AFYpdFkHypwhJKvp7EiwLuuoL9sKMxbJNTOFtuGmvJeR0CkHtBnBsFQ2nf
        MJHnS9M948tUZw0WdsLfnBKSMmHT10/OUftS32iykg3hm5DGlRn0aWlmzLKZyXxE
        =
Received: (qmail 1633951 invoked from network); 18 Nov 2022 08:51:57 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 18 Nov 2022 08:51:57 +0100
X-UD-Smtp-Session: l3s3148p1@2A/k+rntJJVehh99
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [RFC PATCH v2] clocksource/drivers/sh_cmt: access registers according to spec
Date:   Fri, 18 Nov 2022 08:51:52 +0100
Message-Id: <20221118075152.19537-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Documentation for most CMTs say that we need to wait two input clocks
before changes propagate to the timer. This is especially relevant when
we stop the timer to change further settings. Implement the delays
according to the spec. To avoid unnecessary delays in atomic mode, we
also check if the to-be-written value actually differs. CMCNT is a bit
special because testing showed that we need to wait 3 cycles instead.
AFAIU, this is also true for all CMTs. Also, the WRFLAG needs to be
checked before writing. This fixes "cannot clear CMCNT" messages which
occur often on R-Car Gen4 SoCs, but only very rarely on older SoCs for
some reason.

Fixes: 81b3b2711072 ("clocksource: sh_cmt: Add support for multiple channels per device")
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Changes since RFC v1:
* bail out if checking WRFLAG times out
* changed types of new variables to unsigned int
* easier to read calculations of 'reg_delay' and 'rate'

Notes from v1 (still valid):

With this patch, I can run the 'clocksource-switch' test (from the Linux
selftests) without any warnings printed on the Spider S4 and the Ebisu
E3 board. Both printed the warnings before, the Spider immediately, the
Ebisu rarely but still. The price for this correctness is that the tests
run much longer due to the udelays in atomic mode. However, I consider
the massive switching a corner case. Usually, one switches rarely so the
extra delay is worth the correctness IMHO.

The only question left for me: Do the old 16 and 32 bit versions of CMT
really *not* need the delay? They are not explicitly mentioned in the
docs but maybe it doesn't hurt?

For the record: it took a while to find out what exactly was the problem
for the error message. And then, it was also two different delays
needed. This is why I chose to implement all the delays mentioned in the
specs and not only a working subset. The latter sounded too fragile in
case register accesses would change in the future.

So much for now, looking forward to comments!

   Wolfram


 drivers/clocksource/sh_cmt.c | 88 ++++++++++++++++++++++--------------
 1 file changed, 55 insertions(+), 33 deletions(-)

diff --git a/drivers/clocksource/sh_cmt.c b/drivers/clocksource/sh_cmt.c
index 64dcb082d4cf..35fed749b4d9 100644
--- a/drivers/clocksource/sh_cmt.c
+++ b/drivers/clocksource/sh_cmt.c
@@ -13,6 +13,7 @@
 #include <linux/init.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
+#include <linux/iopoll.h>
 #include <linux/ioport.h>
 #include <linux/irq.h>
 #include <linux/module.h>
@@ -116,6 +117,7 @@ struct sh_cmt_device {
 	void __iomem *mapbase;
 	struct clk *clk;
 	unsigned long rate;
+	unsigned int reg_delay;
 
 	raw_spinlock_t lock; /* Protect the shared start/stop register */
 
@@ -247,10 +249,17 @@ static inline u32 sh_cmt_read_cmstr(struct sh_cmt_channel *ch)
 
 static inline void sh_cmt_write_cmstr(struct sh_cmt_channel *ch, u32 value)
 {
-	if (ch->iostart)
-		ch->cmt->info->write_control(ch->iostart, 0, value);
-	else
-		ch->cmt->info->write_control(ch->cmt->mapbase, 0, value);
+	u32 old_value = sh_cmt_read_cmstr(ch);
+
+	if (value != old_value) {
+		if (ch->iostart) {
+			ch->cmt->info->write_control(ch->iostart, 0, value);
+			udelay(ch->cmt->reg_delay);
+		} else {
+			ch->cmt->info->write_control(ch->cmt->mapbase, 0, value);
+			udelay(ch->cmt->reg_delay);
+		}
+	}
 }
 
 static inline u32 sh_cmt_read_cmcsr(struct sh_cmt_channel *ch)
@@ -260,7 +269,12 @@ static inline u32 sh_cmt_read_cmcsr(struct sh_cmt_channel *ch)
 
 static inline void sh_cmt_write_cmcsr(struct sh_cmt_channel *ch, u32 value)
 {
-	ch->cmt->info->write_control(ch->ioctrl, CMCSR, value);
+	u32 old_value = sh_cmt_read_cmcsr(ch);
+
+	if (value != old_value) {
+		ch->cmt->info->write_control(ch->ioctrl, CMCSR, value);
+		udelay(ch->cmt->reg_delay);
+	}
 }
 
 static inline u32 sh_cmt_read_cmcnt(struct sh_cmt_channel *ch)
@@ -268,14 +282,33 @@ static inline u32 sh_cmt_read_cmcnt(struct sh_cmt_channel *ch)
 	return ch->cmt->info->read_count(ch->ioctrl, CMCNT);
 }
 
-static inline void sh_cmt_write_cmcnt(struct sh_cmt_channel *ch, u32 value)
+static inline int sh_cmt_write_cmcnt(struct sh_cmt_channel *ch, u32 value)
 {
+	/* Tests showed that we need to wait 3 clocks here */
+	unsigned int cmcnt_delay = ch->cmt->reg_delay * 3 / 2;
+	u32 reg;
+
+	if (ch->cmt->info->model > SH_CMT_16BIT) {
+		int ret = read_poll_timeout_atomic(sh_cmt_read_cmcsr, reg,
+						   !(reg & SH_CMT32_CMCSR_WRFLG),
+						   1, cmcnt_delay, false, ch);
+		if (ret < 0)
+			return ret;
+	}
+
 	ch->cmt->info->write_count(ch->ioctrl, CMCNT, value);
+	udelay(cmcnt_delay);
+	return 0;
 }
 
 static inline void sh_cmt_write_cmcor(struct sh_cmt_channel *ch, u32 value)
 {
-	ch->cmt->info->write_count(ch->ioctrl, CMCOR, value);
+	u32 old_value = ch->cmt->info->read_count(ch->ioctrl, CMCOR);
+
+	if (value != old_value) {
+		ch->cmt->info->write_count(ch->ioctrl, CMCOR, value);
+		udelay(ch->cmt->reg_delay);
+	}
 }
 
 static u32 sh_cmt_get_counter(struct sh_cmt_channel *ch, u32 *has_wrapped)
@@ -319,7 +352,7 @@ static void sh_cmt_start_stop_ch(struct sh_cmt_channel *ch, int start)
 
 static int sh_cmt_enable(struct sh_cmt_channel *ch)
 {
-	int k, ret;
+	int ret;
 
 	dev_pm_syscore_device(&ch->cmt->pdev->dev, true);
 
@@ -347,26 +380,9 @@ static int sh_cmt_enable(struct sh_cmt_channel *ch)
 	}
 
 	sh_cmt_write_cmcor(ch, 0xffffffff);
-	sh_cmt_write_cmcnt(ch, 0);
-
-	/*
-	 * According to the sh73a0 user's manual, as CMCNT can be operated
-	 * only by the RCLK (Pseudo 32 kHz), there's one restriction on
-	 * modifying CMCNT register; two RCLK cycles are necessary before
-	 * this register is either read or any modification of the value
-	 * it holds is reflected in the LSI's actual operation.
-	 *
-	 * While at it, we're supposed to clear out the CMCNT as of this
-	 * moment, so make sure it's processed properly here.  This will
-	 * take RCLKx2 at maximum.
-	 */
-	for (k = 0; k < 100; k++) {
-		if (!sh_cmt_read_cmcnt(ch))
-			break;
-		udelay(1);
-	}
+	ret = sh_cmt_write_cmcnt(ch, 0);
 
-	if (sh_cmt_read_cmcnt(ch)) {
+	if (ret || sh_cmt_read_cmcnt(ch)) {
 		dev_err(&ch->cmt->pdev->dev, "ch%u: cannot clear CMCNT\n",
 			ch->index);
 		ret = -ETIMEDOUT;
@@ -995,8 +1011,8 @@ MODULE_DEVICE_TABLE(of, sh_cmt_of_table);
 
 static int sh_cmt_setup(struct sh_cmt_device *cmt, struct platform_device *pdev)
 {
-	unsigned int mask;
-	unsigned int i;
+	unsigned int mask, i;
+	unsigned long rate;
 	int ret;
 
 	cmt->pdev = pdev;
@@ -1032,10 +1048,16 @@ static int sh_cmt_setup(struct sh_cmt_device *cmt, struct platform_device *pdev)
 	if (ret < 0)
 		goto err_clk_unprepare;
 
-	if (cmt->info->width == 16)
-		cmt->rate = clk_get_rate(cmt->clk) / 512;
-	else
-		cmt->rate = clk_get_rate(cmt->clk) / 8;
+	rate = clk_get_rate(cmt->clk);
+	if (!rate) {
+		ret = -EINVAL;
+		goto err_clk_disable;
+	}
+
+	/* We shall wait 2 input clks after register writes */
+	if (cmt->info->model >= SH_CMT_48BIT) // FIXME: Really not needed for older ones?
+		cmt->reg_delay = DIV_ROUND_UP(2UL * USEC_PER_SEC, rate);
+	cmt->rate = rate / (cmt->info->width == 16 ? 512 : 8);
 
 	/* Map the memory resource(s). */
 	ret = sh_cmt_map_memory(cmt);
-- 
2.30.2

