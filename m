Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A31E2B1E64
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Nov 2020 16:16:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726603AbgKMPQP (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 13 Nov 2020 10:16:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726278AbgKMPQO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 13 Nov 2020 10:16:14 -0500
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A860C0613D1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 13 Nov 2020 07:16:13 -0800 (PST)
Received: from ramsan.of.borg ([84.195.186.194])
        by xavier.telenet-ops.be with bizsmtp
        id rrGC2300E4C55Sk01rGCzx; Fri, 13 Nov 2020 16:16:12 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1kdao7-0028H2-VJ; Fri, 13 Nov 2020 16:16:11 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1kdao7-00GSwo-BQ; Fri, 13 Nov 2020 16:16:11 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] clk: renesas: Updates for v5.11
Date:   Fri, 13 Nov 2020 16:16:09 +0100
Message-Id: <20201113151609.3924469-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

	Hi Mike, Stephen,

The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:

  Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/renesas-clk-for-v5.11-tag1

for you to fetch changes up to cf5577a1cfc104c71f011738ab753bf2ac2f91ed:

  clk: renesas: r8a779a0: Fix R and OSC clocks (2020-11-10 09:25:46 +0100)

----------------------------------------------------------------
clk: renesas: Updates for v5.11

  - Update git repo branch for Renesas clock drivers,
  - Add camera (CSI) and video-in (VIN) clocks on R-Car V3U,
  - Add RPC (QSPI/HyperFLASH) clocks on RZ/G2M and RZ/G2N,
  - Minor fixes and improvements.

Thanks for pulling!
----------------------------------------------------------------
Biju Das (2):
      clk: renesas: r8a774a1: Add RPC clocks
      clk: renesas: r8a774b1: Add RPC clocks

Geert Uytterhoeven (3):
      clk: renesas: r8a779a0: Make rcar_r8a779a0_cpg_clk_register() static
      MAINTAINERS: Update git repo for Renesas clock drivers
      clk: renesas: r8a779a0: Fix R and OSC clocks

Jacopo Mondi (2):
      clk: renesas: r8a779a0: Add CSI4[0-3] clocks
      clk: renesas: r8a779a0: Add VIN clocks

Krzysztof Kozlowski (1):
      clk: renesas: cpg-mssr: fix kerneldoc of cpg_mssr_priv

Wolfram Sang (1):
      clk: renesas: rcar-gen3: Remove stp_ck handling for SDHI

Yejune Deng (1):
      clk: renesas: rcar-usb2-clock-sel: Replace devm_reset_control_array_get()

 MAINTAINERS                               |  2 +-
 drivers/clk/renesas/r8a774a1-cpg-mssr.c   |  8 +++++
 drivers/clk/renesas/r8a774b1-cpg-mssr.c   |  8 +++++
 drivers/clk/renesas/r8a779a0-cpg-mssr.c   | 51 ++++++++++++++++++++++++++++---
 drivers/clk/renesas/rcar-gen3-cpg.c       | 51 +++++++++++++++----------------
 drivers/clk/renesas/rcar-usb2-clock-sel.c |  2 +-
 drivers/clk/renesas/renesas-cpg-mssr.c    |  3 +-
 7 files changed, 92 insertions(+), 33 deletions(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
