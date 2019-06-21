Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E84CD4E8AE
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Jun 2019 15:13:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726250AbfFUNN6 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 21 Jun 2019 09:13:58 -0400
Received: from baptiste.telenet-ops.be ([195.130.132.51]:41462 "EHLO
        baptiste.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726571AbfFUNN6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 21 Jun 2019 09:13:58 -0400
Received: from ramsan ([84.194.111.163])
        by baptiste.telenet-ops.be with bizsmtp
        id TRDv2000W3XaVaC01RDvCY; Fri, 21 Jun 2019 15:13:56 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1heJMZ-00040d-Ig; Fri, 21 Jun 2019 15:13:55 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1heHiT-0000p0-VR; Fri, 21 Jun 2019 13:28:25 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [git pull] clk: renesas: Updates for v5.3 (take two)
Date:   Fri, 21 Jun 2019 13:28:21 +0200
Message-Id: <20190621112821.3104-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

	Hi Mike, Stephen,

The following changes since commit aad03a66f902e18bab612870261bde647fdbda2c:

  clk: renesas: r9a06g032: Add clock domain support (2019-06-04 11:51:00 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/clk-renesas-for-v5.3-tag2

for you to fetch changes up to ec2b827be39624bab743730385bc170d29472965:

  clk: renesas: cpg-mssr: Use [] to denote a flexible array member (2019-06-20 11:37:16 +0200)

----------------------------------------------------------------
clk: renesas: Updates for v5.3 (take two)

  - Add CMM (Color Management Module) clocks on R-Car H3, M3-N, E3, and
    D3,
  - Add TPU (Timer Pulse Unit / PWM) clocks on RZ/G2M,
  - Small cleanups and fixes.

Thanks for pulling!

----------------------------------------------------------------
Fabrizio Castro (1):
      clk: renesas: r8a774a1: Add TMU clock

Geert Uytterhoeven (5):
      clk: renesas: cpg-mssr: Update kerneldoc for struct cpg_mssr_priv
      clk: renesas: div6: Combine clock-private and parent array allocation
      clk: renesas: mstp: Combine group-private and clock array allocation
      clk: renesas: cpg-mssr: Combine driver-private and clock array allocation
      clk: renesas: cpg-mssr: Use [] to denote a flexible array member

Jacopo Mondi (4):
      clk: renesas: r8a7795: Add CMM clocks
      clk: renesas: r8a77965: Add CMM clocks
      clk: renesas: r8a77990: Add CMM clocks
      clk: renesas: r8a77995: Add CMM clocks

 drivers/clk/renesas/clk-div6.c          | 19 +++++--------------
 drivers/clk/renesas/clk-mstp.c          | 12 ++++++------
 drivers/clk/renesas/r8a774a1-cpg-mssr.c |  5 +++++
 drivers/clk/renesas/r8a7795-cpg-mssr.c  |  4 ++++
 drivers/clk/renesas/r8a77965-cpg-mssr.c |  3 +++
 drivers/clk/renesas/r8a77990-cpg-mssr.c |  2 ++
 drivers/clk/renesas/r8a77995-cpg-mssr.c |  2 ++
 drivers/clk/renesas/renesas-cpg-mssr.c  | 25 +++++++++----------------
 8 files changed, 36 insertions(+), 36 deletions(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
