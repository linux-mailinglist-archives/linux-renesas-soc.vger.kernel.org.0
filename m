Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 506CD5431CC
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Jun 2022 15:47:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240633AbiFHNqn (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 8 Jun 2022 09:46:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240801AbiFHNqn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 8 Jun 2022 09:46:43 -0400
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 735FC272358
        for <linux-renesas-soc@vger.kernel.org>; Wed,  8 Jun 2022 06:46:36 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed30:243a:e14b:d107:1f56])
        by xavier.telenet-ops.be with bizsmtp
        id gdma2700J1qF9lr01dmaP7; Wed, 08 Jun 2022 15:46:34 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nyw13-003DA7-UV; Wed, 08 Jun 2022 15:46:33 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nyw13-008Kyr-3D; Wed, 08 Jun 2022 15:46:33 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] clk: renesas: r8a779f0: Add Z0 and Z1 clock support
Date:   Wed,  8 Jun 2022 15:46:32 +0200
Message-Id: <43009e25be1223a717e00c392cb2d416f5d47032.1654695893.git.geert+renesas@glider.be>
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

Add support for the Z0 and Z1 (Cortex-A55 Sub-System 0 (CPU 0-3) and
Sub-System 1 (CPU 4-7)) clocks on R-Car S4-8, based on the existing
support for Z clocks on R-Car Gen4.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Tested on the Spider development board by changing

    -#undef CLOCK_ALLOW_WRITE_DEBUGFS
    +#define CLOCK_ALLOW_WRITE_DEBUGFS

in drivers/clk/clk.c, writing the desired clock rate to
/sys/kernel/debug/clk/z[01]/clk_rate, and running the Dhrystones
benchmark.  The performance/clock rate looks fine over the full range
from 37.5 MHz to 1.2 GHz.
---
To be queued in renesas-clk-for-v5.20.

 drivers/clk/renesas/r8a779f0-cpg-mssr.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/renesas/r8a779f0-cpg-mssr.c b/drivers/clk/renesas/r8a779f0-cpg-mssr.c
index c17ebe6b59921104..ec1f337cfa7d7239 100644
--- a/drivers/clk/renesas/r8a779f0-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a779f0-cpg-mssr.c
@@ -77,6 +77,8 @@ static const struct cpg_core_clk r8a779f0_core_clks[] __initconst = {
 	DEF_BASE(".rpcsrc",	CLK_RPCSRC,	CLK_TYPE_GEN4_RPCSRC, CLK_PLL5),
 
 	/* Core Clock Outputs */
+	DEF_GEN4_Z("z0",	R8A779F0_CLK_Z0,	CLK_TYPE_GEN4_Z,	CLK_PLL2,	2, 0),
+	DEF_GEN4_Z("z1",	R8A779F0_CLK_Z1,	CLK_TYPE_GEN4_Z,	CLK_PLL2,	2, 8),
 	DEF_FIXED("s0d2",	R8A779F0_CLK_S0D2,	CLK_S0,		2, 1),
 	DEF_FIXED("s0d3",	R8A779F0_CLK_S0D3,	CLK_S0,		3, 1),
 	DEF_FIXED("s0d4",	R8A779F0_CLK_S0D4,	CLK_S0,		4, 1),
-- 
2.25.1

