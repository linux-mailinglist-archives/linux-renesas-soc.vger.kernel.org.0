Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 24B95D93DD
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Oct 2019 16:30:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728279AbfJPOaG (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 16 Oct 2019 10:30:06 -0400
Received: from michel.telenet-ops.be ([195.130.137.88]:56938 "EHLO
        michel.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728033AbfJPOaG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 16 Oct 2019 10:30:06 -0400
Received: from ramsan ([84.194.98.4])
        by michel.telenet-ops.be with bizsmtp
        id EEW42100V05gfCL06EW4fZ; Wed, 16 Oct 2019 16:30:04 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iKkJQ-0003mr-9U; Wed, 16 Oct 2019 16:30:04 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iKkJQ-0007RO-7Y; Wed, 16 Oct 2019 16:30:04 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] clocksource/drivers/sh_mtu2: Do not loop using platform_get_irq_by_name()
Date:   Wed, 16 Oct 2019 16:30:03 +0200
Message-Id: <20191016143003.28561-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

As platform_get_irq_by_name() now prints an error when the interrupt
does not exist, looping over possibly non-existing interrupts causes the
printing of scary messages like:

    sh_mtu2 fcff0000.timer: IRQ tgi1a not found
    sh_mtu2 fcff0000.timer: IRQ tgi2a not found

Fix this by using the platform_irq_count() helper, to avoid touching
non-existent interrupts.  Limit the returned number of interrupts to the
maximum number of channels currently supported by the driver in a
future-proof way, i.e. using ARRAY_SIZE() instead of a hardcoded number.

Fixes: 7723f4c5ecdb8d83 ("driver core: platform: Add an error message to platform_get_irq*()")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
This is a fix for v5.4.
---
 drivers/clocksource/sh_mtu2.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/clocksource/sh_mtu2.c b/drivers/clocksource/sh_mtu2.c
index 354b27d14a19bfce..62812f80b5cc0916 100644
--- a/drivers/clocksource/sh_mtu2.c
+++ b/drivers/clocksource/sh_mtu2.c
@@ -328,12 +328,13 @@ static int sh_mtu2_register(struct sh_mtu2_channel *ch, const char *name)
 	return 0;
 }
 
+static const unsigned int sh_mtu2_channel_offsets[] = {
+	0x300, 0x380, 0x000,
+};
+
 static int sh_mtu2_setup_channel(struct sh_mtu2_channel *ch, unsigned int index,
 				 struct sh_mtu2_device *mtu)
 {
-	static const unsigned int channel_offsets[] = {
-		0x300, 0x380, 0x000,
-	};
 	char name[6];
 	int irq;
 	int ret;
@@ -356,7 +357,7 @@ static int sh_mtu2_setup_channel(struct sh_mtu2_channel *ch, unsigned int index,
 		return ret;
 	}
 
-	ch->base = mtu->mapbase + channel_offsets[index];
+	ch->base = mtu->mapbase + sh_mtu2_channel_offsets[index];
 	ch->index = index;
 
 	return sh_mtu2_register(ch, dev_name(&mtu->pdev->dev));
@@ -408,7 +409,12 @@ static int sh_mtu2_setup(struct sh_mtu2_device *mtu,
 	}
 
 	/* Allocate and setup the channels. */
-	mtu->num_channels = 3;
+	ret = platform_irq_count(pdev);
+	if (ret < 0)
+		goto err_unmap;
+
+	mtu->num_channels = min_t(unsigned int, ret,
+				  ARRAY_SIZE(sh_mtu2_channel_offsets));
 
 	mtu->channels = kcalloc(mtu->num_channels, sizeof(*mtu->channels),
 				GFP_KERNEL);
-- 
2.17.1

