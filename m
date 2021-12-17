Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D35C447897C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Dec 2021 12:07:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235158AbhLQLHe (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 17 Dec 2021 06:07:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233227AbhLQLHd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 Dec 2021 06:07:33 -0500
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51B4FC061574
        for <linux-renesas-soc@vger.kernel.org>; Fri, 17 Dec 2021 03:07:33 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:d13f:527c:5504:a743])
        by baptiste.telenet-ops.be with bizsmtp
        id XP7Y26010250X3001P7Ycf; Fri, 17 Dec 2021 12:07:33 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1myB5I-005Y9T-HW; Fri, 17 Dec 2021 12:07:32 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1myB5H-00AQUP-VA; Fri, 17 Dec 2021 12:07:31 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] clk: renesas: Updates for v5.17 (take two)
Date:   Fri, 17 Dec 2021 12:07:30 +0100
Message-Id: <cover.1639736964.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

	Hi Mike, Stephen,

The following changes since commit 33b22d9c3272003a525ba2d6b7b851f3d4f30574:

  clk: renesas: r9a07g044: Add TSU clock and reset entry (2021-11-26 14:06:16 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/renesas-clk-for-v5.17-tag2

for you to fetch changes up to f0b62b0bbedcdfde18116080605cebd9beec4ee9:

  clk: renesas: r9a07g044: Add GPU clock and reset entries (2021-12-08 10:05:56 +0100)

----------------------------------------------------------------
clk: renesas: Updates for v5.17 (take two)

  - Add support for the new R-Car S4-8 (R8A779F0) SoC,
  - Add GPU clock and resets on RZ/G2L,
  - Miscellaneous fixes and improvements.

Note that the new Renesas R-Car S4-8 DT Binding Definitions are shared by
driver and DT source files, and thus included in multiple pull requests:
  - "[GIT PULL 2/4] Renesas ARM DT updates for v5.17 (take two)" (for soc),
  - "[GIT PULL 3/4] Renesas driver updates for v5.17 (take two)" (for soc),
  - "[GIT PULL] clk: renesas: Updates for v5.17 (take two)" (for clk).

Thanks for pulling!
----------------------------------------------------------------
Biju Das (3):
      clk: renesas: r9a07g044: Rename CLK_PLL3_DIV4 macro
      clk: renesas: r9a07g044: Add mux and divider for G clock
      clk: renesas: r9a07g044: Add GPU clock and reset entries

Geert Uytterhoeven (1):
      Merge tag 'renesas-r8a779f0-dt-binding-defs-tag' into HEAD

Yoshihiro Shimoda (4):
      dt-bindings: power: Add r8a779f0 SYSC power domain definitions
      dt-bindings: clock: Add r8a779f0 CPG Core Clock Definitions
      clk: renesas: rcar-gen4: Introduce R-Car Gen4 CPG driver
      clk: renesas: cpg-mssr: Add support for R-Car S4-8

 drivers/clk/renesas/Kconfig                   |  13 +-
 drivers/clk/renesas/Makefile                  |   2 +
 drivers/clk/renesas/r8a779a0-cpg-mssr.c       | 350 ++------------------------
 drivers/clk/renesas/r8a779f0-cpg-mssr.c       | 183 ++++++++++++++
 drivers/clk/renesas/r9a07g044-cpg.c           |  19 +-
 drivers/clk/renesas/rcar-gen4-cpg.c           | 305 ++++++++++++++++++++++
 drivers/clk/renesas/rcar-gen4-cpg.h           |  76 ++++++
 drivers/clk/renesas/renesas-cpg-mssr.c        |  42 ++--
 drivers/clk/renesas/renesas-cpg-mssr.h        |   3 +-
 drivers/clk/renesas/rzg2l-cpg.h               |   4 +
 include/dt-bindings/clock/r8a779f0-cpg-mssr.h |  64 +++++
 include/dt-bindings/power/r8a779f0-sysc.h     |  30 +++
 12 files changed, 748 insertions(+), 343 deletions(-)
 create mode 100644 drivers/clk/renesas/r8a779f0-cpg-mssr.c
 create mode 100644 drivers/clk/renesas/rcar-gen4-cpg.c
 create mode 100644 drivers/clk/renesas/rcar-gen4-cpg.h
 create mode 100644 include/dt-bindings/clock/r8a779f0-cpg-mssr.h
 create mode 100644 include/dt-bindings/power/r8a779f0-sysc.h

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
