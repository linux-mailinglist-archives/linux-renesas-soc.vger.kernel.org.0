Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E902DD943A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Oct 2019 16:47:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390379AbfJPOrw (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 16 Oct 2019 10:47:52 -0400
Received: from baptiste.telenet-ops.be ([195.130.132.51]:56548 "EHLO
        baptiste.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729748AbfJPOrw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 16 Oct 2019 10:47:52 -0400
Received: from ramsan ([84.194.98.4])
        by baptiste.telenet-ops.be with bizsmtp
        id EEnq2100B05gfCL01Enqly; Wed, 16 Oct 2019 16:47:51 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iKkac-0003rN-B8; Wed, 16 Oct 2019 16:47:50 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iKkac-0007hD-8Q; Wed, 16 Oct 2019 16:47:50 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>
Cc:     Chris Brandt <chris.brandt@renesas.com>,
        Rob Herring <robh@kernel.org>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v4 0/4] clocksource/drivers/timer-of/renesas-ostm improvements
Date:   Wed, 16 Oct 2019 16:47:43 +0200
Message-Id: <20191016144747.29538-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

	Hi Daniel, Thomas,

This patch series converts the Renesas OSTM driver to the timer-of
framework, and makes device names unique.

Changes compared to v3 ("[PATCH v3 0/3] clocksource/drivers/ostm:
Miscellaneous improvements",
https://lore.kernel.org/lkml/20190807084635.24173-1-geert+renesas@glider.be/):
  - Dropped applied [PATCH 1/3],
  - Dropped obsolete [PATCH 2/3],
  - Convert to timer_of as requested by Daniel,
  - Add new timer-of improvements.

Thanks!

Geert Uytterhoeven (4):
  clocksource/drivers/timer-of: Convert last full_name to %pOF
  clocksource/drivers/timer-of: Use unique device name instead of timer
  clocksource/drivers/renesas-ostm: Convert to timer_of
  clocksource/drivers/renesas-ostm: Use unique device name instead of
    ostm

 drivers/clocksource/Kconfig        |   1 +
 drivers/clocksource/renesas-ostm.c | 189 +++++++++++------------------
 drivers/clocksource/timer-of.c     |   6 +-
 3 files changed, 76 insertions(+), 120 deletions(-)

-- 
2.17.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
