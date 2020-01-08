Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BCA54133DF3
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Jan 2020 10:13:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727512AbgAHJKe (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 8 Jan 2020 04:10:34 -0500
Received: from baptiste.telenet-ops.be ([195.130.132.51]:59748 "EHLO
        baptiste.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727352AbgAHJKe (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 8 Jan 2020 04:10:34 -0500
Received: from ramsan ([84.195.182.253])
        by baptiste.telenet-ops.be with bizsmtp
        id nlAY210055USYZQ01lAYoy; Wed, 08 Jan 2020 10:10:32 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1ip7MG-0003Ng-28; Wed, 08 Jan 2020 10:10:32 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1ip7MF-0001Vv-Ux; Wed, 08 Jan 2020 10:10:31 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] clk: renesas: Updates for v5.6
Date:   Wed,  8 Jan 2020 10:10:27 +0100
Message-Id: <20200108091027.5773-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

	Hi Mike, Stephen,

The following changes since commit e42617b825f8073569da76dc4510bfa019b1c35a:

  Linux 5.5-rc1 (2019-12-08 14:57:55 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/clk-renesas-for-v5.6-tag1

for you to fetch changes up to 8040bf4091cdd13b6d0f9ab00e621ae6eb29174d:

  clk: renesas: Prepare for split of R-Car H3 config symbol (2020-01-08 09:52:43 +0100)

----------------------------------------------------------------
clk: renesas: Updates for v5.6

  - Add SPIBSC (SPI FLASH) clock on RZ/A2,
  - Prepare for split of R-Car H3 ES1.x and ES2.0+ config symbols,
  - Minor fixes and cleanups.

Thanks for pulling!

----------------------------------------------------------------
Biju Das (1):
      dt-bindings: clock: renesas: cpg-mssr: Fix r8a774b1 typo

Chris Brandt (1):
      clk: renesas: r7s9210: Add SPIBSC clock

Geert Uytterhoeven (3):
      clk: renesas: rcar-gen2: Change multipliers and dividers to u8
      clk: renesas: Remove use of ARCH_R8A7796
      clk: renesas: Prepare for split of R-Car H3 config symbol

Sergei Shtylyov (1):
      clk: renesas: rcar-gen3: Allow changing the RPC[D2] clocks

 Documentation/devicetree/bindings/clock/renesas,cpg-mssr.txt | 2 +-
 drivers/clk/renesas/Kconfig                                  | 4 ++--
 drivers/clk/renesas/r7s9210-cpg-mssr.c                       | 1 +
 drivers/clk/renesas/rcar-gen2-cpg.h                          | 8 ++++----
 drivers/clk/renesas/rcar-gen3-cpg.c                          | 6 ++++--
 5 files changed, 12 insertions(+), 9 deletions(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
