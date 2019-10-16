Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4F210D943F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Oct 2019 16:48:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393108AbfJPOrx (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 16 Oct 2019 10:47:53 -0400
Received: from xavier.telenet-ops.be ([195.130.132.52]:37068 "EHLO
        xavier.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726786AbfJPOrx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 16 Oct 2019 10:47:53 -0400
Received: from ramsan ([84.194.98.4])
        by xavier.telenet-ops.be with bizsmtp
        id EEnq2100X05gfCL01EnqeS; Wed, 16 Oct 2019 16:47:50 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iKkac-0003rY-Fq; Wed, 16 Oct 2019 16:47:50 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iKkac-0007hO-Dp; Wed, 16 Oct 2019 16:47:50 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>
Cc:     Chris Brandt <chris.brandt@renesas.com>,
        Rob Herring <robh@kernel.org>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v4 4/4] clocksource/drivers/renesas-ostm: Use unique device name instead of ostm
Date:   Wed, 16 Oct 2019 16:47:47 +0200
Message-Id: <20191016144747.29538-5-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191016144747.29538-1-geert+renesas@glider.be>
References: <20191016144747.29538-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Currently all OSTM devices are called "ostm", also in kernel messages.

As there can be multiple instances in an SoC, this can confuse the user.
Hence construct a unique name from the DT node name, like is done for
platform devices.

On RSK+RZA1, the boot log changes like:

    -clocksource: ostm: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 57352151442 ns
    +clocksource: timer@fcfec000: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 57352151442 ns
     sched_clock: 32 bits at 33MHz, resolution 30ns, wraps every 64440619504ns
    -ostm: used for clocksource
    -ostm: used for clock events
    +/soc/timer@fcfec000: used for clocksource
    +/soc/timer@fcfec400: used for clock events
     ...
    -clocksource: Switched to clocksource ostm
    +clocksource: Switched to clocksource timer@fcfec000

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v4:
  - Rebase on top of timer_of conversion, and use np->full_name or %pOF,
    like the timer-of core does,

v3:
  - Make the name format similar to the one used for platform devices,
  - Use kasprintf() instead of buffer size guessing,
  - Use a real example from rskrza1.

v2 (by Jacopo):
  - Use np->fullname.
---
 drivers/clocksource/renesas-ostm.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/clocksource/renesas-ostm.c b/drivers/clocksource/renesas-ostm.c
index 46012d905604bc43..3d06ba66008c7029 100644
--- a/drivers/clocksource/renesas-ostm.c
+++ b/drivers/clocksource/renesas-ostm.c
@@ -64,9 +64,9 @@ static int __init ostm_init_clksrc(struct timer_of *to)
 	writeb(CTL_FREERUN, timer_of_base(to) + OSTM_CTL);
 	writeb(TS, timer_of_base(to) + OSTM_TS);
 
-	return clocksource_mmio_init(timer_of_base(to) + OSTM_CNT, "ostm",
-				     timer_of_rate(to), 300, 32,
-				     clocksource_mmio_readl_up);
+	return clocksource_mmio_init(timer_of_base(to) + OSTM_CNT,
+				     to->np->full_name, timer_of_rate(to), 300,
+				     32, clocksource_mmio_readl_up);
 }
 
 static u64 notrace ostm_read_sched_clock(void)
@@ -190,13 +190,13 @@ static int __init ostm_init(struct device_node *np)
 			goto err_cleanup;
 
 		ostm_init_sched_clock(to);
-		pr_info("ostm: used for clocksource\n");
+		pr_info("%pOF: used for clocksource\n", np);
 	} else {
 		ret = ostm_init_clkevt(to);
 		if (ret)
 			goto err_cleanup;
 
-		pr_info("ostm: used for clock events\n");
+		pr_info("%pOF: used for clock events\n", np);
 	}
 
 	return 0;
-- 
2.17.1

