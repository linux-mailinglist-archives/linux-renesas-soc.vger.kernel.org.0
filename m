Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 077475FC102
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Oct 2022 09:02:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229722AbiJLHCn (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 12 Oct 2022 03:02:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229703AbiJLHCn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 12 Oct 2022 03:02:43 -0400
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 778D147B97
        for <linux-renesas-soc@vger.kernel.org>; Wed, 12 Oct 2022 00:02:39 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed50:3da6:62e6:8ab0:ff90])
        by andre.telenet-ops.be with bizsmtp
        id Wv2c2800H32x5mf01v2cMe; Wed, 12 Oct 2022 09:02:37 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1oiVlE-001Lpi-DF; Wed, 12 Oct 2022 09:02:36 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1oiVlD-006Bjm-RY; Wed, 12 Oct 2022 09:02:35 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 2/2] clk: renesas: r8a779f0: Add SASYNCPER internal clock
Date:   Wed, 12 Oct 2022 09:02:34 +0200
Message-Id: <18e6765bfc3bf7c3ee5ce93a370d377c1d17728e.1665558014.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1665558014.git.geert+renesas@glider.be>
References: <cover.1665558014.git.geert+renesas@glider.be>
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

Add the SASYNCPER internal clock, which is the clock source of the
various SASYNCPERD[124] clocks, to match the clock tree diagram in the
documentation.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/clk/renesas/r8a779f0-cpg-mssr.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/renesas/r8a779f0-cpg-mssr.c b/drivers/clk/renesas/r8a779f0-cpg-mssr.c
index 8e7b9180ec67bbf6..e4f2bbbfeb2d2ae4 100644
--- a/drivers/clk/renesas/r8a779f0-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a779f0-cpg-mssr.c
@@ -42,6 +42,7 @@ enum clk_ids {
 	CLK_PLL5_DIV4,
 	CLK_PLL6_DIV2,
 	CLK_S0,
+	CLK_SASYNCPER,
 	CLK_SDSRC,
 	CLK_RPCSRC,
 	CLK_OCO,
@@ -71,6 +72,7 @@ static const struct cpg_core_clk r8a779f0_core_clks[] __initconst = {
 	DEF_FIXED(".pll6_div2",	CLK_PLL6_DIV2,	CLK_PLL6,	2, 1),
 	DEF_FIXED(".s0",	CLK_S0,		CLK_PLL1_DIV2,	2, 1),
 
+	DEF_FIXED(".sasyncper",	CLK_SASYNCPER,	CLK_PLL5_DIV4,	3, 1),
 	DEF_BASE(".sdsrc",	CLK_SDSRC,	CLK_TYPE_GEN4_SDSRC, CLK_PLL5),
 	DEF_RATE(".oco",	CLK_OCO,	32768),
 
@@ -109,9 +111,9 @@ static const struct cpg_core_clk r8a779f0_core_clks[] __initconst = {
 	DEF_FIXED("cpex",	R8A779F0_CLK_CPEX,	CLK_EXTAL,	2, 1),
 
 	DEF_FIXED("sasyncrt",	R8A779F0_CLK_SASYNCRT,	CLK_PLL5_DIV4,	48, 1),
-	DEF_FIXED("sasyncperd1", R8A779F0_CLK_SASYNCPERD1, CLK_PLL5_DIV4, 3, 1),
-	DEF_FIXED("sasyncperd2", R8A779F0_CLK_SASYNCPERD2, R8A779F0_CLK_SASYNCPERD1, 2, 1),
-	DEF_FIXED("sasyncperd4", R8A779F0_CLK_SASYNCPERD4, R8A779F0_CLK_SASYNCPERD1, 4, 1),
+	DEF_FIXED("sasyncperd1",R8A779F0_CLK_SASYNCPERD1, CLK_SASYNCPER,1, 1),
+	DEF_FIXED("sasyncperd2",R8A779F0_CLK_SASYNCPERD2, CLK_SASYNCPER,2, 1),
+	DEF_FIXED("sasyncperd4",R8A779F0_CLK_SASYNCPERD4, CLK_SASYNCPER,4, 1),
 
 	DEF_GEN4_SDH("sd0h",	R8A779F0_CLK_SD0H,	CLK_SDSRC,	   0x870),
 	DEF_GEN4_SD("sd0",	R8A779F0_CLK_SD0,	R8A779F0_CLK_SD0H, 0x870),
-- 
2.25.1

