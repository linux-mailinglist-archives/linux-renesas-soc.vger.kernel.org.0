Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A17A3DB98C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 Jul 2021 15:44:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238999AbhG3Noz (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 30 Jul 2021 09:44:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238992AbhG3Noy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 30 Jul 2021 09:44:54 -0400
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00219C061765
        for <linux-renesas-soc@vger.kernel.org>; Fri, 30 Jul 2021 06:44:49 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:69f0:c617:e432:6919])
        by albert.telenet-ops.be with bizsmtp
        id bRkn250052oLRg906RknpP; Fri, 30 Jul 2021 15:44:47 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1m9Sog-002Gs5-OL; Fri, 30 Jul 2021 15:44:46 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1m9Sog-00HKCm-8j; Fri, 30 Jul 2021 15:44:46 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] clk: renesas: Updates for v5.15
Date:   Fri, 30 Jul 2021 15:44:42 +0200
Message-Id: <cover.1627652021.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

	Hi Mike, Stephen,

The following changes since commit 2734d6c1b1a089fb593ef6a23d4b70903526fe0c:

  Linux 5.14-rc2 (2021-07-18 14:13:49 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/renesas-clk-for-v5.15-tag1

for you to fetch changes up to d28b1e03dc8d1070538ca3ea3f4e6732109ddf42:

  clk: renesas: r9a07g044: Add entry for fixed clock P0_DIV2 (2021-07-26 14:15:23 +0200)

----------------------------------------------------------------
clk: renesas: Updates for v5.15

  - Add display (DU and DSI) clocks on R-Car V3U,
  - Add I2C, DMAC, USB, sound (SSIF-2), GPIO, CANFD, and ADC clocks and
    resets on RZ/G2L,
  - Miscellaneous fixes and improvements.

Note:
  - This pull request is based on v5.14-rc2, as older versions do not
    include the atomic fixes to RZ/G2L DT binding definitions, clock
    driver, and DTS in renesas-fixes-for-v5.14-tag1,
  - This includes another update (append-only) to the Renesas RZ/G2L DT
    Binding Definitions, which is expected to appear in a later pull
    request for the soc tree, too.

Thanks for pulling!

----------------------------------------------------------------
Biju Das (4):
      clk: renesas: r9a07g044: Add I2C clocks/resets
      clk: renesas: r9a07g044: Add DMAC clocks/resets
      clk: renesas: r9a07g044: Add USB clocks/resets
      clk: renesas: r9a07g044: Add SSIF-2 clock and reset entries

Dan Carpenter (2):
      clk: renesas: rzg2l: Fix a double free on error
      clk: renesas: rzg2l: Avoid mixing error pointers and NULL

Geert Uytterhoeven (3):
      clk: renesas: rzg2: Rename i2c-dvfs to iic-pmic
      clk: renesas: Rename renesas-rzg2l-cpg.[ch] to rzg2l-cpg.[ch]
      Merge tag 'renesas-r9a07g044-dt-binding-defs-tag2' into renesas-clk-for-v5.15

Kieran Bingham (2):
      clk: renesas: r8a779a0: Add the DU clock
      clk: renesas: r8a779a0: Add the DSI clocks

Lad Prabhakar (6):
      clk: renesas: rzg2l: Fix off-by-one check in rzg2l_cpg_clk_src_twocell_get()
      clk: renesas: r9a07g044: Add GPIO clock and reset entries
      clk: renesas: r9a07g044: Add clock and reset entries for CANFD
      clk: renesas: r9a07g044: Add clock and reset entries for ADC
      dt-bindings: clock: r9a07g044-cpg: Add entry for P0_DIV2 core clock
      clk: renesas: r9a07g044: Add entry for fixed clock P0_DIV2

Yang Li (2):
      clk: renesas: rzg2l: Remove unneeded semicolon
      clk: renesas: rzg2l: Fix return value and unused assignment

 drivers/clk/renesas/Makefile                       |  2 +-
 drivers/clk/renesas/r8a774a1-cpg-mssr.c            |  2 +-
 drivers/clk/renesas/r8a774b1-cpg-mssr.c            |  2 +-
 drivers/clk/renesas/r8a774c0-cpg-mssr.c            |  2 +-
 drivers/clk/renesas/r8a774e1-cpg-mssr.c            |  2 +-
 drivers/clk/renesas/r8a779a0-cpg-mssr.c            |  5 +-
 drivers/clk/renesas/r9a07g044-cpg.c                | 72 +++++++++++++++++++++-
 .../renesas/{renesas-rzg2l-cpg.c => rzg2l-cpg.c}   | 22 +++----
 .../renesas/{renesas-rzg2l-cpg.h => rzg2l-cpg.h}   |  0
 include/dt-bindings/clock/r9a07g044-cpg.h          |  1 +
 10 files changed, 87 insertions(+), 23 deletions(-)
 rename drivers/clk/renesas/{renesas-rzg2l-cpg.c => rzg2l-cpg.c} (98%)
 rename drivers/clk/renesas/{renesas-rzg2l-cpg.h => rzg2l-cpg.h} (100%)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
