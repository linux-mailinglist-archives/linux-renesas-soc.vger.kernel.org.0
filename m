Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0D05656B887
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  8 Jul 2022 13:29:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237336AbiGHL1F (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 8 Jul 2022 07:27:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237831AbiGHL1E (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 8 Jul 2022 07:27:04 -0400
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 599FE904EA
        for <linux-renesas-soc@vger.kernel.org>; Fri,  8 Jul 2022 04:27:03 -0700 (PDT)
Received: from ramsan.of.borg ([84.195.186.194])
        by albert.telenet-ops.be with bizsmtp
        id sbT22700X4C55Sk06bT2bk; Fri, 08 Jul 2022 13:27:03 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1o9m8U-002bb6-Er; Fri, 08 Jul 2022 13:27:02 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1o9m8T-00BLY1-S6; Fri, 08 Jul 2022 13:27:01 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] clk: renesas: Updates for v5.20 (take two)
Date:   Fri,  8 Jul 2022 13:26:59 +0200
Message-Id: <cover.1657279252.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

	Hi Mike, Stephen,

The following changes since commit 080bcd8d5997b1a615e17cab02bd9d16d1d4fbf3:

  clk: renesas: r8a779f0: Add HSCIF clocks (2022-06-17 09:14:13 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/renesas-clk-for-v5.20-tag2

for you to fetch changes up to 0e704f6c42dc64f081d0b1738d06b2dee9524f27:

  clk: renesas: rcar-gen4: Fix initconst confusion for cpg_pll_config (2022-07-05 09:20:34 +0200)

----------------------------------------------------------------
clk: renesas: Updates for v5.20 (take two)

  - Add support for the RZ/Five SoC,
  - Fix initconst confusion on R-Car Gen4.

Thanks for pulling!

----------------------------------------------------------------
Andi Kleen (1):
      clk: renesas: rcar-gen4: Fix initconst confusion for cpg_pll_config

Geert Uytterhoeven (1):
      Merge tag 'renesas-r9a07g043-dt-binding-defs-tag2' into HEAD

Lad Prabhakar (2):
      dt-bindings: clock: r9a07g043-cpg: Add Renesas RZ/Five CPG Clock and Reset Definitions
      clk: renesas: r9a07g043: Add support for RZ/Five SoC

 drivers/clk/renesas/r9a07g043-cpg.c       | 32 +++++++++++++++++++++++++++++++
 drivers/clk/renesas/rcar-gen4-cpg.c       |  2 +-
 include/dt-bindings/clock/r9a07g043-cpg.h | 20 +++++++++++++++++++
 3 files changed, 53 insertions(+), 1 deletion(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
