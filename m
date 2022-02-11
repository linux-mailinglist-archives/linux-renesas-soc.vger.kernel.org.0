Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7DAB74B2952
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Feb 2022 16:46:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243944AbiBKPph (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 11 Feb 2022 10:45:37 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:56746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236013AbiBKPpg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 11 Feb 2022 10:45:36 -0500
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4ACA921F
        for <linux-renesas-soc@vger.kernel.org>; Fri, 11 Feb 2022 07:45:35 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:5d5d:ef67:a872:c0be])
        by xavier.telenet-ops.be with bizsmtp
        id trlY2600Q3ZSXJh01rlYHG; Fri, 11 Feb 2022 16:45:33 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nIY72-000MOQ-4P; Fri, 11 Feb 2022 16:45:32 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nIY71-00GiEd-FH; Fri, 11 Feb 2022 16:45:31 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] clk: renesas: Updates for v5.18
Date:   Fri, 11 Feb 2022 16:45:26 +0100
Message-Id: <cover.1644594116.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

	Hi Mike, Stephen,

The following changes since commit e783362eb54cd99b2cac8b3a9aeac942e6f6ac07:

  Linux 5.17-rc1 (2022-01-23 10:12:53 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/renesas-clk-for-v5.18-tag1

for you to fetch changes up to a1bcf50a99dd1e40f0c6a963bd4f12547a89d4cd:

  clk: renesas: rzg2l-cpg: Add support for RZ/V2L SoC (2022-02-10 14:34:58 +0100)

----------------------------------------------------------------
clk: renesas: Updates for v5.18

  - Add DMA engine (SYS-DMAC) clocks on R-Car S4-8,
  - Add MOST (MediaLB I/F) clocks on R-Car E3 and D3,
  - Add CAN-FD clocks on R-Car V3U,
  - Add support for the new RZ/V2L SoC,
  - Miscellaneous fixes and improvements.

Note that the new Renesas RZ/V2L DT Binding Definitions are shared by
driver and DT source files, and thus included in multiple pull requests:
  - "[GIT PULL 2/4] Renesas ARM DT updates for v5.18" (for soc),
  - "[GIT PULL] clk: renesas: Updates for v5.18" (for clk).

Thanks for pulling!

----------------------------------------------------------------
Biju Das (3):
      dt-bindings: clock: Add R9A07G054 CPG Clock and Reset Definitions
      dt-bindings: clock: renesas: Document RZ/V2L SoC
      clk: renesas: rzg2l-cpg: Add support for RZ/V2L SoC

Geert Uytterhoeven (1):
      Merge tag 'renesas-r9a07g054-dt-binding-defs-tag' into renesas-clk-for-v5.18

Lad Prabhakar (1):
      clk: renesas: r9a07g044: Update multiplier and divider values for PLL2/3

Nikita Yushchenko (1):
      clk: renesas: r8a7799[05]: Add MLP clocks

Ulrich Hecht (1):
      clk: renesas: r8a779a0: Add CANFD module clock

Yoshihiro Shimoda (1):
      clk: renesas: r8a779f0: Add SYS-DMAC clocks

 .../bindings/clock/renesas,rzg2l-cpg.yaml          |  14 +-
 drivers/clk/renesas/Kconfig                        |   7 +-
 drivers/clk/renesas/Makefile                       |   1 +
 drivers/clk/renesas/r8a77990-cpg-mssr.c            |   1 +
 drivers/clk/renesas/r8a77995-cpg-mssr.c            |   1 +
 drivers/clk/renesas/r8a779a0-cpg-mssr.c            |   1 +
 drivers/clk/renesas/r8a779f0-cpg-mssr.c            |   2 +
 drivers/clk/renesas/r9a07g044-cpg.c                | 426 ++++++++++++---------
 drivers/clk/renesas/rzg2l-cpg.c                    |   6 +
 drivers/clk/renesas/rzg2l-cpg.h                    |   1 +
 include/dt-bindings/clock/r9a07g054-cpg.h          | 229 +++++++++++
 11 files changed, 492 insertions(+), 197 deletions(-)
 create mode 100644 include/dt-bindings/clock/r9a07g054-cpg.h

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
