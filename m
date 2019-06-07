Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 771B1384E5
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  7 Jun 2019 09:24:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727627AbfFGHY0 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 7 Jun 2019 03:24:26 -0400
Received: from laurent.telenet-ops.be ([195.130.137.89]:38670 "EHLO
        laurent.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725962AbfFGHY0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 7 Jun 2019 03:24:26 -0400
Received: from ramsan ([84.194.111.163])
        by laurent.telenet-ops.be with bizsmtp
        id MjQP2000R3XaVaC01jQPpl; Fri, 07 Jun 2019 09:24:23 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hZ9Ed-0003jV-Cq; Fri, 07 Jun 2019 09:24:23 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hZ9Ed-0004Tv-B9; Fri, 07 Jun 2019 09:24:23 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [git pull] clk: renesas: Updates for v5.3
Date:   Fri,  7 Jun 2019 09:24:19 +0200
Message-Id: <20190607072419.17185-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

	Hi Mike, Stephen,

The following changes since commit a188339ca5a396acc588e5851ed7e19f66b0ebd9:

  Linux 5.2-rc1 (2019-05-19 15:47:09 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/clk-renesas-for-v5.3-tag1

for you to fetch changes up to aad03a66f902e18bab612870261bde647fdbda2c:

  clk: renesas: r9a06g032: Add clock domain support (2019-06-04 11:51:00 +0200)

----------------------------------------------------------------
clk: renesas: Updates for v5.3

  - Add TPU (Timer Pulse Unit / PWM) clocks on R-Car H3, M3-W, and M3-N,
  - Add CMM (Color Management Module) clocks on R-Car M3-W,
  - Add Clock Domain support on RZ/N1,
  - Small cleanups.

Thanks for pulling!

----------------------------------------------------------------
Cao Van Dong (1):
      clk: renesas: r8a779{5|6|65}: Add TPU clock

Gareth Williams (2):
      dt-bindings: clock: renesas: r9a06g032-sysctrl: Document power Domains
      clk: renesas: r9a06g032: Add clock domain support

Geert Uytterhoeven (3):
      clk: renesas: cpg-mssr: Use genpd of_node instead of local copy
      clk: renesas: cpg-mssr: Remove error messages on out-of-memory conditions
      clk: renesas: mstp: Remove error messages on out-of-memory conditions

Jacopo Mondi (1):
      clk: renesas: r8a7796: Add CMM clocks

 .../bindings/clock/renesas,r9a06g032-sysctrl.txt   |   7 +-
 drivers/clk/renesas/clk-mstp.c                     |   8 +-
 drivers/clk/renesas/r8a7795-cpg-mssr.c             |   1 +
 drivers/clk/renesas/r8a7796-cpg-mssr.c             |   4 +
 drivers/clk/renesas/r8a77965-cpg-mssr.c            |   1 +
 drivers/clk/renesas/r9a06g032-clocks.c             | 227 ++++++++++++++-------
 drivers/clk/renesas/renesas-cpg-mssr.c             |  12 +-
 7 files changed, 174 insertions(+), 86 deletions(-)
Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
