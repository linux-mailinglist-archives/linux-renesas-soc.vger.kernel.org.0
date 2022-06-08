Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6E0CB5431AD
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Jun 2022 15:41:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240386AbiFHNld (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 8 Jun 2022 09:41:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240362AbiFHNlZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 8 Jun 2022 09:41:25 -0400
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 729EC1DD4EA
        for <linux-renesas-soc@vger.kernel.org>; Wed,  8 Jun 2022 06:41:19 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed30:243a:e14b:d107:1f56])
        by albert.telenet-ops.be with bizsmtp
        id gdhH2700M1qF9lr06dhHzv; Wed, 08 Jun 2022 15:41:17 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nyvvx-003D7c-2J; Wed, 08 Jun 2022 15:41:17 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nyvvw-008Knz-9d; Wed, 08 Jun 2022 15:41:16 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/6] clk: renesas: CPG structure cleanups
Date:   Wed,  8 Jun 2022 15:41:09 +0200
Message-Id: <cover.1654694831.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

	Hi Mike, Stephen,

Recently, a set of (wrong) cleanup patches for Renesas clock drivers
pointed my attention to the fact that various older drivers contain
unused members in their CPG structures.

As these are mostly drivers for older SoCs, it is very unlikely they are
ever extended to make use of these members.  If anyone ever wants to
improve these drivers, I thinks these SoCs should be moved over to
renesas-cpg-mssr instead, so we can start using the module reset feature
that is available on SH/R-Mobile SoCs, just like on R-Car Gen2 and later.

Hence this series cleans up these drivers, and removes the unused
members from the CPG structures.

This series has been tested on the ape6evm, armadillo, kzm9g, bock-w,
lager, and rsk+rza1 development boards, and I plan to queue it in
renesas-clk for v5.20.

Thanks for your comments!

Geert Uytterhoeven (6):
  clk: renesas: r8a73a4: Remove r8a73a4_cpg.reg
  clk: renesas: r8a7740: Remove r8a7740_cpg.reg
  clk: renesas: sh73a0: Remove sh73a0_cpg.reg
  clk: renesas: r8a7778: Remove struct r8a7778_cpg
  clk: renesas: r8a7779: Remove struct r8a7779_cpg
  clk: renesas: rza1: Remove struct rz_cpg

 drivers/clk/renesas/clk-r8a73a4.c | 22 ++++++++++-----------
 drivers/clk/renesas/clk-r8a7740.c | 20 +++++++++----------
 drivers/clk/renesas/clk-r8a7778.c | 31 +++++++++--------------------
 drivers/clk/renesas/clk-r8a7779.c | 27 +++++++++----------------
 drivers/clk/renesas/clk-rz.c      | 33 ++++++++++++++-----------------
 drivers/clk/renesas/clk-sh73a0.c  | 26 ++++++++++++------------
 6 files changed, 67 insertions(+), 92 deletions(-)

-- 
2.25.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
