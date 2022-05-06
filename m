Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F229251D4BA
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 May 2022 11:34:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1390629AbiEFJhO (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 6 May 2022 05:37:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355385AbiEFJhB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 6 May 2022 05:37:01 -0400
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEFA16A03F
        for <linux-renesas-soc@vger.kernel.org>; Fri,  6 May 2022 02:32:33 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:287c:a0f:7d45:dc7b])
        by albert.telenet-ops.be with bizsmtp
        id TMYX2700M1UVucw06MYXWg; Fri, 06 May 2022 11:32:31 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nmuK7-0038YF-1k; Fri, 06 May 2022 11:32:31 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nmuK6-00AemD-CJ; Fri, 06 May 2022 11:32:30 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] clk: renesas: Updates for v5.19 (take two)
Date:   Fri,  6 May 2022 11:32:29 +0200
Message-Id: <cover.1651829136.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

	Hi Mike, Stephen,

The following changes since commit 59086e4193f4fc920a23d2045a473f62450b4269:

  clk: renesas: r9a07g043: Add SDHI clock and reset entries (2022-04-13 12:30:19 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/renesas-clk-for-v5.19-tag2

for you to fetch changes up to 23426d1be3c20907b4f3d72bf95234d4ee254393:

  clk: renesas: r9a09g011: Add eth clock and reset entries (2022-05-06 09:38:40 +0200)

----------------------------------------------------------------
clk: renesas: Updates for v5.19 (take two)

  - Add support for the R-Car V4H and RZ/V2M SoCs,
  - Add the Universal Flash Storage clock on R-Car S4-8,
  - Add I2C, SSIF-2 (sound), USB, CANFD, OSTM (timer), WDT, SPI Multi
    I/O Bus, RSPI, TSU (thermal), and ADC clocks and resets on RZ/G2UL,
  - Add display clock support on RZ/G2L,
  - Miscellaneous fixes and improvements.

Note that the new Renesas R-Car V4H and RZ/V2M DT Binding Definitions
are shared by driver and DT source files, and thus included in multiple
pull requests:
  - "[GIT PULL 2/5] Renesas ARM DT updates for v5.19 (take two)" (for soc),
  - "[GIT PULL 4/5] Renesas driver updates for v5.19 (take two)" (for soc),
  - "[GIT PULL] clk: renesas: Updates for v5.19 (take two)" (for clk),

Thanks for pulling!
----------------------------------------------------------------
Biju Das (19):
      clk: renesas: r9a07g043: Add I2C clocks/resets
      clk: renesas: r9a07g043: Add SSIF-2 clock and reset entries
      clk: renesas: r9a07g043: Add USB clocks/resets
      clk: renesas: r9a07g043: Add clock and reset entries for CANFD
      clk: renesas: r9a07g043: Add OSTM clock and reset entries
      clk: renesas: r9a07g043: Add WDT clock and reset entries
      clk: renesas: rzg2l: Add FOUTPOSTDIV clk support
      clk: renesas: rzg2l: Add PLL5_4 clk mux support
      clk: renesas: rzg2l: Add DSI divider clk support
      clk: renesas: r9a07g044: Add M1 clock support
      clk: renesas: r9a07g044: Add {M2, M2_DIV2} Clocks support
      clk: renesas: r9a07g044: Add M3 Clock support
      clk: renesas: r9a07g044: Add M4 Clock support
      clk: renesas: r9a07g044: Add LCDC clock and reset entries
      clk: renesas: r9a07g044: Add DSI clock and reset entries
      clk: renesas: r9a07g043: Add clock and reset entries for SPI Multi I/O Bus Controller
      clk: renesas: r9a07g043: Add RSPI clock and reset entries
      clk: renesas: r9a07g043: Add TSU clock and reset entry
      clk: renesas: r9a07g043: Add clock and reset entries for ADC

Geert Uytterhoeven (3):
      Merge tag 'renesas-r8a779g0-dt-binding-defs-tag' into renesas-clk-for-v5.19
      clk: renesas: r9a07g044: Fix OSTM1 module clock name
      Merge tag 'renesas-r9a09g011-dt-binding-defs-tag' into renesas-clk-for-v5.19

Miquel Raynal (1):
      clk: renesas: r9a06g032: Fix the RTC hclock description

Phil Edworthy (9):
      dt-bindings: clock: Add r9a09g011 CPG Clock Definitions
      dt-bindings: clock: renesas,rzg2l: Document RZ/V2M SoC
      clk: renesas: rzg2l: Move the DEF_MUX array size calc into the macro
      clk: renesas: rzg2l: Add read only versions of the clk macros
      clk: renesas: rzg2l: Set HIWORD mask for all mux and dividers
      clk: renesas: rzg2l: Make use of CLK_MON registers optional
      clk: renesas: rzg2l: Add support for RZ/V2M reset monitor reg
      clk: renesas: Add RZ/V2M support using the rzg2l driver
      clk: renesas: r9a09g011: Add eth clock and reset entries

Yoshihiro Shimoda (6):
      dt-bindings: power: Add r8a779g0 SYSC power domain definitions
      dt-bindings: clock: Add r8a779g0 CPG Core Clock Definitions
      clk: renesas: r8a779f0: Add UFS clock
      dt-bindings: clock: renesas,cpg-mssr: Document r8a779g0
      clk: renesas: rcar-gen4: Add CLK_TYPE_GEN4_PLL4
      clk: renesas: cpg-mssr: Add support for R-Car V4H

 .../bindings/clock/renesas,cpg-mssr.yaml           |   1 +
 .../bindings/clock/renesas,rzg2l-cpg.yaml          |  13 +-
 drivers/clk/renesas/Kconfig                        |  10 +
 drivers/clk/renesas/Makefile                       |   2 +
 drivers/clk/renesas/r8a779a0-cpg-mssr.c            |  12 +-
 drivers/clk/renesas/r8a779f0-cpg-mssr.c            |  21 +-
 drivers/clk/renesas/r8a779g0-cpg-mssr.c            | 218 ++++++++++
 drivers/clk/renesas/r9a06g032-clocks.c             |   2 +-
 drivers/clk/renesas/r9a07g043-cpg.c                | 128 +++++-
 drivers/clk/renesas/r9a07g044-cpg.c                |  96 +++--
 drivers/clk/renesas/r9a09g011-cpg.c                | 172 ++++++++
 drivers/clk/renesas/rcar-gen4-cpg.c                |   5 +
 drivers/clk/renesas/rcar-gen4-cpg.h                |   3 +
 drivers/clk/renesas/renesas-cpg-mssr.c             |   6 +
 drivers/clk/renesas/renesas-cpg-mssr.h             |   1 +
 drivers/clk/renesas/rzg2l-cpg.c                    | 454 ++++++++++++++++++++-
 drivers/clk/renesas/rzg2l-cpg.h                    |  86 +++-
 include/dt-bindings/clock/r8a779g0-cpg-mssr.h      |  90 ++++
 include/dt-bindings/clock/r9a09g011-cpg.h          | 352 ++++++++++++++++
 include/dt-bindings/power/r8a779g0-sysc.h          |  45 ++
 20 files changed, 1644 insertions(+), 73 deletions(-)
 create mode 100644 drivers/clk/renesas/r8a779g0-cpg-mssr.c
 create mode 100644 drivers/clk/renesas/r9a09g011-cpg.c
 create mode 100644 include/dt-bindings/clock/r8a779g0-cpg-mssr.h
 create mode 100644 include/dt-bindings/clock/r9a09g011-cpg.h
 create mode 100644 include/dt-bindings/power/r8a779g0-sysc.h

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
