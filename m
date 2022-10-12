Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8379B5FC6F6
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Oct 2022 16:04:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230029AbiJLODy (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 12 Oct 2022 10:03:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229992AbiJLODv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 12 Oct 2022 10:03:51 -0400
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19263D0CFE
        for <linux-renesas-soc@vger.kernel.org>; Wed, 12 Oct 2022 07:03:48 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed50:3da6:62e6:8ab0:ff90])
        by albert.telenet-ops.be with bizsmtp
        id X23m2800C32x5mf0623mpG; Wed, 12 Oct 2022 16:03:46 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1oicKn-001OYk-OY; Wed, 12 Oct 2022 16:03:45 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1oicKn-00C34q-9o; Wed, 12 Oct 2022 16:03:45 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] clk: renesas: r8a779g0: Add RPC-IF clock
Date:   Wed, 12 Oct 2022 16:03:44 +0200
Message-Id: <f0609c82e742865be753b67a0a6080f193f405ad.1665583328.git.geert+renesas@glider.be>
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

Add the module clock used by the SPI Multi I/O Bus Controller (RPC-IF)
on the Renesas R-Car V4H (R8A779G0) SoC.

While at it, fix table alignment in the definition of the related
RPCSRC internal clock.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in renesas-clk for v6.2.

 drivers/clk/renesas/r8a779g0-cpg-mssr.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/renesas/r8a779g0-cpg-mssr.c b/drivers/clk/renesas/r8a779g0-cpg-mssr.c
index 390162a07595a681..5cc0dc9149bcb7d5 100644
--- a/drivers/clk/renesas/r8a779g0-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a779g0-cpg-mssr.c
@@ -91,7 +91,7 @@ static const struct cpg_core_clk r8a779g0_core_clks[] __initconst = {
 	DEF_BASE(".sdsrc",	CLK_SDSRC,	CLK_TYPE_GEN4_SDSRC, CLK_PLL5),
 	DEF_RATE(".oco",	CLK_OCO,	32768),
 
-	DEF_BASE(".rpcsrc",	CLK_RPCSRC,		CLK_TYPE_GEN4_RPCSRC, CLK_PLL5),
+	DEF_BASE(".rpcsrc",	CLK_RPCSRC,	CLK_TYPE_GEN4_RPCSRC, CLK_PLL5),
 	DEF_FIXED(".vio",	CLK_VIO,	CLK_PLL5_DIV2,	3, 1),
 	DEF_FIXED(".vc",	CLK_VC,		CLK_PLL5_DIV2,	3, 1),
 
@@ -177,6 +177,7 @@ static const struct mssr_mod_clk r8a779g0_mod_clks[] __initconst = {
 	DEF_MOD("msi4",		622,	R8A779G0_CLK_MSO),
 	DEF_MOD("msi5",		623,	R8A779G0_CLK_MSO),
 	DEF_MOD("pwm",		628,	R8A779G0_CLK_SASYNCPERD4),
+	DEF_MOD("rpc-if",	629,	R8A779G0_CLK_RPCD2),
 	DEF_MOD("scif0",	702,	R8A779G0_CLK_SASYNCPERD4),
 	DEF_MOD("scif1",	703,	R8A779G0_CLK_SASYNCPERD4),
 	DEF_MOD("scif3",	704,	R8A779G0_CLK_SASYNCPERD4),
-- 
2.25.1

