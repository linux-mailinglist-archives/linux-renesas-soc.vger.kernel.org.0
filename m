Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A6FA8847FA
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  7 Aug 2019 10:47:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387414AbfHGIrL (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 7 Aug 2019 04:47:11 -0400
Received: from michel.telenet-ops.be ([195.130.137.88]:55940 "EHLO
        michel.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728360AbfHGIqm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 7 Aug 2019 04:46:42 -0400
Received: from ramsan ([84.194.98.4])
        by michel.telenet-ops.be with bizsmtp
        id m8mg2000V05gfCL068mgU6; Wed, 07 Aug 2019 10:46:40 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hvHai-0002dw-IC; Wed, 07 Aug 2019 10:46:40 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hvHai-0006Ip-HB; Wed, 07 Aug 2019 10:46:40 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Chris Brandt <Chris.Brandt@renesas.com>,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v3 3/3] clocksource/drivers/ostm: Use unique device name instead of ostm
Date:   Wed,  7 Aug 2019 10:46:35 +0200
Message-Id: <20190807084635.24173-4-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190807084635.24173-1-geert+renesas@glider.be>
References: <20190807084635.24173-1-geert+renesas@glider.be>
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
    +clocksource: ostm fcfec000.timer: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 57352151442 ns
     sched_clock: 32 bits at 33MHz, resolution 30ns, wraps every 64440619504ns
    -ostm: used for clocksource
    -ostm: used for clock events
    +ostm fcfec000.timer: used for clocksource
    +ostm fcfec400.timer: used for clock events

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v3:
  - Make the name format similar to the one used for platform devices,
  - Use kasprintf() instead of buffer size guessing,
  - Use a real example from rskrza1.

v2 (by Jacopo):
  - Use np->full_name.
---
 drivers/clocksource/renesas-ostm.c | 45 ++++++++++++++++++++----------
 1 file changed, 30 insertions(+), 15 deletions(-)

diff --git a/drivers/clocksource/renesas-ostm.c b/drivers/clocksource/renesas-ostm.c
index 1e22e54d7b0df40d..659e3ec7b86714e3 100644
--- a/drivers/clocksource/renesas-ostm.c
+++ b/drivers/clocksource/renesas-ostm.c
@@ -25,6 +25,7 @@
  */
 
 struct ostm_device {
+	const char *name;
 	void __iomem *base;
 	unsigned long ticks_per_jiffy;
 	struct clock_event_device ced;
@@ -79,9 +80,8 @@ static int __init ostm_init_clksrc(struct ostm_device *ostm, unsigned long rate)
 	writeb(CTL_FREERUN, ostm->base + OSTM_CTL);
 	writeb(TS, ostm->base + OSTM_TS);
 
-	return clocksource_mmio_init(ostm->base + OSTM_CNT,
-			"ostm", rate,
-			300, 32, clocksource_mmio_readl_up);
+	return clocksource_mmio_init(ostm->base + OSTM_CNT, ostm->name, rate,
+				     300, 32, clocksource_mmio_readl_up);
 }
 
 static u64 notrace ostm_read_sched_clock(void)
@@ -161,15 +161,14 @@ static int __init ostm_init_clkevt(struct ostm_device *ostm, unsigned int irq,
 	struct clock_event_device *ced = &ostm->ced;
 	int ret = -ENXIO;
 
-	ret = request_irq(irq, ostm_timer_interrupt,
-			  IRQF_TIMER | IRQF_IRQPOLL,
-			  "ostm", ostm);
+	ret = request_irq(irq, ostm_timer_interrupt, IRQF_TIMER | IRQF_IRQPOLL,
+			  ostm->name, ostm);
 	if (ret) {
-		pr_err("ostm: failed to request irq\n");
+		pr_err("%s: Failed to request irq\n", ostm->name);
 		return ret;
 	}
 
-	ced->name = "ostm";
+	ced->name = ostm->name;
 	ced->features = CLOCK_EVT_FEAT_ONESHOT | CLOCK_EVT_FEAT_PERIODIC;
 	ced->set_state_shutdown = ostm_shutdown;
 	ced->set_state_periodic = ostm_set_periodic;
@@ -187,6 +186,7 @@ static int __init ostm_init(struct device_node *np)
 {
 	struct clk *ostm_clk = NULL;
 	struct ostm_device *ostm;
+	struct resource res;
 	unsigned long rate;
 	unsigned int irq;
 	int ret;
@@ -195,22 +195,35 @@ static int __init ostm_init(struct device_node *np)
 	if (!ostm)
 		return -ENOMEM;
 
-	ostm->base = of_iomap(np, 0);
-	if (!ostm->base) {
+	ret = of_address_to_resource(np, 0, &res);
+	if (ret) {
+		pr_err("ostm: Failed to obtain I/O memory\n");
+		goto err_free;
+	}
+
+	ostm->name = kasprintf(GFP_KERNEL, "ostm %llx.%s",
+			       (unsigned long long)res.start, np->name);
+	if (!ostm->name) {
 		ret = -ENOMEM;
 		goto err_free;
 	}
 
+	ostm->base = ioremap(res.start, resource_size(&res));
+	if (!ostm->base) {
+		ret = -ENOMEM;
+		goto err_free_name;
+	}
+
 	irq = irq_of_parse_and_map(np, 0);
 	if (!irq) {
-		pr_err("ostm: Failed to get irq\n");
+		pr_err("%s: Failed to get irq\n", ostm->name);
 		ret = -EINVAL;
 		goto err_unmap;
 	}
 
 	ostm_clk = of_clk_get(np, 0);
 	if (IS_ERR(ostm_clk)) {
-		pr_err("ostm: Failed to get clock\n");
+		pr_err("%s: Failed to get clock\n", ostm->name);
 		ostm_clk = NULL;
 		ret = PTR_ERR(ostm_clk);
 		goto err_unmap;
@@ -218,7 +231,7 @@ static int __init ostm_init(struct device_node *np)
 
 	ret = clk_prepare_enable(ostm_clk);
 	if (ret) {
-		pr_err("ostm: Failed to enable clock\n");
+		pr_err("%s: Failed to enable clock\n", ostm->name);
 		goto err_clk_put;
 	}
 
@@ -235,13 +248,13 @@ static int __init ostm_init(struct device_node *np)
 			goto err_clk_disable;
 
 		ostm_init_sched_clock(ostm, rate);
-		pr_info("ostm: used for clocksource\n");
+		pr_info("%s: used for clocksource\n", ostm->name);
 	} else {
 		ret = ostm_init_clkevt(ostm, irq, rate);
 		if (ret)
 			goto err_clk_disable;
 
-		pr_info("ostm: used for clock events\n");
+		pr_info("%s: used for clock events\n", ostm->name);
 	}
 
 	return 0;
@@ -252,6 +265,8 @@ static int __init ostm_init(struct device_node *np)
 	clk_put(ostm_clk);
 err_unmap:
 	iounmap(ostm->base);
+err_free_name:
+	kfree(ostm->name);
 err_free:
 	kfree(ostm);
 	return ret;
-- 
2.17.1

