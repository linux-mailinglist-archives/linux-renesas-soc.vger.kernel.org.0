Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BB5B8766C54
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Jul 2023 14:00:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236366AbjG1MAm (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 28 Jul 2023 08:00:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235815AbjG1MAg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 28 Jul 2023 08:00:36 -0400
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FDA5A0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 28 Jul 2023 04:59:51 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:12b0:7b7e:d1ff:7873])
        by xavier.telenet-ops.be with bizsmtp
        id Sbzp2A00f0d1nm801bzpmK; Fri, 28 Jul 2023 13:59:49 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qPM88-002mJ0-AH;
        Fri, 28 Jul 2023 13:59:49 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qPM8L-00AqPi-DR;
        Fri, 28 Jul 2023 13:59:49 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] clk: renesas: Updates for v6.6
Date:   Fri, 28 Jul 2023 13:59:48 +0200
Message-Id: <cover.1690545478.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
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

The following changes since commit 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5:

  Linux 6.5-rc1 (2023-07-09 13:53:13 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/renesas-clk-for-v6.6-tag1

for you to fetch changes up to dec57795efc4585d5bbca913af6683c5cce2a647:

  clk: renesas: r8a77965: Add 3DGE and ZG support (2023-07-27 14:32:46 +0200)

----------------------------------------------------------------
clk: renesas: Updates for v6.6

  - Add graphics clock support on RZ/G2M, RZ/G2N, RZ/G2E, and R-Car H3,
    M3-W, and M3-N SoCs,
  - Add Clocked Serial Interface (CSI) clocks on RZ/V2M,
  - Add PWM (MTU3) clock and reset on RZ/G2UL and RZ/Five,
  - Miscellaneous fixes and improvements.

Thanks for pulling!

----------------------------------------------------------------
Adam Ford (4):
      clk: renesas: rcar-gen3: Add support for ZG clock
      clk: renesas: r8a774a1: Add 3DGE and ZG support
      clk: renesas: r8a774e1: Add 3DGE and ZG support
      clk: renesas: r8a774b1: Add 3DGE and ZG support

Biju Das (1):
      clk: renesas: r9a07g043: Add MTU3a clock and reset entry

Christophe JAILLET (1):
      clk: renesas: rzg2l: Simplify .determine_rate()

Fabrizio Castro (1):
      clk: renesas: r9a09g011: Add CSI related clocks

Geert Uytterhoeven (4):
      clk: renesas: emev2: Remove obsolete clkdev registration
      clk: renesas: r8a7795: Add 3DGE and ZG support
      clk: renesas: r8a7796: Add 3DGE and ZG support
      clk: renesas: r8a77965: Add 3DGE and ZG support

 drivers/clk/renesas/clk-emev2.c         |  3 ---
 drivers/clk/renesas/r8a774a1-cpg-mssr.c |  2 ++
 drivers/clk/renesas/r8a774b1-cpg-mssr.c |  2 ++
 drivers/clk/renesas/r8a774e1-cpg-mssr.c |  2 ++
 drivers/clk/renesas/r8a7795-cpg-mssr.c  |  2 ++
 drivers/clk/renesas/r8a7796-cpg-mssr.c  |  2 ++
 drivers/clk/renesas/r8a77965-cpg-mssr.c |  2 ++
 drivers/clk/renesas/r9a07g043-cpg.c     |  3 +++
 drivers/clk/renesas/r9a09g011-cpg.c     | 15 ++++++++++++++
 drivers/clk/renesas/rcar-gen3-cpg.c     | 35 +++++++++++++++++++++++++++++----
 drivers/clk/renesas/rcar-gen3-cpg.h     |  1 +
 drivers/clk/renesas/rzg2l-cpg.c         |  8 +-------
 12 files changed, 63 insertions(+), 14 deletions(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
