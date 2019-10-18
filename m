Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 29F7FDC37F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Oct 2019 13:02:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2633622AbfJRLBK (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 18 Oct 2019 07:01:10 -0400
Received: from baptiste.telenet-ops.be ([195.130.132.51]:60120 "EHLO
        baptiste.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2633619AbfJRLBH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 Oct 2019 07:01:07 -0400
Received: from ramsan ([84.194.98.4])
        by baptiste.telenet-ops.be with bizsmtp
        id Ez142100H05gfCL01z14uo; Fri, 18 Oct 2019 13:01:04 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iLQ0G-0005q3-IE; Fri, 18 Oct 2019 13:01:04 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iLPF3-0006t5-Kd; Fri, 18 Oct 2019 12:12:17 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] clk: renesas: Updates for v5.5
Date:   Fri, 18 Oct 2019 12:12:12 +0200
Message-Id: <20191018101212.26432-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

	Hi Mike, Stephen,

The following changes since commit 54ecb8f7028c5eb3d740bb82b0f1d90f2df63c5c:

  Linux 5.4-rc1 (2019-09-30 10:35:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/clk-renesas-for-v5.5-tag1

for you to fetch changes up to 56278c8fcb71874d591907d654272d511ce3597c:

  clk: renesas: r8a774b1: Add TMU clock (2019-10-07 14:29:53 +0200)

----------------------------------------------------------------
clk: renesas: Updates for v5.5

  - Add support for the new RZ/G2N (r8a774b1) SoC,
  - Remove R-Car Gen2 legacy DT clock support,
  - Improve arithmetic divisions on R-Car Gen2 and Gen3,
  - Improve R-Car Gen3 SD clock handling,
  - Minor cleanups.

Note that the new Renesas RZ/G2N DT Binding Definitions are shared by
driver and DT source files, and thus included in 3 pull requests:
  - "[GIT PULL] clk: renesas: Updates for v5.5] (for clk),
  - "[GIT PULL 3/5] Renesas ARM64 DT updates for v5.5" (for arm-soc),
  - "[GIT PULL 4/5] Renesas driver updates for v5.5" (for arm-soc).

If you prefer to merge this dependency explicitly, please pull tag
renesas-r8a774b1-dt-binding-defs-tag first.

Thanks for pulling!

----------------------------------------------------------------
Biju Das (5):
      dt-bindings: power: Add r8a774b1 SYSC power domain definitions
      dt-bindings: clk: Add r8a774b1 CPG Core Clock Definitions
      dt-bindings: clock: renesas: cpg-mssr: Document r8a774b1 binding
      clk: renesas: cpg-mssr: Add r8a774b1 support
      clk: renesas: r8a774b1: Add TMU clock

Geert Uytterhoeven (6):
      clk: renesas: Remove R-Car Gen2 legacy DT clock support
      clk: renesas: rcar-gen2: Improve arithmetic divisions
      clk: renesas: rcar-gen3: Improve arithmetic divisions
      clk: renesas: rcar-gen3: Avoid double table iteration in SD .set_rate()
      clk: renesas: rcar-gen3: Absorb cpg_sd_clock_calc_div()
      clk: renesas: rcar-gen3: Loop to find best rate in cpg_sd_clock_round_rate()

Markus Elfring (1):
      clk: renesas: mstp: Delete unnecessary kfree() in cpg_mstp_clocks_init()

 .../devicetree/bindings/clock/renesas,cpg-mssr.txt |  10 +-
 drivers/clk/renesas/Kconfig                        |  25 +-
 drivers/clk/renesas/Makefile                       |   2 +-
 drivers/clk/renesas/clk-mstp.c                     |   4 +-
 drivers/clk/renesas/clk-rcar-gen2.c                | 457 ---------------------
 drivers/clk/renesas/r8a774b1-cpg-mssr.c            | 327 +++++++++++++++
 drivers/clk/renesas/rcar-gen2-cpg.c                |   6 +-
 drivers/clk/renesas/rcar-gen3-cpg.c                |  37 +-
 drivers/clk/renesas/renesas-cpg-mssr.c             |   6 +
 drivers/clk/renesas/renesas-cpg-mssr.h             |   1 +
 include/dt-bindings/clock/r8a774b1-cpg-mssr.h      |  57 +++
 include/dt-bindings/power/r8a774b1-sysc.h          |  26 ++
 12 files changed, 449 insertions(+), 509 deletions(-)
 delete mode 100644 drivers/clk/renesas/clk-rcar-gen2.c
 create mode 100644 drivers/clk/renesas/r8a774b1-cpg-mssr.c
 create mode 100644 include/dt-bindings/clock/r8a774b1-cpg-mssr.h
 create mode 100644 include/dt-bindings/power/r8a774b1-sysc.h

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
