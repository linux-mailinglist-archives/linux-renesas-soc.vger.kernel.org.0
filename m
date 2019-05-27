Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E6AE32B409
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 May 2019 14:04:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726941AbfE0MEQ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 27 May 2019 08:04:16 -0400
Received: from xavier.telenet-ops.be ([195.130.132.52]:54322 "EHLO
        xavier.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726632AbfE0MEQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 27 May 2019 08:04:16 -0400
Received: from ramsan ([84.194.111.163])
        by xavier.telenet-ops.be with bizsmtp
        id HQ4D2000N3XaVaC01Q4DqR; Mon, 27 May 2019 14:04:13 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hVEMP-0001PX-GN; Mon, 27 May 2019 14:04:13 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hVEMP-00015W-Ef; Mon, 27 May 2019 14:04:13 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <marc.zyngier@arm.com>
Cc:     linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 1/5] irqchip/renesas-irqc: Remove unneeded inclusion of <linux/spinlock.h>
Date:   Mon, 27 May 2019 14:04:08 +0200
Message-Id: <20190527120412.4071-2-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190527120412.4071-1-geert+renesas@glider.be>
References: <20190527120412.4071-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The driver never used spinlocks, and thus does not need to include
<linux/spinlock.h>.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
---
v2:
  - Add Reviewed-by.
---
 drivers/irqchip/irq-renesas-irqc.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/irqchip/irq-renesas-irqc.c b/drivers/irqchip/irq-renesas-irqc.c
index a449a7c839b3ec08..438a063c76156d98 100644
--- a/drivers/irqchip/irq-renesas-irqc.c
+++ b/drivers/irqchip/irq-renesas-irqc.c
@@ -7,7 +7,6 @@
 
 #include <linux/init.h>
 #include <linux/platform_device.h>
-#include <linux/spinlock.h>
 #include <linux/interrupt.h>
 #include <linux/ioport.h>
 #include <linux/io.h>
-- 
2.17.1

