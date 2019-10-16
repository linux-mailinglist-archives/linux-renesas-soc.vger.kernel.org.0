Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F2DD9D9441
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Oct 2019 16:48:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730455AbfJPOr7 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 16 Oct 2019 10:47:59 -0400
Received: from michel.telenet-ops.be ([195.130.137.88]:39049 "EHLO
        michel.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390354AbfJPOrx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 16 Oct 2019 10:47:53 -0400
Received: from ramsan ([84.194.98.4])
        by michel.telenet-ops.be with bizsmtp
        id EEnq2100C05gfCL06EnqET; Wed, 16 Oct 2019 16:47:51 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iKkac-0003rR-CL; Wed, 16 Oct 2019 16:47:50 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iKkac-0007hH-AL; Wed, 16 Oct 2019 16:47:50 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>
Cc:     Chris Brandt <chris.brandt@renesas.com>,
        Rob Herring <robh@kernel.org>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v4 2/4] clocksource/drivers/timer-of: Use unique device name instead of timer
Date:   Wed, 16 Oct 2019 16:47:45 +0200
Message-Id: <20191016144747.29538-3-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191016144747.29538-1-geert+renesas@glider.be>
References: <20191016144747.29538-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

If a hardware-specific driver does not provide a name, the timer-of core
falls back to device_node.name.  Due to generic DT node naming policies,
that name is almost always "timer", and thus doesn't identify the actual
timer used.

Fix this by using device_node.full_name instead, which includes the unit
addrees.

Example impact on /proc/timer_list:

    -Clock Event Device: timer
    +Clock Event Device: timer@fcfec400

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v4:
  - New.
---
 drivers/clocksource/timer-of.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clocksource/timer-of.c b/drivers/clocksource/timer-of.c
index 92cfb160657b81e2..572da477c6d35c5e 100644
--- a/drivers/clocksource/timer-of.c
+++ b/drivers/clocksource/timer-of.c
@@ -192,7 +192,7 @@ int __init timer_of_init(struct device_node *np, struct timer_of *to)
 	}
 
 	if (!to->clkevt.name)
-		to->clkevt.name = np->name;
+		to->clkevt.name = np->full_name;
 
 	to->np = np;
 
-- 
2.17.1

