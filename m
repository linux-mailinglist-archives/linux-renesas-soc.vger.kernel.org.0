Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 64CD42B40B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 May 2019 14:04:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726632AbfE0MEQ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 27 May 2019 08:04:16 -0400
Received: from xavier.telenet-ops.be ([195.130.132.52]:54328 "EHLO
        xavier.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726689AbfE0MEQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 27 May 2019 08:04:16 -0400
Received: from ramsan ([84.194.111.163])
        by xavier.telenet-ops.be with bizsmtp
        id HQ4D2000M3XaVaC01Q4DqQ; Mon, 27 May 2019 14:04:13 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hVEMP-0001PW-Fq; Mon, 27 May 2019 14:04:13 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hVEMP-00015U-DQ; Mon, 27 May 2019 14:04:13 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <marc.zyngier@arm.com>
Cc:     linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 0/5] irqchip/renesas-irqc: Miscellaneous cleanups and improvements
Date:   Mon, 27 May 2019 14:04:07 +0200
Message-Id: <20190527120412.4071-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

	Hi Thomas, Jason, Marc,

This is a set of miscellaneous cleanups and improvements for the Renesas
R-Mobile APE6 and R-Car interrupt controller for external interrupts
(IRQC/INTC-EX) driver.

Changes compared to v1:
  - Add Reviewed-by,
  - s/devm_kzalloc/kzalloc/ in patch description, reword.

Thanks!

Geert Uytterhoeven (5):
  irqchip/renesas-irqc: Remove unneeded inclusion of <linux/spinlock.h>
  irqchip/renesas-irqc: Remove error messages on out-of-memory
    conditions
  irqchip/renesas-irqc: Add helper variable dev = &pdev->dev
  irqchip/renesas-irqc: Replace irqc_priv.pdev by irqc_priv.dev
  irqchip/renesas-irqc: Convert to managed initializations

 drivers/irqchip/irq-renesas-irqc.c | 88 ++++++++++--------------------
 1 file changed, 30 insertions(+), 58 deletions(-)

-- 
2.17.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
