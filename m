Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 10D846998AB
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Feb 2023 16:20:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229714AbjBPPUd (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 16 Feb 2023 10:20:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229841AbjBPPUb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 16 Feb 2023 10:20:31 -0500
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E27A977C
        for <linux-renesas-soc@vger.kernel.org>; Thu, 16 Feb 2023 07:20:28 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed50:4605:3635:9491:c6bc])
        by michel.telenet-ops.be with bizsmtp
        id MrLR2900C3wKl5506rLR1z; Thu, 16 Feb 2023 16:20:25 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1pSg3F-009BUs-TS;
        Thu, 16 Feb 2023 16:20:24 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1pSg3c-005tXC-Le;
        Thu, 16 Feb 2023 16:20:24 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 2/2] clk: renesas: r8a77980: Add Z2 clock
Date:   Thu, 16 Feb 2023 16:20:19 +0100
Message-Id: <aad9eaa57acf65cbe43e4d374066a72d760d54d8.1676560357.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1676560357.git.geert+renesas@glider.be>
References: <cover.1676560357.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add support for the Z2 (Cortex-A53 System CPU) clock on R-Car V3H, which
uses a fixed SYS-CPU divider.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Note that the BSP went to great lengths to describe this clock as a
programmable Z clock, like on most other R-Car Gen3 SoCs, but add a
quirk to the Z clock driver to use a fixed divider when running on
R-Car V3H.

According to R-Car Series, 3rd Generation Hardware User’s Manual Rev.
2.30 and earlier, the SYS-CPU divider on R-Car V3H is a fixed divider.
Furthermore, the Frequency control register C, which is used on other
SoCs to control the SYS-CPU divider, is documented not to exist (but
empirical evidence shows that it does exist, and that the Z2FC field
works as expected).
---
 drivers/clk/renesas/r8a77980-cpg-mssr.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/renesas/r8a77980-cpg-mssr.c b/drivers/clk/renesas/r8a77980-cpg-mssr.c
index 6dc63eaf115566f9..bac92c606d0bf808 100644
--- a/drivers/clk/renesas/r8a77980-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a77980-cpg-mssr.c
@@ -72,6 +72,7 @@ static const struct cpg_core_clk r8a77980_core_clks[] __initconst = {
 	DEF_RATE(".oco",	CLK_OCO,           32768),
 
 	/* Core Clock Outputs */
+	DEF_FIXED("z2",		R8A77980_CLK_Z2,    CLK_PLL2,       4, 1),
 	DEF_FIXED("ztr",	R8A77980_CLK_ZTR,   CLK_PLL1_DIV2,  6, 1),
 	DEF_FIXED("ztrd2",	R8A77980_CLK_ZTRD2, CLK_PLL1_DIV2, 12, 1),
 	DEF_FIXED("zt",		R8A77980_CLK_ZT,    CLK_PLL1_DIV2,  4, 1),
-- 
2.34.1

