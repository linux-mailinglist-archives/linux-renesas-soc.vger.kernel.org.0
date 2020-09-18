Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4AC7D26FD7C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Sep 2020 14:48:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726986AbgIRMs0 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 18 Sep 2020 08:48:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726707AbgIRMsV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 Sep 2020 08:48:21 -0400
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E11FCC06174A
        for <linux-renesas-soc@vger.kernel.org>; Fri, 18 Sep 2020 05:48:20 -0700 (PDT)
Received: from ramsan ([84.195.186.194])
        by michel.telenet-ops.be with bizsmtp
        id VQoL2300A4C55Sk06QoLd2; Fri, 18 Sep 2020 14:48:20 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1kJFoK-00025R-Em; Fri, 18 Sep 2020 14:48:20 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1kJFoK-00045S-D6; Fri, 18 Sep 2020 14:48:20 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] clk: renesas: Updates for v5.10 (take two)
Date:   Fri, 18 Sep 2020 14:48:19 +0200
Message-Id: <20200918124819.15652-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

	Hi Mike, Stephen,

The following changes since commit e41cb217932969a20cea9c44299c449236058e43:

  clk: renesas: rcar-gen2: Rename vsp1-(sy|rt) clocks to vsp(s|r) (2020-09-04 09:42:01 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/clk-renesas-for-v5.10-tag2

for you to fetch changes up to 15d683e61bdded719e6202fed2c7401f4dcd95ab:

  clk: renesas: rcar-gen3: Update description for RZ/G2 (2020-09-17 15:32:25 +0200)

----------------------------------------------------------------
clk: renesas: Updates for v5.10 (take two)

  - Add support for the new R-Car V3U (R8A779A0) SoC,
  - Minor fixes and improvements.

Note that the new Renesas R-Car V3U DT Binding Definitions are shared by
driver and DT source files, and thus included in multiple pull requests:
  - "[GIT PULL 1/4] Renesas ARM DT updates for v5.10 (take two)" (for
    arm-soc),
  - "[GIT PULL 3/4] Renesas driver updates for v5.10 (take two)" (for
    arm-soc),
  - "[GIT PULL] clk: renesas: Updates for v5.10 (take two)" (for clk).

Thanks for pulling!
----------------------------------------------------------------
Geert Uytterhoeven (1):
      Merge tag 'renesas-r8a779a0-dt-binding-defs-tag' into clk-renesas-for-v5.10

Lad Prabhakar (1):
      clk: renesas: rcar-gen3: Update description for RZ/G2

Yoshihiro Shimoda (6):
      dt-bindings: power: Add r8a779a0 SYSC power domain definitions
      dt-bindings: clock: Add r8a779a0 CPG Core Clock Definitions
      dt-bindings: clock: renesas,cpg-mssr: Document r8a779a0
      clk: renesas: cpg-mssr: Use enum clk_reg_layout instead of a boolean flag
      clk: renesas: cpg-mssr: Add register pointers into struct cpg_mssr_priv
      clk: renesas: cpg-mssr: Add support for R-Car V3U

 .../bindings/clock/renesas,cpg-mssr.yaml           |   1 +
 drivers/clk/renesas/Kconfig                        |   7 +-
 drivers/clk/renesas/Makefile                       |   1 +
 drivers/clk/renesas/r7s9210-cpg-mssr.c             |   2 +-
 drivers/clk/renesas/r8a779a0-cpg-mssr.c            | 276 +++++++++++++++++++++
 drivers/clk/renesas/renesas-cpg-mssr.c             | 136 ++++++----
 drivers/clk/renesas/renesas-cpg-mssr.h             |  14 +-
 include/dt-bindings/clock/r8a779a0-cpg-mssr.h      |  55 ++++
 include/dt-bindings/power/r8a779a0-sysc.h          |  59 +++++
 9 files changed, 498 insertions(+), 53 deletions(-)
 create mode 100644 drivers/clk/renesas/r8a779a0-cpg-mssr.c
 create mode 100644 include/dt-bindings/clock/r8a779a0-cpg-mssr.h
 create mode 100644 include/dt-bindings/power/r8a779a0-sysc.h

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
