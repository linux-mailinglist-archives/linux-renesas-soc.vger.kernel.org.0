Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A27AF46776F
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  3 Dec 2021 13:31:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1380808AbhLCMe1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 3 Dec 2021 07:34:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232849AbhLCMe1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 3 Dec 2021 07:34:27 -0500
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E612C06173E
        for <linux-renesas-soc@vger.kernel.org>; Fri,  3 Dec 2021 04:31:02 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed10:3191:9890:620a:6f4])
        by laurent.telenet-ops.be with bizsmtp
        id RoX02600w3eLghq01oX1Ec; Fri, 03 Dec 2021 13:31:01 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mt7iO-002KaG-G4; Fri, 03 Dec 2021 13:31:00 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mt7iN-000ibd-Ry; Fri, 03 Dec 2021 13:30:59 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] clk: renesas: Updates for v5.17
Date:   Fri,  3 Dec 2021 13:30:58 +0100
Message-Id: <cover.1638534376.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

	Hi Mike, Stephen,

The following changes since commit fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0dbf:

  Linux 5.16-rc1 (2021-11-14 13:56:52 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/renesas-clk-for-v5.17-tag1

for you to fetch changes up to 33b22d9c3272003a525ba2d6b7b851f3d4f30574:

  clk: renesas: r9a07g044: Add TSU clock and reset entry (2021-11-26 14:06:16 +0100)

----------------------------------------------------------------
clk: renesas: Updates for v5.17

  - Add serial (SCI1), watchdog (WDT), timer (OSTM), SPI (RSPI), and
    thermal (TSU) clocks and resets on RZ/G2L,
  - Rework SDHI clock handling in the R-Car Gen3 and RZ/G2 clock
    drivers, and in the Renesas SDHI driver,
  - Make the Cortex-A55 (I) clock on RZ/G2L programmable,
  - Document support for the new R-Car S4-8 (R8A779F0) SoC,
  - Miscellaneous fixes and improvements.

Note that due to dependencies between Renesas Clock and Renesas SDHI
driver changes, I'm handling Renesas SDHI changes for this cycle.
Hence the presence of several Renesas SDHI commits.

Thanks for pulling!
----------------------------------------------------------------
Biju Das (6):
      clk: renesas: r9a07g044: Add WDT clock and reset entries
      clk: renesas: r9a07g044: Rename CLK_PLL2_DIV16 and CLK_PLL2_DIV20 macros
      clk: renesas: r9a07g044: Add OSTM clock and reset entries
      clk: renesas: rzg2l: Add CPG_PL1_DDIV macro
      clk: renesas: r9a07g044: Change core clock "I" from DEF_FIXED->DEF_DIV
      clk: renesas: r9a07g044: Add TSU clock and reset entry

Geert Uytterhoeven (2):
      clk: renesas: rzg2l: Add missing kerneldoc for resets
      mmc: renesas_sdhi: Use devm_clk_get_optional() to obtain CD clock

Lad Prabhakar (6):
      clk: renesas: r9a07g044: Add clock and reset entry for SCI1
      clk: renesas: r9a07g044: Add RSPI clock and reset entries
      clk: renesas: rzg2l: Check return value of pm_genpd_init()
      clk: renesas: rzg2l: propagate return value of_genpd_add_provider_simple()
      clk: renesas: cpg-mssr: Check return value of pm_genpd_init()
      clk: renesas: cpg-mssr: propagate return value of_genpd_add_provider_simple()

Wolfram Sang (9):
      clk: renesas: rcar-gen3: Add dummy SDnH clock
      clk: renesas: rcar-gen3: Add SDnH clock
      clk: renesas: r8a779a0: Add SDnH clock to V3U
      mmc: renesas_sdhi: Flag non-standard SDnH handling for V3M
      clk: renesas: rcar-gen3: Switch to new SD clock handling
      clk: renesas: rcar-gen3: Remove outdated SD_SKIP_FIRST
      mmc: renesas_sdhi: Use dev_err_probe when getting clock fails
      mmc: renesas_sdhi: Parse DT for SDnH
      mmc: renesas_sdhi: Simplify an expression

Yoshihiro Shimoda (1):
      dt-bindings: clock: renesas,cpg-mssr: Document r8a779f0

 .../bindings/clock/renesas,cpg-mssr.yaml           |   1 +
 drivers/clk/renesas/r8a774a1-cpg-mssr.c            |  12 +-
 drivers/clk/renesas/r8a774b1-cpg-mssr.c            |  12 +-
 drivers/clk/renesas/r8a774c0-cpg-mssr.c            |   9 +-
 drivers/clk/renesas/r8a774e1-cpg-mssr.c            |  12 +-
 drivers/clk/renesas/r8a7795-cpg-mssr.c             |  12 +-
 drivers/clk/renesas/r8a7796-cpg-mssr.c             |  12 +-
 drivers/clk/renesas/r8a77965-cpg-mssr.c            |  12 +-
 drivers/clk/renesas/r8a77980-cpg-mssr.c            |   3 +-
 drivers/clk/renesas/r8a77990-cpg-mssr.c            |   9 +-
 drivers/clk/renesas/r8a77995-cpg-mssr.c            |   3 +-
 drivers/clk/renesas/r8a779a0-cpg-mssr.c            |  17 +-
 drivers/clk/renesas/r9a07g044-cpg.c                |  62 +++++-
 drivers/clk/renesas/rcar-cpg-lib.c                 | 211 +++------------------
 drivers/clk/renesas/rcar-cpg-lib.h                 |   7 +-
 drivers/clk/renesas/rcar-gen3-cpg.c                |  24 +--
 drivers/clk/renesas/rcar-gen3-cpg.h                |   4 +
 drivers/clk/renesas/renesas-cpg-mssr.c             |  18 +-
 drivers/clk/renesas/rzg2l-cpg.c                    |  18 +-
 drivers/clk/renesas/rzg2l-cpg.h                    |   5 +
 drivers/mmc/host/renesas_sdhi.h                    |   4 +
 drivers/mmc/host/renesas_sdhi_core.c               |  45 +++--
 drivers/mmc/host/renesas_sdhi_internal_dmac.c      |  21 ++
 23 files changed, 269 insertions(+), 264 deletions(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
