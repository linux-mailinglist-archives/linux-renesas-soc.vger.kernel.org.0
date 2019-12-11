Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3F41511AC71
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Dec 2019 14:52:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729267AbfLKNwZ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 11 Dec 2019 08:52:25 -0500
Received: from michel.telenet-ops.be ([195.130.137.88]:32946 "EHLO
        michel.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727851AbfLKNwZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 11 Dec 2019 08:52:25 -0500
Received: from ramsan ([84.195.182.253])
        by michel.telenet-ops.be with bizsmtp
        id cdsP2100W5USYZQ06dsPMJ; Wed, 11 Dec 2019 14:52:24 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1if2Pf-00014D-MF; Wed, 11 Dec 2019 14:52:23 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1if2Pf-0006yZ-KE; Wed, 11 Dec 2019 14:52:23 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 0/4] ARM: shmobile: Enable ARM_GLOBAL_TIMER on Cortex-A9 MPCore
Date:   Wed, 11 Dec 2019 14:52:18 +0100
Message-Id: <20191211135222.26770-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

        Hi all,

SH-Mobile AG5 and R-Car H1 SoCs are based on the Cortex-A9 MPCore, which
includes an ARM global timer.

Enable use of the global timer on these SoCs for scheduling and delay
loops, with the following impact:
  - Scheduler accuracy is increased from 10 ms to a few ns,
  - Calls to shmobile_init_delay() to preset loops-per-jiffies can be
    removed.
    Note that when using an old DTB lacking the global timer, the kernel
    will still work, but the delay loop will need to be calibrated
    during boot.

Note that we still need shmobile_init_delay() to setup loops-per-jiffies
for other SoCs lacking an architectured or global timer:
  - emev2: Dual-core Cortex-A9 r1p3,
  - r7s72100: single-core Cortex-A9 MPCore r3p0, global timer IRQ not
    wired?
  - r7s9210: single-core Cortex-A9 MPCore r4p1, global timer IRQ not
    wired?
  - r8a7740: single-core Cortex-A9 r2p4,
  - r8a7778: single-core Cortex-A9 r2p2-00rel0.

Changes compared to v1:
  - Rebased.

I have been using this on KZM-A9-GT (SH-Mobile AG5) and Marzen (R-Car
H1) for the last 18 months or so.
Hence I plan to queue the first 3 patches in renesas-devel for v5.6,
and postpone the 4th to v5.7.

Thanks!

Geert Uytterhoeven (4):
  ARM: dts: sh73a0: Rename twd clock to periph clock
  ARM: dts: sh73a0: Add device node for ARM global timer
  ARM: dts: r8a7779: Add device node for ARM global timer
  ARM: shmobile: Enable ARM_GLOBAL_TIMER on Cortex-A9 MPCore SoCs

 arch/arm/boot/dts/r8a7779.dtsi         |  8 ++++++++
 arch/arm/boot/dts/sh73a0.dtsi          | 11 +++++++++--
 arch/arm/mach-shmobile/setup-r8a7779.c |  1 -
 arch/arm/mach-shmobile/setup-sh73a0.c  |  1 -
 drivers/soc/renesas/Kconfig            |  2 ++
 5 files changed, 19 insertions(+), 4 deletions(-)

-- 
2.17.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
