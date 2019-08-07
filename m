Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8D078847E6
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  7 Aug 2019 10:47:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387546AbfHGIqu (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 7 Aug 2019 04:46:50 -0400
Received: from albert.telenet-ops.be ([195.130.137.90]:40788 "EHLO
        albert.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387718AbfHGIqq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 7 Aug 2019 04:46:46 -0400
Received: from ramsan ([84.194.98.4])
        by albert.telenet-ops.be with bizsmtp
        id m8mg2000205gfCL068mgMM; Wed, 07 Aug 2019 10:46:43 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hvHai-0002dt-0E; Wed, 07 Aug 2019 10:46:40 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hvHah-0006Im-UU; Wed, 07 Aug 2019 10:46:39 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Chris Brandt <Chris.Brandt@renesas.com>,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v3 2/3] clocksource/drivers/renesas-ostm: Fix probe error path
Date:   Wed,  7 Aug 2019 10:46:34 +0200
Message-Id: <20190807084635.24173-3-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190807084635.24173-1-geert+renesas@glider.be>
References: <20190807084635.24173-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Fix various issues in the error path of ostm_init():
  1. Drop error message printing on of_iomap() failure, as the memory
     allocation core already takes of that,
  2. Handle irq_of_parse_and_map() failures correctly: it returns
     unsigned int, hence make irq unsigned int, and zero is an error,
  3. Propagate/return appropriate error codes instead of -EFAULT.
  4. Add a missing clk_put(),
  5. Split the single cleanup block in separate phases, to avoid
     clk_put() calling WARN() when passed an error pointer.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v3:
  - New.
---
 drivers/clocksource/renesas-ostm.c | 54 ++++++++++++++++--------------
 1 file changed, 29 insertions(+), 25 deletions(-)

diff --git a/drivers/clocksource/renesas-ostm.c b/drivers/clocksource/renesas-ostm.c
index 37c39b901bb12b38..1e22e54d7b0df40d 100644
--- a/drivers/clocksource/renesas-ostm.c
+++ b/drivers/clocksource/renesas-ostm.c
@@ -155,7 +155,7 @@ static irqreturn_t ostm_timer_interrupt(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
-static int __init ostm_init_clkevt(struct ostm_device *ostm, int irq,
+static int __init ostm_init_clkevt(struct ostm_device *ostm, unsigned int irq,
 			unsigned long rate)
 {
 	struct clock_event_device *ced = &ostm->ced;
@@ -185,11 +185,11 @@ static int __init ostm_init_clkevt(struct ostm_device *ostm, int irq,
 
 static int __init ostm_init(struct device_node *np)
 {
-	struct ostm_device *ostm;
-	int ret = -EFAULT;
 	struct clk *ostm_clk = NULL;
-	int irq;
+	struct ostm_device *ostm;
 	unsigned long rate;
+	unsigned int irq;
+	int ret;
 
 	ostm = kzalloc(sizeof(*ostm), GFP_KERNEL);
 	if (!ostm)
@@ -197,27 +197,29 @@ static int __init ostm_init(struct device_node *np)
 
 	ostm->base = of_iomap(np, 0);
 	if (!ostm->base) {
-		pr_err("ostm: failed to remap I/O memory\n");
-		goto err;
+		ret = -ENOMEM;
+		goto err_free;
 	}
 
 	irq = irq_of_parse_and_map(np, 0);
-	if (irq < 0) {
+	if (!irq) {
 		pr_err("ostm: Failed to get irq\n");
-		goto err;
+		ret = -EINVAL;
+		goto err_unmap;
 	}
 
 	ostm_clk = of_clk_get(np, 0);
 	if (IS_ERR(ostm_clk)) {
 		pr_err("ostm: Failed to get clock\n");
 		ostm_clk = NULL;
-		goto err;
+		ret = PTR_ERR(ostm_clk);
+		goto err_unmap;
 	}
 
 	ret = clk_prepare_enable(ostm_clk);
 	if (ret) {
 		pr_err("ostm: Failed to enable clock\n");
-		goto err;
+		goto err_clk_put;
 	}
 
 	rate = clk_get_rate(ostm_clk);
@@ -229,28 +231,30 @@ static int __init ostm_init(struct device_node *np)
 	 */
 	if (!system_clock) {
 		ret = ostm_init_clksrc(ostm, rate);
+		if (ret)
+			goto err_clk_disable;
 
-		if (!ret) {
-			ostm_init_sched_clock(ostm, rate);
-			pr_info("ostm: used for clocksource\n");
-		}
-
+		ostm_init_sched_clock(ostm, rate);
+		pr_info("ostm: used for clocksource\n");
 	} else {
 		ret = ostm_init_clkevt(ostm, irq, rate);
+		if (ret)
+			goto err_clk_disable;
 
-		if (!ret)
-			pr_info("ostm: used for clock events\n");
-	}
-
-err:
-	if (ret) {
-		clk_disable_unprepare(ostm_clk);
-		iounmap(ostm->base);
-		kfree(ostm);
-		return ret;
+		pr_info("ostm: used for clock events\n");
 	}
 
 	return 0;
+
+err_clk_disable:
+	clk_disable_unprepare(ostm_clk);
+err_clk_put:
+	clk_put(ostm_clk);
+err_unmap:
+	iounmap(ostm->base);
+err_free:
+	kfree(ostm);
+	return ret;
 }
 
 TIMER_OF_DECLARE(ostm, "renesas,ostm", ostm_init);
-- 
2.17.1

