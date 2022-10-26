Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0EAC460DFA1
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Oct 2022 13:35:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233232AbiJZLfg (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 26 Oct 2022 07:35:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233365AbiJZLfe (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 26 Oct 2022 07:35:34 -0400
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59E9B84E62
        for <linux-renesas-soc@vger.kernel.org>; Wed, 26 Oct 2022 04:35:33 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed10:9dd:efb4:9ae5:d7b4])
        by xavier.telenet-ops.be with bizsmtp
        id cbbW280081HY1Pb01bbWrw; Wed, 26 Oct 2022 13:35:30 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1onegz-001Yl7-TR; Wed, 26 Oct 2022 13:35:29 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1onegz-00EcaD-FQ; Wed, 26 Oct 2022 13:35:29 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] clk: renesas: Fixes for v6.1
Date:   Wed, 26 Oct 2022 13:35:28 +0200
Message-Id: <cover.1666780184.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
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

The following changes since commit 9abf2313adc1ca1b6180c508c25f22f9395cc780:

  Linux 6.1-rc1 (2022-10-16 15:36:24 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/renesas-clk-fixes-for-v6.1-tag1

for you to fetch changes up to a9003f74f5a2f487e101f3aa1dd5c3d3a78c6999:

  clk: renesas: r8a779g0: Fix HSCIF parent clocks (2022-10-26 12:05:36 +0200)

----------------------------------------------------------------
clk: renesas: Fixes for v6.1

  - Correct the parent clocks for the High Speed Serial Communication
    Interfaces with FIFO (HSCIF) modules on the R-Car V4H SoC.
    Note that HSCIF0 is used for the serial console on the White-Hawk
    development board.

Thanks for pulling!

----------------------------------------------------------------
Geert Uytterhoeven (2):
      clk: renesas: r8a779g0: Add SASYNCPER clocks
      clk: renesas: r8a779g0: Fix HSCIF parent clocks

 drivers/clk/renesas/r8a779g0-cpg-mssr.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
