Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D1F93001BD
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 Jan 2021 12:40:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727355AbhAVLhw (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 22 Jan 2021 06:37:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726664AbhAVLhZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 22 Jan 2021 06:37:25 -0500
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADAF0C06174A
        for <linux-renesas-soc@vger.kernel.org>; Fri, 22 Jan 2021 03:36:44 -0800 (PST)
Received: from ramsan.of.borg ([84.195.186.194])
        by xavier.telenet-ops.be with bizsmtp
        id Knci2400D4C55Sk01nciUh; Fri, 22 Jan 2021 12:36:43 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1l2uk6-005lJl-A8; Fri, 22 Jan 2021 12:36:42 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1l2uk5-00Bt8D-UI; Fri, 22 Jan 2021 12:36:41 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] soc: renesas: rcar-sysc: Use readl_poll_timeout_atomic()
Date:   Fri, 22 Jan 2021 12:36:37 +0100
Message-Id: <20210122113637.2833489-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Replace the open-coded polling loops by calls to the
readl_poll_timeout_atomic() helper macro.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/soc/renesas/rcar-sysc.c | 33 ++++++++++++++-------------------
 1 file changed, 14 insertions(+), 19 deletions(-)

diff --git a/drivers/soc/renesas/rcar-sysc.c b/drivers/soc/renesas/rcar-sysc.c
index a00bb098e1fe7488..4ff2671a699a4a3b 100644
--- a/drivers/soc/renesas/rcar-sysc.c
+++ b/drivers/soc/renesas/rcar-sysc.c
@@ -15,6 +15,7 @@
 #include <linux/slab.h>
 #include <linux/spinlock.h>
 #include <linux/io.h>
+#include <linux/iopoll.h>
 #include <linux/soc/renesas/rcar-sysc.h>
 
 #include "rcar-sysc.h"
@@ -44,13 +45,13 @@
 #define PWRER_OFFS		0x14	/* Power Shutoff/Resume Error */
 
 
-#define SYSCSR_RETRIES		100
+#define SYSCSR_TIMEOUT		100
 #define SYSCSR_DELAY_US		1
 
 #define PWRER_RETRIES		100
 #define PWRER_DELAY_US		1
 
-#define SYSCISR_RETRIES		1000
+#define SYSCISR_TIMEOUT		1000
 #define SYSCISR_DELAY_US	1
 
 #define RCAR_PD_ALWAYS_ON	32	/* Always-on power area */
@@ -68,7 +69,8 @@ static u32 rcar_sysc_extmask_offs, rcar_sysc_extmask_val;
 static int rcar_sysc_pwr_on_off(const struct rcar_sysc_ch *sysc_ch, bool on)
 {
 	unsigned int sr_bit, reg_offs;
-	int k;
+	u32 val;
+	int ret;
 
 	if (on) {
 		sr_bit = SYSCSR_PONENB;
@@ -79,13 +81,10 @@ static int rcar_sysc_pwr_on_off(const struct rcar_sysc_ch *sysc_ch, bool on)
 	}
 
 	/* Wait until SYSC is ready to accept a power request */
-	for (k = 0; k < SYSCSR_RETRIES; k++) {
-		if (ioread32(rcar_sysc_base + SYSCSR) & BIT(sr_bit))
-			break;
-		udelay(SYSCSR_DELAY_US);
-	}
-
-	if (k == SYSCSR_RETRIES)
+	ret = readl_poll_timeout_atomic(rcar_sysc_base + SYSCSR, val,
+					val & BIT(sr_bit), SYSCSR_DELAY_US,
+					SYSCSR_TIMEOUT);
+	if (ret)
 		return -EAGAIN;
 
 	/* Submit power shutoff or power resume request */
@@ -101,8 +100,7 @@ static int rcar_sysc_power(const struct rcar_sysc_ch *sysc_ch, bool on)
 	unsigned int chan_mask = BIT(sysc_ch->chan_bit);
 	unsigned int status;
 	unsigned long flags;
-	int ret = 0;
-	int k;
+	int k, ret;
 
 	spin_lock_irqsave(&rcar_sysc_lock, flags);
 
@@ -145,13 +143,10 @@ static int rcar_sysc_power(const struct rcar_sysc_ch *sysc_ch, bool on)
 	}
 
 	/* Wait until the power shutoff or resume request has completed * */
-	for (k = 0; k < SYSCISR_RETRIES; k++) {
-		if (ioread32(rcar_sysc_base + SYSCISR) & isr_mask)
-			break;
-		udelay(SYSCISR_DELAY_US);
-	}
-
-	if (k == SYSCISR_RETRIES)
+	ret = readl_poll_timeout_atomic(rcar_sysc_base + SYSCISR, status,
+					status & isr_mask, SYSCISR_DELAY_US,
+					SYSCISR_TIMEOUT);
+	if (ret)
 		ret = -EIO;
 
 	iowrite32(isr_mask, rcar_sysc_base + SYSCISCR);
-- 
2.25.1

