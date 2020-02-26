Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D7C5D16FC71
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Feb 2020 11:42:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727860AbgBZKmm (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 26 Feb 2020 05:42:42 -0500
Received: from baptiste.telenet-ops.be ([195.130.132.51]:40134 "EHLO
        baptiste.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727686AbgBZKmm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 26 Feb 2020 05:42:42 -0500
Received: from ramsan ([84.195.182.253])
        by baptiste.telenet-ops.be with bizsmtp
        id 7Nie220025USYZQ01NiedP; Wed, 26 Feb 2020 11:42:39 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1j6u9F-0002FG-Uf; Wed, 26 Feb 2020 11:42:37 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1j6u9F-0004Ws-SE; Wed, 26 Feb 2020 11:42:37 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] clk: renesas: Updates for v5.7
Date:   Wed, 26 Feb 2020 11:42:35 +0100
Message-Id: <20200226104235.17367-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

	Hi Mike, Stephen,

The following changes since commit bb6d3fb354c5ee8d6bde2d576eb7220ea09862b9:

  Linux 5.6-rc1 (2020-02-09 16:08:48 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/clk-renesas-for-v5.7-tag1

for you to fetch changes up to 068e7f85234c0b56f55cc0259ad9c05f2c64b8fb:

  clk: renesas: Remove use of ARCH_R8A7795 (2020-02-21 14:01:54 +0100)

----------------------------------------------------------------
clk: renesas: Updates for v5.7

  - Add Crypto clocks on R-Car M3-W/W+, M3-N, E3, and D3,
  - Add RPC (QSPI/HyperFLASH) clocks on R-Car H3, M3-W/W+, and M3-N,
  - A small cleanup.

Thanks for pulling!
----------------------------------------------------------------
Dirk Behme (3):
      clk: renesas: r8a7795: Add RPC clocks
      clk: renesas: r8a7796: Add RPC clocks
      clk: renesas: r8a77965: Add RPC clocks

Geert Uytterhoeven (2):
      clk: renesas: rcar-gen3: Add CCREE clocks
      clk: renesas: Remove use of ARCH_R8A7795

 drivers/clk/renesas/Kconfig             |  2 +-
 drivers/clk/renesas/r8a7795-cpg-mssr.c  |  8 ++++++++
 drivers/clk/renesas/r8a7796-cpg-mssr.c  | 10 ++++++++++
 drivers/clk/renesas/r8a77965-cpg-mssr.c | 12 +++++++++++-
 drivers/clk/renesas/r8a77990-cpg-mssr.c |  2 ++
 drivers/clk/renesas/r8a77995-cpg-mssr.c |  2 ++
 6 files changed, 34 insertions(+), 2 deletions(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
