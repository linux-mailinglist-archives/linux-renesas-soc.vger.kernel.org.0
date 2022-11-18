Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B7E5262FADC
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Nov 2022 17:54:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242287AbiKRQy1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 18 Nov 2022 11:54:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241871AbiKRQy0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 Nov 2022 11:54:26 -0500
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE5A56A764
        for <linux-renesas-soc@vger.kernel.org>; Fri, 18 Nov 2022 08:54:25 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed10:d0b:c833:41f6:da0e])
        by andre.telenet-ops.be with bizsmtp
        id lsu82800A29fmst01su8nt; Fri, 18 Nov 2022 17:54:08 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1ow4cy-000pG8-5F; Fri, 18 Nov 2022 17:54:08 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1ow4cx-00Fros-9U; Fri, 18 Nov 2022 17:54:07 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] clk: renesas: Updates for v6.2 (take two)
Date:   Fri, 18 Nov 2022 17:54:05 +0100
Message-Id: <cover.1668789961.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

	Hi Mike, Stephen,

The following changes since commit 02693e11611e082e3c4d8653e8af028e43d31164:

  clk: renesas: r9a06g032: Repair grave increment error (2022-11-01 10:15:28 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/renesas-clk-for-v6.2-tag2

for you to fetch changes up to 777bcc85e1fbadfea1927e828165102cf5050b53:

  clk: renesas: r8a779f0: Fix Ethernet Switch clocks (2022-11-16 09:05:59 +0100)

----------------------------------------------------------------
clk: renesas: Updates for v6.2 (take two)

  - Correct the parent clocks for the (High Speed) Serial Communication
    Interfaces with FIFO ((H)SCIF) modules and the mixed-up Ethernet
    Switch clocks on R-Car S4-8,
  - Add timer (TMU, CMT) and Cortex-A76 CPU core (Z0) clocks on R-Car
    V4H.

Thanks for pulling!

----------------------------------------------------------------
Geert Uytterhoeven (2):
      clk: renesas: r8a779g0: Add Z0 clock support
      clk: renesas: r8a779f0: Fix Ethernet Switch clocks

Wolfram Sang (4):
      clk: renesas: r8a779f0: Fix HSCIF parent clocks
      clk: renesas: r8a779f0: Fix SCIF parent clocks
      clk: renesas: r8a779g0: Add TMU and SASYNCRT clocks
      clk: renesas: r8a779g0: Add CMT clocks

 drivers/clk/renesas/r8a779f0-cpg-mssr.c | 20 ++++++++++----------
 drivers/clk/renesas/r8a779g0-cpg-mssr.c | 11 +++++++++++
 2 files changed, 21 insertions(+), 10 deletions(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
