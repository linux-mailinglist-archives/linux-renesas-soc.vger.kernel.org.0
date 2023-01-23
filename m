Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 140876784F4
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Jan 2023 19:32:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233030AbjAWScJ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 23 Jan 2023 13:32:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233427AbjAWSbs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 23 Jan 2023 13:31:48 -0500
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7518B33448
        for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Jan 2023 10:31:30 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed50:6083:1fd7:ba05:ea8d])
        by laurent.telenet-ops.be with bizsmtp
        id CJXS2900X4604Ck01JXSsv; Mon, 23 Jan 2023 19:31:26 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1pK1bC-0076Dp-IS;
        Mon, 23 Jan 2023 19:31:26 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1pK1bK-00Ej91-Ex;
        Mon, 23 Jan 2023 19:31:26 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] clk: renesas: r8a779g0: Add CAN-FD clocks
Date:   Mon, 23 Jan 2023 19:31:24 +0100
Message-Id: <a78f534bd80f170f3f1267f3270fdb3b7a73b5d4.1674498643.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add the CANFD core clock and the CANFD0 module clock, which are used by
the CAN-FD Interface on the Renesas R-Car V4H (R8A779G0) SoC.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in renesas-clk for v6.3.

 drivers/clk/renesas/r8a779g0-cpg-mssr.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/renesas/r8a779g0-cpg-mssr.c b/drivers/clk/renesas/r8a779g0-cpg-mssr.c
index 48d9f34bbf37657a..357dac933dfa62d8 100644
--- a/drivers/clk/renesas/r8a779g0-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a779g0-cpg-mssr.c
@@ -145,6 +145,7 @@ static const struct cpg_core_clk r8a779g0_core_clks[] __initconst = {
 	DEF_FIXED("viobusd2",	R8A779G0_CLK_VIOBUSD2,	CLK_VIO,	2, 1),
 	DEF_FIXED("vcbus",	R8A779G0_CLK_VCBUS,	CLK_VC,		1, 1),
 	DEF_FIXED("vcbusd2",	R8A779G0_CLK_VCBUSD2,	CLK_VC,		2, 1),
+	DEF_DIV6P1("canfd",     R8A779G0_CLK_CANFD,	CLK_PLL5_DIV4,	0x878),
 	DEF_FIXED("dsiref",	R8A779G0_CLK_DSIREF,	CLK_PLL5_DIV4,	48, 1),
 	DEF_DIV6P1("dsiext",	R8A779G0_CLK_DSIEXT,	CLK_PLL5_DIV4,	0x884),
 
@@ -163,6 +164,7 @@ static const struct mssr_mod_clk r8a779g0_mod_clks[] __initconst = {
 	DEF_MOD("avb0",		211,	R8A779G0_CLK_S0D4_HSC),
 	DEF_MOD("avb1",		212,	R8A779G0_CLK_S0D4_HSC),
 	DEF_MOD("avb2",		213,	R8A779G0_CLK_S0D4_HSC),
+	DEF_MOD("canfd0",	328,	R8A779G0_CLK_SASYNCPERD2),
 	DEF_MOD("dis0",		411,	R8A779G0_CLK_VIOBUSD2),
 	DEF_MOD("dsitxlink0",	415,	R8A779G0_CLK_VIOBUSD2),
 	DEF_MOD("dsitxlink1",	416,	R8A779G0_CLK_VIOBUSD2),
-- 
2.34.1

