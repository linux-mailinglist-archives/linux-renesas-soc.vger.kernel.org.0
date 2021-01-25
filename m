Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9DF4930344F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 Jan 2021 06:23:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730464AbhAZFWU (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 26 Jan 2021 00:22:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729560AbhAYOh0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 25 Jan 2021 09:37:26 -0500
Received: from leibniz.telenet-ops.be (leibniz.telenet-ops.be [IPv6:2a02:1800:110:4::f00:d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F36AC061797
        for <linux-renesas-soc@vger.kernel.org>; Mon, 25 Jan 2021 06:36:01 -0800 (PST)
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by leibniz.telenet-ops.be (Postfix) with ESMTPS id 4DPXJ100tLzMt5Tn
        for <linux-renesas-soc@vger.kernel.org>; Mon, 25 Jan 2021 15:27:13 +0100 (CET)
Received: from ramsan.of.borg ([84.195.186.194])
        by baptiste.telenet-ops.be with bizsmtp
        id M2S82400F4C55Sk012S8YN; Mon, 25 Jan 2021 15:26:11 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1l42oi-000ej3-1n; Mon, 25 Jan 2021 15:26:08 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1l42oh-004PCO-GS; Mon, 25 Jan 2021 15:26:07 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v2] soc: renesas: rcar-sysc: Use readl_poll_timeout_atomic()
Date:   Mon, 25 Jan 2021 15:26:06 +0100
Message-Id: <20210125142606.1050130-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Replace the open-coded polling loops by calls to the
readl_poll_timeout_atomic() helper macro.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
To be queued in renesas-devel for v5.12.

v2:
  - Add Reviewed-by,
  - Make "k" unsigned.
---
 drivers/soc/renesas/rcar-sysc.c | 35 ++++++++++++++-------------------
 1 file changed, 15 insertions(+), 20 deletions(-)

diff --git a/drivers/soc/renesas/rcar-sysc.c b/drivers/soc/renesas/rcar-sysc.c
index a00bb098e1fe7488..53387a72ca00ce79 100644
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
@@ -99,10 +98,9 @@ static int rcar_sysc_power(const struct rcar_sysc_ch *sysc_ch, bool on)
 {
 	unsigned int isr_mask = BIT(sysc_ch->isr_bit);
 	unsigned int chan_mask = BIT(sysc_ch->chan_bit);
-	unsigned int status;
+	unsigned int status, k;
 	unsigned long flags;
-	int ret = 0;
-	int k;
+	int ret;
 
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

