Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A93F866ABA3
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 14 Jan 2023 14:31:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229553AbjANNbA (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 14 Jan 2023 08:31:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229875AbjANNa7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 14 Jan 2023 08:30:59 -0500
X-Greylist: delayed 301 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sat, 14 Jan 2023 05:30:58 PST
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69A345243
        for <linux-renesas-soc@vger.kernel.org>; Sat, 14 Jan 2023 05:30:58 -0800 (PST)
Received: from ramsan.of.borg ([84.195.186.194])
        by xavier.telenet-ops.be with bizsmtp
        id 8dRv2900H4C55Sk01dRvNX; Sat, 14 Jan 2023 14:25:56 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1pGgXg-003z7a-38;
        Sat, 14 Jan 2023 14:25:55 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1pGgXj-006HxD-Pv;
        Sat, 14 Jan 2023 14:25:55 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] clk: renesas: Updates for v6.3
Date:   Sat, 14 Jan 2023 14:25:54 +0100
Message-Id: <cover.1673702689.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
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

The following changes since commit 1b929c02afd37871d5afb9d498426f83432e71c2:

  Linux 6.2-rc1 (2022-12-25 13:41:39 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/renesas-clk-for-v6.3-tag1

for you to fetch changes up to fbfd614aeaa2853c2c575299dfe2458db8eff67e:

  clk: renesas: cpg-mssr: Fix use after free if cpg_mssr_common_init() failed (2023-01-12 17:18:48 +0100)

----------------------------------------------------------------
clk: renesas: Updates for v6.3

  - Add PWM, Compare-Match Timer (TIM), USB, SDHI, and eMMC clocks and
    resets on RZ/V2M,
  - Add display clocks on R-Car V4H,
  - Add Camera Receiving Unit (CRU) clocks and resets on RZ/G2L,
  - Miscellaneous fixes and improvements.

Thanks for pulling!

----------------------------------------------------------------
Alexey Khoroshilov (1):
      clk: renesas: cpg-mssr: Fix use after free if cpg_mssr_common_init() failed

Biju Das (3):
      clk: renesas: r9a09g011: Add PWM clock and reset entries
      clk: renesas: r9a09g011: Add TIM clock and reset entries
      clk: renesas: r9a09g011: Add USB clock and reset entries

Geert Uytterhoeven (2):
      clk: renesas: r8a779g0: Fix OSC predividers
      clk: renesas: rcar-gen4: Restore PLL enum sort order

Lad Prabhakar (1):
      clk: renesas: r9a07g044: Add clock and reset entries for CRU

Phil Edworthy (1):
      clk: renesas: r9a09g011: Add SDHI/eMMC clock and reset entries

Tomi Valkeinen (1):
      clk: renesas: r8a779g0: Add display related clocks

 drivers/clk/renesas/r8a779g0-cpg-mssr.c | 17 ++++++--
 drivers/clk/renesas/r9a07g044-cpg.c     | 26 +++++++++++-
 drivers/clk/renesas/r9a09g011-cpg.c     | 73 +++++++++++++++++++++++++++++++++
 drivers/clk/renesas/rcar-gen4-cpg.h     |  2 +-
 drivers/clk/renesas/renesas-cpg-mssr.c  |  3 +-
 5 files changed, 114 insertions(+), 7 deletions(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
