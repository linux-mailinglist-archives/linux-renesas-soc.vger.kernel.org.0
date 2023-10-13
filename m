Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7F31C7C8610
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Oct 2023 14:48:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231562AbjJMMsa (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 13 Oct 2023 08:48:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229726AbjJMMs3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 13 Oct 2023 08:48:29 -0400
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A67FCC0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 13 Oct 2023 05:48:27 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:f151:5551:1af6:b316])
        by baptiste.telenet-ops.be with bizsmtp
        id xQoS2A00456FAx301QoSrl; Fri, 13 Oct 2023 14:48:26 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qrHaY-006Gh0-Gc;
        Fri, 13 Oct 2023 14:48:26 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qrHab-002JuK-St;
        Fri, 13 Oct 2023 14:48:25 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] clk: renesas: Updates for v6.7 (take two)
Date:   Fri, 13 Oct 2023 14:48:24 +0200
Message-Id: <cover.1697200833.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,
        SPF_NONE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

	Hi Mike, Stephen,


The following changes since commit 87882525e5ddae7ef6f1b1df5e1eda9bcbcd7720:

  clk: renesas: r8a7795: Constify r8a7795_*_clks (2023-09-26 09:38:00 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/renesas-clk-for-v6.7-tag2

for you to fetch changes up to 4bce4bedbe6daa54cf701184601f913a0c00bb1c:

  clk: renesas: r9a08g045: Add clock and reset support for SDHI1 and SDHI2 (2023-10-12 20:05:52 +0200)

----------------------------------------------------------------
clk: renesas: Updates for v6.7 (take two)

  - Add support for the RZ/G3S (R9A08G045) SoC,
  - Miscellaneous fixes and improvements.

Note that the clock definitions for the Renesas RZ/G3S (R9A08G045) SoC
are shared by clock driver and DT source files, and are part of a PR for
SoC, too.

Thanks for pulling!

----------------------------------------------------------------
Claudiu Beznea (14):
      dt-bindings: clock: renesas,rzg2l-cpg: Document RZ/G3S SoC
      clk: renesas: rzg2l: Wait for status bit of SD mux before continuing
      clk: renesas: rzg2l: Lock around writes to mux register
      clk: renesas: rzg2l: Trust value returned by hardware
      clk: renesas: rzg2l: Fix computation formula
      clk: renesas: rzg2l: Remove critical area
      clk: renesas: rzg2l: Add support for RZ/G3S PLL
      clk: renesas: rzg2l: Add struct clk_hw_data
      clk: renesas: rzg2l: Remove CPG_SDHI_DSEL from generic header
      clk: renesas: rzg2l: Refactor SD mux driver
      clk: renesas: rzg2l: Add divider clock for RZ/G3S
      clk: renesas: Add minimal boot support for RZ/G3S SoC
      clk: renesas: rzg2l: Use %x format specifier to print CLK_ON_R()
      clk: renesas: r9a08g045: Add clock and reset support for SDHI1 and SDHI2

Dirk Behme (1):
      clk: renesas: rcar-gen3: Extend SDnH divider table

Geert Uytterhoeven (1):
      Merge tag 'renesas-r9a08g045-dt-binding-defs-tag' into renesas-clk-for-v6.7

 .../bindings/clock/renesas,rzg2l-cpg.yaml          |   1 +
 drivers/clk/renesas/Kconfig                        |   7 +-
 drivers/clk/renesas/Makefile                       |   1 +
 drivers/clk/renesas/r9a07g043-cpg.c                |  19 +-
 drivers/clk/renesas/r9a07g044-cpg.c                |  19 +-
 drivers/clk/renesas/r9a08g045-cpg.c                | 248 +++++++++++
 drivers/clk/renesas/rcar-cpg-lib.c                 |  15 +-
 drivers/clk/renesas/rzg2l-cpg.c                    | 452 +++++++++++++++++----
 drivers/clk/renesas/rzg2l-cpg.h                    |  35 +-
 include/dt-bindings/clock/r9a08g045-cpg.h          | 242 +++++++++++
 10 files changed, 954 insertions(+), 85 deletions(-)
 create mode 100644 drivers/clk/renesas/r9a08g045-cpg.c
 create mode 100644 include/dt-bindings/clock/r9a08g045-cpg.h

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
