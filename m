Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9323D7296A0
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 Jun 2023 12:16:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241399AbjFIKQH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 9 Jun 2023 06:16:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241828AbjFIKPG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 9 Jun 2023 06:15:06 -0400
Received: from gauss.telenet-ops.be (gauss.telenet-ops.be [IPv6:2a02:1800:120:4::f00:11])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A26B1FDE
        for <linux-renesas-soc@vger.kernel.org>; Fri,  9 Jun 2023 03:07:01 -0700 (PDT)
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by gauss.telenet-ops.be (Postfix) with ESMTPS id 4QcxZW60Mtz4xBg5
        for <linux-renesas-soc@vger.kernel.org>; Fri,  9 Jun 2023 12:06:59 +0200 (CEST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed30:a1e2:1b31:cba3:390d])
        by michel.telenet-ops.be with bizsmtp
        id 6y6z2A00E12zQ4r06y6zT5; Fri, 09 Jun 2023 12:06:59 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1q7Z0u-008L2e-Es;
        Fri, 09 Jun 2023 12:06:59 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1q7Z1H-00G43g-Fe;
        Fri, 09 Jun 2023 12:06:59 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] clk: renesas: Updates for v6.5 (take two)
Date:   Fri,  9 Jun 2023 12:06:58 +0200
Message-Id: <cover.1686304777.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

	Hi Mike, Stephen,

The following changes since commit d1c20885d3b01e6a62e920af4b227abd294d22f3:

  clk: renesas: rzg2l: Fix CPG_SIPLL5_CLK1 register write (2023-05-23 09:06:50 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/renesas-clk-for-v6.5-tag2

for you to fetch changes up to 7df8eea64a417f1db6777cddc1d7eda3634b7175:

  clk: renesas: rzg2l: Convert to readl_poll_timeout_atomic() (2023-06-05 15:41:43 +0200)

----------------------------------------------------------------
clk: renesas: Updates for v6.5 (take two)

  - Convert the Renesas clock drivers to readl_poll_timeout_atomic().

Note that the conversion to readl_poll_timeout_atomic() depends
on iopoll improvements, which are thus included through an immutable
branch in multiple pull requests:

  "[GIT PULL 2/3] Renesas driver updates for v6.5 (take two)" (for soc),
  "[GIT PULL] clk: renesas: Updates for v6.5 (take two)" (for clk).

Thanks for pulling!

----------------------------------------------------------------
Geert Uytterhoeven (6):
      iopoll: Call cpu_relax() in busy loops
      iopoll: Do not use timekeeping in read_poll_timeout_atomic()
      Merge tag 'iopoll-busy-loop-timeout-tag' into renesas-clk-for-v6.5
      clk: renesas: cpg-mssr: Convert to readl_poll_timeout_atomic()
      clk: renesas: mstp: Convert to readl_poll_timeout_atomic()
      clk: renesas: rzg2l: Convert to readl_poll_timeout_atomic()

 drivers/clk/renesas/clk-mstp.c         | 18 +++++++-----------
 drivers/clk/renesas/renesas-cpg-mssr.c | 31 +++++++++++--------------------
 drivers/clk/renesas/rzg2l-cpg.c        | 16 +++++-----------
 include/linux/iopoll.h                 | 24 +++++++++++++++++++-----
 4 files changed, 42 insertions(+), 47 deletions(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
