Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B7EFA6194EC
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Nov 2022 11:57:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229611AbiKDK52 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 4 Nov 2022 06:57:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231807AbiKDK5X (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 4 Nov 2022 06:57:23 -0400
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E5C92BB24
        for <linux-renesas-soc@vger.kernel.org>; Fri,  4 Nov 2022 03:57:22 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed10:c5ee:bf27:9df:5172])
        by andre.telenet-ops.be with bizsmtp
        id gAxL2800r2kjr6L01AxLJZ; Fri, 04 Nov 2022 11:57:20 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1oquNz-002mYT-Cw; Fri, 04 Nov 2022 11:57:19 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1oquNy-00HWNj-NL; Fri, 04 Nov 2022 11:57:18 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] clk: renesas: Updates for v6.2
Date:   Fri,  4 Nov 2022 11:57:17 +0100
Message-Id: <cover.1667559042.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

	Hi Mike, Stephen,

The following changes since commit a9003f74f5a2f487e101f3aa1dd5c3d3a78c6999:

  clk: renesas: r8a779g0: Fix HSCIF parent clocks (2022-10-26 12:05:36 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/renesas-clk-for-v6.2-tag1

for you to fetch changes up to 02693e11611e082e3c4d8653e8af028e43d31164:

  clk: renesas: r9a06g032: Repair grave increment error (2022-11-01 10:15:28 +0100)

----------------------------------------------------------------
clk: renesas: Updates for v6.2

  - Round SD clock rate to improve parent clock selection,
  - Add Ethernet Switch and internal SASYNCPER clocks on R-Car S4-8,
  - Add DMA (SYS-DMAC), SPI (MSIOF), external interrupt (INTC-EX),
    serial (SCIF), PWM (PWM and TPU), SDHI, and HyperFLASH/QSPI (RPC-IF)
    clocks on R-Car V4H,
  - Add Multi-Function Timer Pulse Unit (MTU3a) clock and reset on
    RZ/G2L,
  - Fix endless loop on RZ/N1,
  - Miscellaneous fixes and improvements.

Note that this includes my previous pull request for
renesas-clk-fixes-for-v6.1-tag1, which you have already pulled.

Thanks for pulling!

----------------------------------------------------------------
Biju Das (2):
      clk: renesas: rzg2l: Support sd clk mux round operation
      clk: renesas: r9a07g044: Add MTU3a clock and reset entry

Geert Uytterhoeven (11):
      clk: renesas: r8a779g0: Add SYS-DMAC clocks
      clk: renesas: r8a779g0: Add MSIOF clocks
      clk: renesas: r8a779g0: Add INTC-EX clock
      Merge tag 'renesas-clk-fixes-for-v6.1-tag1'
      clk: renesas: r8a779g0: Add SCIF clocks
      clk: renesas: r8a779g0: Add PWM clock
      clk: renesas: r8a779g0: Add TPU clock
      clk: renesas: r8a779f0: Fix SD0H clock name
      clk: renesas: r8a779f0: Add SASYNCPER internal clock
      clk: renesas: r8a779g0: Add SDHI clocks
      clk: renesas: r8a779g0: Add RPC-IF clock

Lad Prabhakar (5):
      clk: renesas: rzg2l: Fix typo in function name
      clk: renesas: r9a07g044: Drop WDT2 clock and reset entry
      clk: renesas: r9a07g043: Drop WDT2 clock and reset entry
      clk: renesas: rzg2l: Fix typo in struct rzg2l_cpg_priv kerneldoc
      clk: renesas: rzg2l: Don't assume all CPG_MOD clocks support PM

Marek Vasut (1):
      clk: renesas: r9a06g032: Repair grave increment error

Wolfram Sang (1):
      clk: renesas: r8a779a0: Fix SD0H clock name

Yoshihiro Shimoda (1):
      clk: renesas: r8a779f0: Add Ethernet Switch clocks

 drivers/clk/renesas/r8a779a0-cpg-mssr.c |  2 +-
 drivers/clk/renesas/r8a779f0-cpg-mssr.c | 12 +++++---
 drivers/clk/renesas/r8a779g0-cpg-mssr.c | 22 +++++++++++++--
 drivers/clk/renesas/r9a06g032-clocks.c  |  3 +-
 drivers/clk/renesas/r9a07g043-cpg.c     |  5 ----
 drivers/clk/renesas/r9a07g044-cpg.c     | 10 +++----
 drivers/clk/renesas/rzg2l-cpg.c         | 49 +++++++++++++++++++--------------
 drivers/clk/renesas/rzg2l-cpg.h         |  4 +++
 8 files changed, 67 insertions(+), 40 deletions(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
