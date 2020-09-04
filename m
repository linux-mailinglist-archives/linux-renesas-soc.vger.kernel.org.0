Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 287A525D7CB
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Sep 2020 13:48:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728118AbgIDLss (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 4 Sep 2020 07:48:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729659AbgIDLsn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 4 Sep 2020 07:48:43 -0400
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A35F8C061244
        for <linux-renesas-soc@vger.kernel.org>; Fri,  4 Sep 2020 04:48:41 -0700 (PDT)
Received: from ramsan ([84.195.186.194])
        by michel.telenet-ops.be with bizsmtp
        id Pnoh230084C55Sk06nohUf; Fri, 04 Sep 2020 13:48:41 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1kEACv-0004ep-6E; Fri, 04 Sep 2020 13:48:41 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1kEACv-0007u5-4p; Fri, 04 Sep 2020 13:48:41 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] clk: renesas: Updates for v5.10
Date:   Fri,  4 Sep 2020 13:48:38 +0200
Message-Id: <20200904114838.30339-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

	Hi Mike, Stephen,

The following changes since commit 9123e3a74ec7b934a4a099e98af6a61c2f80bbf5:

  Linux 5.9-rc1 (2020-08-16 13:04:57 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/clk-renesas-for-v5.10-tag1

for you to fetch changes up to e41cb217932969a20cea9c44299c449236058e43:

  clk: renesas: rcar-gen2: Rename vsp1-(sy|rt) clocks to vsp(s|r) (2020-09-04 09:42:01 +0200)

----------------------------------------------------------------
clk: renesas: Updates for v5.10

  - Add support for the VSP for Resizing clock on RZ/G1H,
  - Fix VSP clock names to match corrected hardware documentation.

Thanks for pulling!
----------------------------------------------------------------
Lad Prabhakar (2):
      clk: renesas: r8a7742: Add clk entry for VSPR
      clk: renesas: rcar-gen2: Rename vsp1-(sy|rt) clocks to vsp(s|r)

 drivers/clk/renesas/r8a7742-cpg-mssr.c  | 3 ++-
 drivers/clk/renesas/r8a7743-cpg-mssr.c  | 2 +-
 drivers/clk/renesas/r8a7745-cpg-mssr.c  | 2 +-
 drivers/clk/renesas/r8a77470-cpg-mssr.c | 2 +-
 drivers/clk/renesas/r8a7790-cpg-mssr.c  | 4 ++--
 drivers/clk/renesas/r8a7791-cpg-mssr.c  | 2 +-
 drivers/clk/renesas/r8a7792-cpg-mssr.c  | 2 +-
 drivers/clk/renesas/r8a7794-cpg-mssr.c  | 2 +-
 8 files changed, 10 insertions(+), 9 deletions(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
