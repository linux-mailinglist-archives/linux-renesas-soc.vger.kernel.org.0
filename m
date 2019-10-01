Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3B328C3F68
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Oct 2019 20:08:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727021AbfJASHt (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 1 Oct 2019 14:07:49 -0400
Received: from michel.telenet-ops.be ([195.130.137.88]:37250 "EHLO
        michel.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729420AbfJASHs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 1 Oct 2019 14:07:48 -0400
Received: from ramsan ([84.194.98.4])
        by michel.telenet-ops.be with bizsmtp
        id 8J7l2100805gfCL06J7l2D; Tue, 01 Oct 2019 20:07:45 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iFMYr-0008Ku-4p; Tue, 01 Oct 2019 20:07:45 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iFMYr-0000Ho-2G; Tue, 01 Oct 2019 20:07:45 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        linux-renesas-soc@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] serial: sh-sci: Use platform_get_irq_optional() for optional interrupts
Date:   Tue,  1 Oct 2019 20:07:43 +0200
Message-Id: <20191001180743.1041-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

As platform_get_irq() now prints an error when the interrupt does not
exist, scary warnings may be printed for optional interrupts:

    sh-sci e6550000.serial: IRQ index 1 not found
    sh-sci e6550000.serial: IRQ index 2 not found
    sh-sci e6550000.serial: IRQ index 3 not found
    sh-sci e6550000.serial: IRQ index 4 not found
    sh-sci e6550000.serial: IRQ index 5 not found

Fix this by calling platform_get_irq_optional() instead for all but the
first interrupts, which are optional.

Fixes: 7723f4c5ecdb8d83 ("driver core: platform: Add an error message to platform_get_irq*()")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
This is a fix for v5.4-rc1.
---
 drivers/tty/serial/sh-sci.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
index 4e754a4850e6db63..22e5d4e13714e863 100644
--- a/drivers/tty/serial/sh-sci.c
+++ b/drivers/tty/serial/sh-sci.c
@@ -2894,8 +2894,12 @@ static int sci_init_single(struct platform_device *dev,
 	port->mapbase = res->start;
 	sci_port->reg_size = resource_size(res);
 
-	for (i = 0; i < ARRAY_SIZE(sci_port->irqs); ++i)
-		sci_port->irqs[i] = platform_get_irq(dev, i);
+	for (i = 0; i < ARRAY_SIZE(sci_port->irqs); ++i) {
+		if (i)
+			sci_port->irqs[i] = platform_get_irq_optional(dev, i);
+		else
+			sci_port->irqs[i] = platform_get_irq(dev, i);
+	}
 
 	/* The SCI generates several interrupts. They can be muxed together or
 	 * connected to different interrupt lines. In the muxed case only one
-- 
2.17.1

