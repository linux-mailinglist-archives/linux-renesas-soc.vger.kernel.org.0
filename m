Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2E1D8D9443
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Oct 2019 16:48:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729020AbfJPOsD (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 16 Oct 2019 10:48:03 -0400
Received: from andre.telenet-ops.be ([195.130.132.53]:57838 "EHLO
        andre.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731987AbfJPOrx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 16 Oct 2019 10:47:53 -0400
Received: from ramsan ([84.194.98.4])
        by andre.telenet-ops.be with bizsmtp
        id EEnq2100E05gfCL01Enq5V; Wed, 16 Oct 2019 16:47:50 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iKkac-0003rO-B8; Wed, 16 Oct 2019 16:47:50 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iKkac-0007hF-9f; Wed, 16 Oct 2019 16:47:50 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>
Cc:     Chris Brandt <chris.brandt@renesas.com>,
        Rob Herring <robh@kernel.org>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v4 1/4] clocksource/drivers/timer-of: Convert last full_name to %pOF
Date:   Wed, 16 Oct 2019 16:47:44 +0200
Message-Id: <20191016144747.29538-2-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191016144747.29538-1-geert+renesas@glider.be>
References: <20191016144747.29538-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Commit 469869d18a886e04 ("clocksource: Convert to using %pOF instead of
full_name") converted all but the one just added before by commit
32f2fea6e77e64cd ("clocksource/drivers/timer-of: Handle
of_irq_get_byname() result correctly").

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v4:
  - New.
---
 drivers/clocksource/timer-of.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clocksource/timer-of.c b/drivers/clocksource/timer-of.c
index 11ff701ff4bb9907..92cfb160657b81e2 100644
--- a/drivers/clocksource/timer-of.c
+++ b/drivers/clocksource/timer-of.c
@@ -57,8 +57,8 @@ static __init int timer_of_irq_init(struct device_node *np,
 	if (of_irq->name) {
 		of_irq->irq = ret = of_irq_get_byname(np, of_irq->name);
 		if (ret < 0) {
-			pr_err("Failed to get interrupt %s for %s\n",
-			       of_irq->name, np->full_name);
+			pr_err("Failed to get interrupt %s for %pOF\n",
+			       of_irq->name, np);
 			return ret;
 		}
 	} else	{
-- 
2.17.1

