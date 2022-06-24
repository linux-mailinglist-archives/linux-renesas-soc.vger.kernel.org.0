Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DA2FB559905
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Jun 2022 14:02:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230240AbiFXMBu (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 24 Jun 2022 08:01:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229641AbiFXMBt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 24 Jun 2022 08:01:49 -0400
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A07917E01C
        for <linux-renesas-soc@vger.kernel.org>; Fri, 24 Jun 2022 05:01:48 -0700 (PDT)
Received: from ramsan.of.borg ([84.195.186.194])
        by michel.telenet-ops.be with bizsmtp
        id n01o2700F4C55Sk0601oFH; Fri, 24 Jun 2022 14:01:48 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1o4i0R-000gXW-PT; Fri, 24 Jun 2022 14:01:47 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1o4i0Q-009mro-RY; Fri, 24 Jun 2022 14:01:46 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] clk: renesas: Updates for v5.20
Date:   Fri, 24 Jun 2022 14:01:43 +0200
Message-Id: <cover.1656071712.git.geert+renesas@glider.be>
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

The following changes since commit f2906aa863381afb0015a9eb7fefad885d4e5a56:

  Linux 5.19-rc1 (2022-06-05 17:18:54 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/renesas-clk-for-v5.20-tag1

for you to fetch changes up to 080bcd8d5997b1a615e17cab02bd9d16d1d4fbf3:

  clk: renesas: r8a779f0: Add HSCIF clocks (2022-06-17 09:14:13 +0200)

----------------------------------------------------------------
clk: renesas: Updates for v5.20

  - Add GPT/POEG (PWM) clocks and resets on RZ/G2L,
  - Add PFC and WDT clocks and resets on RZ/V2M,
  - Add thermal, SDHI, Z (CPU core), PCIe, and HSCIF (serial) clocks on
    R-Car S4-8,
  - Miscellaneous fixes and improvements.

Thanks for pulling!

----------------------------------------------------------------
Biju Das (3):
      clk: renesas: r9a07g044: Add GPT clock and reset entry
      clk: renesas: r9a07g044: Add POEG clock and reset entries
      clk: renesas: rzg2l: Fix reset status function

Geert Uytterhoeven (8):
      clk: renesas: r8a73a4: Remove r8a73a4_cpg.reg
      clk: renesas: r8a7740: Remove r8a7740_cpg.reg
      clk: renesas: sh73a0: Remove sh73a0_cpg.reg
      clk: renesas: r8a7778: Remove struct r8a7778_cpg
      clk: renesas: r8a7779: Remove struct r8a7779_cpg
      clk: renesas: rza1: Remove struct rz_cpg
      dt-bindings: clock: renesas,rzg2l: Simplify header file references
      clk: renesas: r8a779f0: Add Z0 and Z1 clock support

Phil Edworthy (2):
      clk: renesas: r9a09g011: Add PFC clock and reset entries
      clk: renesas: r9a09g011: Add WDT clock and reset entries

Ralph Siemsen (2):
      clk: renesas: r9a06g032: Drop some unused fields
      clk: renesas: r9a06g032: Fix UART clkgrp bitsel

Wolfram Sang (3):
      clk: renesas: r8a779f0: Add thermal clock
      clk: renesas: r8a779f0: Add SDHI0 clock
      clk: renesas: r8a779f0: Add HSCIF clocks

Yoshihiro Shimoda (1):
      clk: renesas: r8a779f0: Add PCIe clocks

 .../bindings/clock/renesas,rzg2l-cpg.yaml          |  7 ++---
 drivers/clk/renesas/clk-r8a73a4.c                  | 22 +++++++--------
 drivers/clk/renesas/clk-r8a7740.c                  | 20 ++++++-------
 drivers/clk/renesas/clk-r8a7778.c                  | 31 ++++++--------------
 drivers/clk/renesas/clk-r8a7779.c                  | 27 ++++++------------
 drivers/clk/renesas/clk-rz.c                       | 33 ++++++++++------------
 drivers/clk/renesas/clk-sh73a0.c                   | 26 ++++++++---------
 drivers/clk/renesas/r8a779f0-cpg-mssr.c            | 10 +++++++
 drivers/clk/renesas/r9a06g032-clocks.c             | 32 ++++++++++-----------
 drivers/clk/renesas/r9a07g044-cpg.c                | 17 ++++++++++-
 drivers/clk/renesas/r9a09g011-cpg.c                |  5 ++++
 drivers/clk/renesas/rzg2l-cpg.c                    |  2 +-
 12 files changed, 117 insertions(+), 115 deletions(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
