Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3348A50BAD9
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 Apr 2022 16:55:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1391828AbiDVO6F (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 22 Apr 2022 10:58:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1449033AbiDVO6C (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 22 Apr 2022 10:58:02 -0400
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2AC34A19A
        for <linux-renesas-soc@vger.kernel.org>; Fri, 22 Apr 2022 07:55:08 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:2928:9f72:c4af:fbd9])
        by baptiste.telenet-ops.be with bizsmtp
        id Mqv72700c2Ah9RF01qv7Vh; Fri, 22 Apr 2022 16:55:07 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nhugd-001cR4-8c; Fri, 22 Apr 2022 16:55:07 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nhugc-00COnU-GI; Fri, 22 Apr 2022 16:55:06 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] clk: renesas: Updates for v5.19
Date:   Fri, 22 Apr 2022 16:55:05 +0200
Message-Id: <cover.1650638810.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

	Hi Mike, Stephen,

The following changes since commit 3123109284176b1532874591f7c81f3837bbdc17:

  Linux 5.18-rc1 (2022-04-03 14:08:21 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/renesas-clk-for-v5.19-tag1

for you to fetch changes up to 59086e4193f4fc920a23d2045a473f62450b4269:

  clk: renesas: r9a07g043: Add SDHI clock and reset entries (2022-04-13 12:30:19 +0200)

----------------------------------------------------------------
clk: renesas: Updates for v5.19

  - Add support for the new RZ/G2UL SoC,
  - Add RPC (QSPI/HyperFlash) clocks on R-Car E3 and D3,
  - Miscellaneous fixes and improvements.

Note that the new Renesas RZ/G2UL DT Binding Definitions are shared by
driver and DT source files, and thus included in multiple pull requests:
  - "[GIT PULL 2/4] Renesas ARM DT updates for v5.19" (for soc),
  - "[GIT PULL] clk: renesas: Updates for v5.19" (for clk).

Thanks for pulling!
----------------------------------------------------------------
Biju Das (7):
      dt-bindings: clock: renesas: Document RZ/G2UL SoC
      dt-bindings: clock: Add R9A07G043 CPG Clock and Reset Definitions
      clk: renesas: Add support for RZ/G2UL SoC
      clk: renesas: r9a07g043: Add GPIO clock and reset entries
      clk: renesas: r9a07g043: Add ethernet clock sources
      clk: renesas: r9a07g043: Add GbEthernet clock/reset
      clk: renesas: r9a07g043: Add SDHI clock and reset entries

Geert Uytterhoeven (5):
      clk: renesas: r8a77990: Add RPC clocks
      clk: renesas: r8a77995: Add RPC clocks
      clk: renesas: rzg2l: Simplify multiplication/shift logic
      clk: renesas: Move RPC core clocks
      Merge tag 'renesas-r9a07g043-dt-binding-defs-tag' into renesas-clk-for-v5.19

Phil Edworthy (1):
      clk: renesas: rzg2l: Remove unused notifiers

 .../bindings/clock/renesas,rzg2l-cpg.yaml          |   7 +-
 drivers/clk/renesas/Kconfig                        |   7 +-
 drivers/clk/renesas/Makefile                       |   1 +
 drivers/clk/renesas/r8a774a1-cpg-mssr.c            |   9 +-
 drivers/clk/renesas/r8a774b1-cpg-mssr.c            |   9 +-
 drivers/clk/renesas/r8a774c0-cpg-mssr.c            |   8 +-
 drivers/clk/renesas/r8a774e1-cpg-mssr.c            |   9 +-
 drivers/clk/renesas/r8a7795-cpg-mssr.c             |   9 +-
 drivers/clk/renesas/r8a7796-cpg-mssr.c             |   9 +-
 drivers/clk/renesas/r8a77965-cpg-mssr.c            |   9 +-
 drivers/clk/renesas/r8a77980-cpg-mssr.c            |  10 +-
 drivers/clk/renesas/r8a77990-cpg-mssr.c            |   7 +
 drivers/clk/renesas/r8a77995-cpg-mssr.c            |  11 +-
 drivers/clk/renesas/r8a779a0-cpg-mssr.c            |  11 +-
 drivers/clk/renesas/r8a779f0-cpg-mssr.c            |   9 +-
 drivers/clk/renesas/r9a07g043-cpg.c                | 220 +++++++++++++++++++++
 drivers/clk/renesas/rcar-gen3-cpg.h                |   5 +-
 drivers/clk/renesas/rzg2l-cpg.c                    |  10 +-
 drivers/clk/renesas/rzg2l-cpg.h                    |   1 +
 include/dt-bindings/clock/r9a07g043-cpg.h          | 184 +++++++++++++++++
 20 files changed, 488 insertions(+), 57 deletions(-)
 create mode 100644 drivers/clk/renesas/r9a07g043-cpg.c
 create mode 100644 include/dt-bindings/clock/r9a07g043-cpg.h

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
