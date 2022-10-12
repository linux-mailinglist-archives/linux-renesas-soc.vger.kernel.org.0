Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A901F5FC109
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Oct 2022 09:05:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229513AbiJLHFO (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 12 Oct 2022 03:05:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229542AbiJLHFL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 12 Oct 2022 03:05:11 -0400
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D84491400E
        for <linux-renesas-soc@vger.kernel.org>; Wed, 12 Oct 2022 00:05:09 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed50:3da6:62e6:8ab0:ff90])
        by andre.telenet-ops.be with bizsmtp
        id Wv572800P32x5mf01v572X; Wed, 12 Oct 2022 09:05:08 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1oiVnf-001Lqg-GR; Wed, 12 Oct 2022 09:05:07 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1oiVne-006b7M-Hg; Wed, 12 Oct 2022 09:05:06 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] clk: renesas: r8a779g0: Add SDHI clocks
Date:   Wed, 12 Oct 2022 09:05:05 +0200
Message-Id: <e9b05d102160cc3f7395ac53a533e81c07307d5e.1665558175.git.geert+renesas@glider.be>
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

Add the SD0H core clock and the SDHI module clock, which are used by the
SD Card/MMC Interface on the Renesas R-Car V4H (R8A779G0) SoC.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in renesas-clk for v6.2.

 drivers/clk/renesas/r8a779g0-cpg-mssr.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/renesas/r8a779g0-cpg-mssr.c b/drivers/clk/renesas/r8a779g0-cpg-mssr.c
index 5cc5ee1295d9fe68..390162a07595a681 100644
--- a/drivers/clk/renesas/r8a779g0-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a779g0-cpg-mssr.c
@@ -144,7 +144,8 @@ static const struct cpg_core_clk r8a779g0_core_clks[] __initconst = {
 	DEF_FIXED("vcbus",	R8A779G0_CLK_VCBUS,	CLK_VC,		1, 1),
 	DEF_FIXED("vcbusd2",	R8A779G0_CLK_VCBUSD2,	CLK_VC,		2, 1),
 
-	DEF_GEN4_SD("sd0",	R8A779G0_CLK_SD0,	CLK_SDSRC,	0x870),
+	DEF_GEN4_SDH("sd0h",	R8A779G0_CLK_SD0H,	CLK_SDSRC,	   0x870),
+	DEF_GEN4_SD("sd0",	R8A779G0_CLK_SD0,	R8A779G0_CLK_SD0H, 0x870),
 	DEF_DIV6P1("mso",	R8A779G0_CLK_MSO,	CLK_PLL5_DIV4,	0x87c),
 
 	DEF_BASE("rpc",		R8A779G0_CLK_RPC,	CLK_TYPE_GEN4_RPC, CLK_RPCSRC),
@@ -180,6 +181,7 @@ static const struct mssr_mod_clk r8a779g0_mod_clks[] __initconst = {
 	DEF_MOD("scif1",	703,	R8A779G0_CLK_SASYNCPERD4),
 	DEF_MOD("scif3",	704,	R8A779G0_CLK_SASYNCPERD4),
 	DEF_MOD("scif4",	705,	R8A779G0_CLK_SASYNCPERD4),
+	DEF_MOD("sdhi",		706,	R8A779G0_CLK_SD0),
 	DEF_MOD("sydm0",	709,	R8A779G0_CLK_S0D6_PER),
 	DEF_MOD("sydm1",	710,	R8A779G0_CLK_S0D6_PER),
 	DEF_MOD("tpu0",		718,	R8A779G0_CLK_SASYNCPERD4),
-- 
2.25.1

