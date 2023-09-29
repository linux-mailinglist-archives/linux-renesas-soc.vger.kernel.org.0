Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1FACC7B311E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 Sep 2023 13:18:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232630AbjI2LSF (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 29 Sep 2023 07:18:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229687AbjI2LSE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 29 Sep 2023 07:18:04 -0400
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BF4ABF
        for <linux-renesas-soc@vger.kernel.org>; Fri, 29 Sep 2023 04:18:02 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:c2e7:1eb0:4c87:ebc6])
        by andre.telenet-ops.be with bizsmtp
        id rnJ02A0041EgHdD01nJ0ME; Fri, 29 Sep 2023 13:18:00 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qmBV0-004qOI-V6;
        Fri, 29 Sep 2023 13:18:00 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qmBVP-001fwm-Rb;
        Fri, 29 Sep 2023 13:17:59 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] clk: renesas: Updates for v6.7
Date:   Fri, 29 Sep 2023 13:17:57 +0200
Message-Id: <cover.1695985912.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

	Hi Mike, Stephen,

The following changes since commit 0bb80ecc33a8fb5a682236443c1e740d5c917d1d:

  Linux 6.6-rc1 (2023-09-10 16:28:41 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/renesas-clk-for-v6.7-tag1

for you to fetch changes up to 87882525e5ddae7ef6f1b1df5e1eda9bcbcd7720:

  clk: renesas: r8a7795: Constify r8a7795_*_clks (2023-09-26 09:38:00 +0200)

----------------------------------------------------------------
clk: renesas: Updates for v6.7

  - Miscellaneous fixes and improvements.

Thanks for pulling!

----------------------------------------------------------------
Claudiu Beznea (4):
      clk: renesas: rzg2l: Use core->name for clock name
      clk: renesas: rzg2l: Simplify the logic in rzg2l_mod_clock_endisable()
      clk: renesas: rzg2l: Use FIELD_GET() for PLL register fields
      clk: renesas: rzg2l: Use u32 for flag and mux_flags

Marek Vasut (1):
      clk: renesas: r8a7795: Constify r8a7795_*_clks

Ralph Siemsen (2):
      clk: renesas: r9a06g032: Fix kerneldoc warning
      clk: renesas: r9a06g032: Name anonymous structs

Yang Yingliang (1):
      clk: renesas: r9a06g032: Use for_each_compatible_node()

 drivers/clk/renesas/r8a7795-cpg-mssr.c |  4 +-
 drivers/clk/renesas/r9a06g032-clocks.c | 69 ++++++++++++++++++----------------
 drivers/clk/renesas/rzg2l-cpg.c        | 17 ++++-----
 drivers/clk/renesas/rzg2l-cpg.h        |  4 +-
 4 files changed, 48 insertions(+), 46 deletions(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
