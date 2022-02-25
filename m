Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3490A4C46B6
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 25 Feb 2022 14:39:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241553AbiBYNjO (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 25 Feb 2022 08:39:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235628AbiBYNjG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 25 Feb 2022 08:39:06 -0500
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9892C1DB3E8
        for <linux-renesas-soc@vger.kernel.org>; Fri, 25 Feb 2022 05:38:33 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:7d31:13ed:51c6:c7cc])
        by albert.telenet-ops.be with bizsmtp
        id zReX2600X0mlTBr06ReX9r; Fri, 25 Feb 2022 14:38:31 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nNann-00223B-CS; Fri, 25 Feb 2022 14:38:31 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nNanm-00E3Cg-P5; Fri, 25 Feb 2022 14:38:30 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] clk: renesas: Updates for v5.18 (take two)
Date:   Fri, 25 Feb 2022 14:38:29 +0100
Message-Id: <cover.1645795940.git.geert+renesas@glider.be>
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

The following changes since commit a1bcf50a99dd1e40f0c6a963bd4f12547a89d4cd:

  clk: renesas: rzg2l-cpg: Add support for RZ/V2L SoC (2022-02-10 14:34:58 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/renesas-clk-for-v5.18-tag2

for you to fetch changes up to 73421f2a48e6bd1d1024a09aedbc9c662cb88e77:

  clk: renesas: r8a779f0: Add PFC clock (2022-02-22 09:51:20 +0100)

----------------------------------------------------------------
clk: renesas: Updates for v5.18 (take two)

  - Add watchdog (WDT), I2C, and pin function controller (PFC) clocks on
    R-Car S4-8,
  - A small fix.

Thanks for pulling!

----------------------------------------------------------------
Geert Uytterhoeven (4):
      clk: renesas: r8a779f0: Fix RSW2 clock divider
      clk: renesas: r8a779f0: Add WDT clock
      clk: renesas: r8a779f0: Add I2C clocks
      clk: renesas: r8a779f0: Add PFC clock

 drivers/clk/renesas/r8a779f0-cpg-mssr.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
