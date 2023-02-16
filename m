Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 939E46998A7
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Feb 2023 16:20:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229724AbjBPPUb (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 16 Feb 2023 10:20:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229587AbjBPPUa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 16 Feb 2023 10:20:30 -0500
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DE7F6183
        for <linux-renesas-soc@vger.kernel.org>; Thu, 16 Feb 2023 07:20:28 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed50:4605:3635:9491:c6bc])
        by xavier.telenet-ops.be with bizsmtp
        id MrLR2900J3wKl5501rLRBu; Thu, 16 Feb 2023 16:20:25 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1pSg3F-009BUr-T8;
        Thu, 16 Feb 2023 16:20:24 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1pSg3c-005tX6-Jw;
        Thu, 16 Feb 2023 16:20:24 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/2] clk: renesas: R-Car V3M/V3H: Add Z2 clocks
Date:   Thu, 16 Feb 2023 16:20:17 +0100
Message-Id: <cover.1676560357.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

	Hi all,

This patch series adds support for the Z2 (Cortex-A53 System CPU) clocks
on the Renesas R-Car V3M and V3H SoCs.  These clocks use a fixed SYS-CPU
divider.

Note that the BSP went to great lengths to describe them as programmable
Z clocks, like on most other R-Car Gen3 SoCs, but add quirks to the Z
clock driver to use a fixed divider when running on R-Car V3M or V3H.
I chose the simpler way...

According to R-Car Series, 3rd Generation Hardware User’s Manual Rev.
2.30 and earlier, the SYS-CPU dividers on R-Car V3M and V3H are fixed
dividers.  Furthermore, the Frequency control register C, which is used
on other SoCs to control the SYS-CPU divider, is documented not to exist
on these SoCs (but empirical evidence shows that it does exist, and that
the Z2FC field works as expected (tested on Eagle and Condor)).

I intend to queue this series in renesas-clk-for-v6.4.

Thanks for your comments!

Geert Uytterhoeven (2):
  clk: renesas: r8a77970: Add Z2 clock
  clk: renesas: r8a77980: Add Z2 clock

 drivers/clk/renesas/r8a77970-cpg-mssr.c | 1 +
 drivers/clk/renesas/r8a77980-cpg-mssr.c | 1 +
 2 files changed, 2 insertions(+)

-- 
2.34.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
