Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AB1F971240F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 May 2023 11:53:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242870AbjEZJx0 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 26 May 2023 05:53:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236264AbjEZJxY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 26 May 2023 05:53:24 -0400
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FC09D9
        for <linux-renesas-soc@vger.kernel.org>; Fri, 26 May 2023 02:53:23 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed30:ae30:9d2b:3228:d21])
        by michel.telenet-ops.be with bizsmtp
        id 1MtM2A00E4eYoVn06MtMno; Fri, 26 May 2023 11:53:22 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1q2U89-0038kI-9X;
        Fri, 26 May 2023 11:53:21 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1q2U8P-00EFcz-OQ;
        Fri, 26 May 2023 11:53:21 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] clk: renesas: Updates for v6.5
Date:   Fri, 26 May 2023 11:53:19 +0200
Message-Id: <cover.1685094576.git.geert+renesas@glider.be>
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

The following changes since commit ac9a78681b921877518763ba0e89202254349d1b:

  Linux 6.4-rc1 (2023-05-07 13:34:35 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/renesas-clk-for-v6.5-tag1

for you to fetch changes up to d1c20885d3b01e6a62e920af4b227abd294d22f3:

  clk: renesas: rzg2l: Fix CPG_SIPLL5_CLK1 register write (2023-05-23 09:06:50 +0200)

----------------------------------------------------------------
clk: renesas: Updates for v6.5

  - Add PWM clock on R-Car V3U,
  - Fix PLL5 on RZ/G2L and RZ/V2L.

Thanks for pulling!

----------------------------------------------------------------
Biju Das (1):
      clk: renesas: rzg2l: Fix CPG_SIPLL5_CLK1 register write

Wolfram Sang (1):
      clk: renesas: r8a779a0: Add PWM clock

 drivers/clk/renesas/r8a779a0-cpg-mssr.c | 1 +
 drivers/clk/renesas/rzg2l-cpg.c         | 6 ++----
 drivers/clk/renesas/rzg2l-cpg.h         | 3 ---
 3 files changed, 3 insertions(+), 7 deletions(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
