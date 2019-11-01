Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EBE59EC63D
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  1 Nov 2019 16:59:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726710AbfKAP7N (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 1 Nov 2019 11:59:13 -0400
Received: from xavier.telenet-ops.be ([195.130.132.52]:45778 "EHLO
        xavier.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726866AbfKAP7N (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 1 Nov 2019 11:59:13 -0400
Received: from ramsan ([84.195.182.253])
        by xavier.telenet-ops.be with bizsmtp
        id Lfz82100F5USYZQ01fz8ck; Fri, 01 Nov 2019 16:59:08 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iQZKO-0002rp-CD; Fri, 01 Nov 2019 16:59:08 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iQZKO-0008Du-Ap; Fri, 01 Nov 2019 16:59:08 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] clk: renesas: Updates for v5.5 (take two)
Date:   Fri,  1 Nov 2019 16:59:07 +0100
Message-Id: <20191101155907.31569-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

	Hi Mike, Stephen,

The following changes since commit 56278c8fcb71874d591907d654272d511ce3597c:

  clk: renesas: r8a774b1: Add TMU clock (2019-10-07 14:29:53 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/clk-renesas-for-v5.5-tag2

for you to fetch changes up to 2ba738d56db4ddb1c17e418cb501d303a8b481d2:

  clk: renesas: r8a7796: Add R8A77961 CPG/MSSR support (2019-11-01 13:36:39 +0100)

----------------------------------------------------------------
clk: renesas: Updates for v5.5 (take two)

  - Switch some clocks on R-Car Gen2/3 to .determine_rate(),
  - Add support for the new R-Car M3-W+ (r8a77961) SoC,
  - Minor fixes and cleanups.

Note that the new Renesas R-Car M3-W+ DT Binding Definitions are shared
by driver and DT source files, and thus included in 3 pull requests:
  - "[GIT PULL] clk: renesas: Updates for v5.5 (take two)" (for clk),
  - "[GIT PULL 4/6] Renesas ARM64 DT updates for v5.5 (take two)" (for
    arm-soc),
  - "[GIT PULL 5/6] Renesas driver updates for v5.5 (take two)" (for
    arm-soc).

If you prefer to merge this dependency explicitly, please pull tag
renesas-r8a77961-dt-binding-defs-tag first.

Thanks for pulling!

----------------------------------------------------------------
Geert Uytterhoeven (12):
      clk: renesas: rcar-gen2: Switch Z clock to .determine_rate()
      clk: renesas: rcar-gen3: Switch Z clocks to .determine_rate()
      clk: renesas: rcar-gen3: Switch SD clocks to .determine_rate()
      dt-bindings: power: Add r8a77961 SYSC power domain definitions
      dt-bindings: clock: Add r8a77961 CPG Core Clock Definitions
      dt-bindings: clock: renesas: Remove R-Car Gen2 legacy DT bindings
      dt-bindings: clock: renesas: rcar-usb2-clock-sel: Fix typo in example
      clk: renesas: r8a77965: Remove superfluous semicolon
      Merge tag 'renesas-r8a77961-dt-binding-defs-tag' into clk-renesas-for-v5.5
      dt-bindings: clock: renesas: cpg-mssr: Document r8a77961 support
      clk: renesas: Rename CLK_R8A7796 to CLK_R8A77960
      clk: renesas: r8a7796: Add R8A77961 CPG/MSSR support

 .../devicetree/bindings/clock/renesas,cpg-mssr.txt | 11 ++--
 .../clock/renesas,rcar-gen2-cpg-clocks.txt         | 60 --------------------
 .../bindings/clock/renesas,rcar-usb2-clock-sel.txt |  2 +-
 drivers/clk/renesas/Kconfig                        |  9 ++-
 drivers/clk/renesas/Makefile                       |  3 +-
 drivers/clk/renesas/r8a7796-cpg-mssr.c             | 24 ++++++--
 drivers/clk/renesas/r8a77965-cpg-mssr.c            |  2 +-
 drivers/clk/renesas/rcar-gen2-cpg.c                | 23 ++++----
 drivers/clk/renesas/rcar-gen3-cpg.c                | 41 +++++++++-----
 drivers/clk/renesas/renesas-cpg-mssr.c             |  8 ++-
 include/dt-bindings/clock/r8a77961-cpg-mssr.h      | 65 ++++++++++++++++++++++
 include/dt-bindings/power/r8a77961-sysc.h          | 32 +++++++++++
 12 files changed, 180 insertions(+), 100 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/renesas,rcar-gen2-cpg-clocks.txt
 create mode 100644 include/dt-bindings/clock/r8a77961-cpg-mssr.h
 create mode 100644 include/dt-bindings/power/r8a77961-sysc.h

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
