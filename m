Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5E3F67563E6
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Jul 2023 15:11:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229697AbjGQNL3 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 17 Jul 2023 09:11:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231319AbjGQNL2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Jul 2023 09:11:28 -0400
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9296CC
        for <linux-renesas-soc@vger.kernel.org>; Mon, 17 Jul 2023 06:11:25 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:5803:2d6d:5bbc:e252])
        by baptiste.telenet-ops.be with bizsmtp
        id NDBP2A00Q0ucMBo01DBPLc; Mon, 17 Jul 2023 15:11:23 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qLO0Q-001fnY-NN;
        Mon, 17 Jul 2023 15:11:23 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qLO0Z-007Qi9-KT;
        Mon, 17 Jul 2023 15:11:23 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 2/3] clk: renesas: r8a7796: Add 3DGE and ZG support
Date:   Mon, 17 Jul 2023 15:11:21 +0200
Message-Id: <291462bea7ffc13f8218c1901dc384b576bfc2d6.1689599217.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1689599217.git.geert+renesas@glider.be>
References: <cover.1689599217.git.geert+renesas@glider.be>
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

The 3DGE and ZG clocks are necessary to support the 3D graphics.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/clk/renesas/r8a7796-cpg-mssr.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/renesas/r8a7796-cpg-mssr.c b/drivers/clk/renesas/r8a7796-cpg-mssr.c
index c4969318508eb44d..0bfd0771554fe865 100644
--- a/drivers/clk/renesas/r8a7796-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a7796-cpg-mssr.c
@@ -81,6 +81,7 @@ static const struct cpg_core_clk r8a7796_core_clks[] __initconst = {
 	/* Core Clock Outputs */
 	DEF_GEN3_Z("z",         R8A7796_CLK_Z,     CLK_TYPE_GEN3_Z,  CLK_PLL0, 2, 8),
 	DEF_GEN3_Z("z2",        R8A7796_CLK_Z2,    CLK_TYPE_GEN3_Z,  CLK_PLL2, 2, 0),
+	DEF_GEN3_Z("zg",        R8A7796_CLK_ZG,    CLK_TYPE_GEN3_ZG, CLK_PLL4, 4, 24),
 	DEF_FIXED("ztr",        R8A7796_CLK_ZTR,   CLK_PLL1_DIV2,  6, 1),
 	DEF_FIXED("ztrd2",      R8A7796_CLK_ZTRD2, CLK_PLL1_DIV2, 12, 1),
 	DEF_FIXED("zt",         R8A7796_CLK_ZT,    CLK_PLL1_DIV2,  4, 1),
@@ -130,6 +131,7 @@ static const struct cpg_core_clk r8a7796_core_clks[] __initconst = {
 };
 
 static struct mssr_mod_clk r8a7796_mod_clks[] __initdata = {
+	DEF_MOD("3dge",			 112,	R8A7796_CLK_ZG),
 	DEF_MOD("fdp1-0",		 119,	R8A7796_CLK_S0D1),
 	DEF_MOD("tmu4",			 121,	R8A7796_CLK_S0D6),
 	DEF_MOD("tmu3",			 122,	R8A7796_CLK_S3D2),
-- 
2.34.1

