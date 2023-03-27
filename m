Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4F0BD6C9ED8
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Mar 2023 11:04:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233025AbjC0JEr (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 27 Mar 2023 05:04:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232529AbjC0JEE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 27 Mar 2023 05:04:04 -0400
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D84BC49E7
        for <linux-renesas-soc@vger.kernel.org>; Mon, 27 Mar 2023 02:03:05 -0700 (PDT)
Received: from ramsan.of.borg ([84.195.187.55])
        by michel.telenet-ops.be with bizsmtp
        id dM342900A1C8whw06M34eG; Mon, 27 Mar 2023 11:03:04 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1pgik8-00ExaK-Je;
        Mon, 27 Mar 2023 11:03:04 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1pgikq-002sSo-3n;
        Mon, 27 Mar 2023 11:03:04 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] clk: renesas: Updates for v6.4
Date:   Mon, 27 Mar 2023 11:03:01 +0200
Message-Id: <cover.1679907532.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.4 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

	Hi Mike, Stephen,

The following changes since commit fe15c26ee26efa11741a7b632e9f23b01aca4cc6:

  Linux 6.3-rc1 (2023-03-05 14:52:03 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/renesas-clk-for-v6.4-tag1

for you to fetch changes up to 72cd8436ece036294322fecf91567fef3ce3e868:

  clk: renesas: Convert to platform remove callback returning void (2023-03-16 16:54:21 +0100)

----------------------------------------------------------------
clk: renesas: Updates for v6.4

  - Add Audio, thermal, camera (CSI-2), Image Signal Processor/Channel
    Selector (ISPCS), and video capture (VIN) clocks on R-Car V4H,
  - Add video capture (VIN) clocks on R-Car V3H,
  - Add Cortex-A53 System CPU (Z2) clocks on R-Car V3M and V3H,
  - Miscellaneous fixes and improvements.

Thanks for pulling!

----------------------------------------------------------------
Geert Uytterhoeven (4):
      clk: renesas: r8a779g0: Add thermal clock
      clk: renesas: r8a77995: Fix VIN parent clock
      clk: renesas: r8a77970: Add Z2 clock
      clk: renesas: r8a77980: Add Z2 clock

Kuninori Morimoto (1):
      clk: renesas: r8a779g0: Add Audio clocks

Niklas Söderlund (4):
      clk: renesas: r8a779g0: Add CSI-2 clocks
      clk: renesas: r8a779g0: Add ISPCS clocks
      clk: renesas: r8a779g0: Add VIN clocks
      clk: renesas: r8a77980: Add VIN clocks

Ralph Siemsen (4):
      clk: renesas: r9a06g032: Improve readability
      clk: renesas: r9a06g032: Drop unused fields
      clk: renesas: r9a06g032: Document structs
      clk: renesas: r9a06g032: Improve clock tables

Takeshi Kihara (1):
      clk: renesas: cpg-mssr: Update MSSR register range for R-Car V4H

Uwe Kleine-König (1):
      clk: renesas: Convert to platform remove callback returning void

 drivers/clk/renesas/r8a77970-cpg-mssr.c   |   1 +
 drivers/clk/renesas/r8a77980-cpg-mssr.c   |  17 +
 drivers/clk/renesas/r8a77995-cpg-mssr.c   |   2 +-
 drivers/clk/renesas/r8a779g0-cpg-mssr.c   |  24 +
 drivers/clk/renesas/r9a06g032-clocks.c    | 736 ++++++++++++++++++++++--------
 drivers/clk/renesas/rcar-usb2-clock-sel.c |   6 +-
 drivers/clk/renesas/renesas-cpg-mssr.c    |   8 +-
 7 files changed, 590 insertions(+), 204 deletions(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
