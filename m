Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD3D942EFF0
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 Oct 2021 13:47:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238516AbhJOLtt (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 15 Oct 2021 07:49:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235514AbhJOLts (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 15 Oct 2021 07:49:48 -0400
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7208C061570
        for <linux-renesas-soc@vger.kernel.org>; Fri, 15 Oct 2021 04:47:41 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:ad48:4534:27c0:db4b])
        by andre.telenet-ops.be with bizsmtp
        id 6Bnf2600U0SQF6f01Bnf0b; Fri, 15 Oct 2021 13:47:40 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mbLgZ-0053cg-K0; Fri, 15 Oct 2021 13:47:39 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mbLgZ-004hk2-4g; Fri, 15 Oct 2021 13:47:39 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] clk: renesas: Updates for v5.16 (take two)
Date:   Fri, 15 Oct 2021 13:47:36 +0200
Message-Id: <cover.1634298371.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

	Hi Mike, Stephen,

The following changes since commit cc3e8f97bbd370b51b3bb7fec391d65d461d7d02:

  clk: renesas: r8a779a0: Add Z0 and Z1 clock support (2021-09-28 09:28:53 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/renesas-clk-for-v5.16-tag2

for you to fetch changes up to 2bd9feed23166f5ab67dec2ca02bd3f74c77b0ba:

  clk: renesas: r8a779[56]x: Add MLP clocks (2021-10-15 09:46:14 +0200)

----------------------------------------------------------------
clk: renesas: Updates for v5.16 (take two)

  - Add SPI Multi I/O Bus and SDHI clocks and resets on RZ/G2L,
  - Add SPI Multi I/O Bus (RPC) clocks on R-Car V3U,
  - Add MediaLB clocks on R-Car H3, M3-W/W+, and M3-N.

Thanks for pulling!
----------------------------------------------------------------
Andrey Gusakov (1):
      clk: renesas: r8a779[56]x: Add MLP clocks

Biju Das (2):
      clk: renesas: rzg2l: Add SDHI clk mux support
      clk: renesas: r9a07g044: Add SDHI clock and reset entries

Lad Prabhakar (1):
      clk: renesas: r9a07g044: Add clock and reset entries for SPI Multi I/O Bus Controller

Wolfram Sang (2):
      clk: renesas: cpg-lib: Move RPC clock registration to the library
      clk: renesas: r8a779a0: Add RPC support

 drivers/clk/renesas/r8a7795-cpg-mssr.c  |   1 +
 drivers/clk/renesas/r8a7796-cpg-mssr.c  |   1 +
 drivers/clk/renesas/r8a77965-cpg-mssr.c |   1 +
 drivers/clk/renesas/r8a779a0-cpg-mssr.c |  32 +++++++++
 drivers/clk/renesas/r9a07g044-cpg.c     |  54 +++++++++++++++
 drivers/clk/renesas/rcar-cpg-lib.c      |  83 ++++++++++++++++++++++
 drivers/clk/renesas/rcar-cpg-lib.h      |   7 ++
 drivers/clk/renesas/rcar-gen3-cpg.c     |  89 +-----------------------
 drivers/clk/renesas/rzg2l-cpg.c         | 118 ++++++++++++++++++++++++++++++++
 drivers/clk/renesas/rzg2l-cpg.h         |  19 +++++
 10 files changed, 318 insertions(+), 87 deletions(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
