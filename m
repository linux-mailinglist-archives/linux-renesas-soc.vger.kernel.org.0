Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B82E6627BD9
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Nov 2022 12:15:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236607AbiKNLO6 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 14 Nov 2022 06:14:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236601AbiKNLO3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 14 Nov 2022 06:14:29 -0500
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6489A2250F
        for <linux-renesas-soc@vger.kernel.org>; Mon, 14 Nov 2022 03:10:06 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed10:9cda:b28b:1ded:8138])
        by michel.telenet-ops.be with bizsmtp
        id kBA3280033NlhLw06BA3uE; Mon, 14 Nov 2022 12:10:03 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1ouXLm-000TjG-N0; Mon, 14 Nov 2022 12:10:02 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1ouX4J-003Jpk-Ml; Mon, 14 Nov 2022 11:51:59 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] clk: renesas: r8a779g0: Add Z0 clock support
Date:   Mon, 14 Nov 2022 11:51:58 +0100
Message-Id: <75daa1fd8fa7eaef7b8945bb5906c787222c7ac4.1668423063.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add support for the Z0 (Cortex-A76 Sub-System) clock on R-Car V4H, based
on the existing support for Z clocks on R-Car Gen4.

Extracted from a patch in the BSP by LUU HOAI.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Tested on the White-Hawk development board by changing

    -#undef CLOCK_ALLOW_WRITE_DEBUGFS
    +#define CLOCK_ALLOW_WRITE_DEBUGFS

in drivers/clk/clk.c, writing the desired clock rate to
/sys/kernel/debug/clk/z0/clk_rate, and running the Dhrystones benchmark.
The performance/clock rate looks fine over the full range from 53 MHz to
1.7 GHz.
---
To be queued in renesas-clk-for-v6.2.
---
 drivers/clk/renesas/r8a779g0-cpg-mssr.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/renesas/r8a779g0-cpg-mssr.c b/drivers/clk/renesas/r8a779g0-cpg-mssr.c
index 1da48c81d3ddf3df..c6337a408e5e30da 100644
--- a/drivers/clk/renesas/r8a779g0-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a779g0-cpg-mssr.c
@@ -96,6 +96,7 @@ static const struct cpg_core_clk r8a779g0_core_clks[] __initconst = {
 	DEF_FIXED(".vc",	CLK_VC,		CLK_PLL5_DIV2,	3, 1),
 
 	/* Core Clock Outputs */
+	DEF_GEN4_Z("z0",	R8A779G0_CLK_Z0,	CLK_TYPE_GEN4_Z,	CLK_PLL2,	2, 0),
 	DEF_FIXED("s0d2",	R8A779G0_CLK_S0D2,	CLK_S0,		2, 1),
 	DEF_FIXED("s0d3",	R8A779G0_CLK_S0D3,	CLK_S0,		3, 1),
 	DEF_FIXED("s0d4",	R8A779G0_CLK_S0D4,	CLK_S0,		4, 1),
-- 
2.25.1

