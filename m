Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C6BA3940FD
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 May 2021 12:35:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236395AbhE1Khb (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 28 May 2021 06:37:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236456AbhE1Kha (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 28 May 2021 06:37:30 -0400
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7302FC061761
        for <linux-renesas-soc@vger.kernel.org>; Fri, 28 May 2021 03:35:54 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:751e:82a3:f2a2:3459])
        by baptiste.telenet-ops.be with bizsmtp
        id AAbs2500T20MPSF01AbsAc; Fri, 28 May 2021 12:35:52 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lmZqK-00AD9W-CA; Fri, 28 May 2021 12:35:52 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lmYBn-007GS2-0o; Fri, 28 May 2021 10:49:55 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] clk: renesas: Updates for v5.14
Date:   Fri, 28 May 2021 10:49:48 +0200
Message-Id: <cover.1622191519.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

	Hi Mike, Stephen,

The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627b5:

  Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/renesas-clk-for-v5.14-tag1

for you to fetch changes up to 790c06cc5df263cdaff748670cc65958c81b0951:

  clk: renesas: r8a77995: Add ZA2 clock (2021-05-27 15:27:28 +0200)

----------------------------------------------------------------
clk: renesas: Updates for v5.14

  - Add support for CPU core clock boost modes on R-Car Gen3,
  - Add ISPCS (Image Signal Processor) clocks on R-Car V3U,
  - Switch SH/R-Mobile and R-Car "DIV6" clocks to .determine_rate(),
    and improve support for multiple parents,
  - Switch RZ/N1 divider clocks to .determine_rate(),
  - Add ZA2 (Audio Clock Generator) clock on R-Car D3,
  - Minor fixes and improvements.

Thanks for pulling!

----------------------------------------------------------------
Dinghao Liu (1):
      clk: renesas: rcar-usb2-clock-sel: Fix error handling in .probe()

Geert Uytterhoeven (15):
      clk: renesas: rcar-gen3: Update Z clock rate formula in comments
      clk: renesas: rcar-gen3: Make cpg_z_clk.mask u32
      clk: renesas: rcar-gen3: Remove superfluous masking in cpg_z_clk_set_rate()
      clk: renesas: rcar-gen3: Grammar s/dependent of/dependent on/
      clk: renesas: rcar-gen3: Increase Z clock accuracy
      clk: renesas: rcar-gen3: Add custom clock for PLLs
      clk: renesas: rcar-gen3: Add boost support to Z clocks
      clk: renesas: div6: Use clamp() instead of clamp_t()
      clk: renesas: div6: Simplify src mask handling
      clk: renesas: div6: Switch to .determine_rate()
      clk: renesas: div6: Consider all parents for requested rate
      clk: renesas: div6: Implement range checking
      clk: renesas: r9a06g032: Switch to .determine_rate()
      clk: renesas: cpg-mssr: Remove unused [RM]MSTPCR() definitions
      clk: renesas: cpg-mssr: Make srstclr[] comment block consistent

Kuninori Morimoto (1):
      clk: renesas: r8a77995: Add ZA2 clock

Niklas Söderlund (1):
      clk: renesas: r8a779a0: Add ISPCS clocks

 drivers/clk/renesas/clk-div6.c            |  80 ++++++++-----
 drivers/clk/renesas/r8a77995-cpg-mssr.c   |   1 +
 drivers/clk/renesas/r8a779a0-cpg-mssr.c   |   4 +
 drivers/clk/renesas/r9a06g032-clocks.c    |  25 ++--
 drivers/clk/renesas/rcar-gen3-cpg.c       | 183 +++++++++++++++++++++++++-----
 drivers/clk/renesas/rcar-usb2-clock-sel.c |  24 ++--
 drivers/clk/renesas/renesas-cpg-mssr.c    |  10 +-
 7 files changed, 244 insertions(+), 83 deletions(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
