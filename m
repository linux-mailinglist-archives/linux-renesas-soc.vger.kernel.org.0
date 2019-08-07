Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 17AD4847DC
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  7 Aug 2019 10:46:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728473AbfHGIqm (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 7 Aug 2019 04:46:42 -0400
Received: from michel.telenet-ops.be ([195.130.137.88]:55920 "EHLO
        michel.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727541AbfHGIqm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 7 Aug 2019 04:46:42 -0400
Received: from ramsan ([84.194.98.4])
        by michel.telenet-ops.be with bizsmtp
        id m8md2000r05gfCL068meTU; Wed, 07 Aug 2019 10:46:40 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hvHaf-0002dn-SU; Wed, 07 Aug 2019 10:46:37 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hvHaf-0006If-QX; Wed, 07 Aug 2019 10:46:37 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Chris Brandt <Chris.Brandt@renesas.com>,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v3 0/3] clocksource/drivers/ostm: Miscellaneous improvements
Date:   Wed,  7 Aug 2019 10:46:32 +0200
Message-Id: <20190807084635.24173-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

	Hi all,

This patch series contains various improvements for the Renesas OSTM
timer driver, as used on the RZ/A1 and RZ/A2 SoCs.

The last patch is v3 of a patch that was sent before to a limited
audience:
  - https://lore.kernel.org/linux-renesas-soc/1507727130-17641-1-git-send-email-jacopo+renesas@jmondi.org/
  - https://lore.kernel.org/linux-renesas-soc/1507725113-18070-1-git-send-email-geert+renesas@glider.be/

Thanks!

Geert Uytterhoeven (3):
  clocksource/drivers/renesas-ostm: Use DIV_ROUND_CLOSEST() helper
  clocksource/drivers/renesas-ostm: Fix probe error path
  clocksource/drivers/ostm: Use unique device name instead of ostm

 drivers/clocksource/renesas-ostm.c | 95 ++++++++++++++++++------------
 1 file changed, 57 insertions(+), 38 deletions(-)

-- 
2.17.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
