Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6021A847F9
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  7 Aug 2019 10:47:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728360AbfHGIrL (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 7 Aug 2019 04:47:11 -0400
Received: from laurent.telenet-ops.be ([195.130.137.89]:47992 "EHLO
        laurent.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728726AbfHGIqn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 7 Aug 2019 04:46:43 -0400
Received: from ramsan ([84.194.98.4])
        by laurent.telenet-ops.be with bizsmtp
        id m8mf2000T05gfCL018mfLg; Wed, 07 Aug 2019 10:46:41 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hvHah-0002dq-FT; Wed, 07 Aug 2019 10:46:39 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hvHah-0006Ij-EN; Wed, 07 Aug 2019 10:46:39 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Chris Brandt <Chris.Brandt@renesas.com>,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v3 1/3] clocksource/drivers/renesas-ostm: Use DIV_ROUND_CLOSEST() helper
Date:   Wed,  7 Aug 2019 10:46:33 +0200
Message-Id: <20190807084635.24173-2-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190807084635.24173-1-geert+renesas@glider.be>
References: <20190807084635.24173-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Use the DIV_ROUND_CLOSEST() helper instead of open-coding the same
operation.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v3:
  - New.
---
 drivers/clocksource/renesas-ostm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clocksource/renesas-ostm.c b/drivers/clocksource/renesas-ostm.c
index 61d5f3b539ce23df..37c39b901bb12b38 100644
--- a/drivers/clocksource/renesas-ostm.c
+++ b/drivers/clocksource/renesas-ostm.c
@@ -221,7 +221,7 @@ static int __init ostm_init(struct device_node *np)
 	}
 
 	rate = clk_get_rate(ostm_clk);
-	ostm->ticks_per_jiffy = (rate + HZ / 2) / HZ;
+	ostm->ticks_per_jiffy = DIV_ROUND_CLOSEST(rate, HZ);
 
 	/*
 	 * First probed device will be used as system clocksource. Any
-- 
2.17.1

