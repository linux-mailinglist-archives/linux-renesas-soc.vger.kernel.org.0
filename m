Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AE52A6283E3
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Nov 2022 16:29:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237079AbiKNP3f (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 14 Nov 2022 10:29:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236730AbiKNP3R (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 14 Nov 2022 10:29:17 -0500
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99A22264B2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 14 Nov 2022 07:29:14 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed10:8c33:62a1:bd29:7c58])
        by baptiste.telenet-ops.be with bizsmtp
        id kFVC2800N0JF8f801FVCcT; Mon, 14 Nov 2022 16:29:13 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1oubOa-000Ul3-B5; Mon, 14 Nov 2022 16:29:12 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1oubOZ-004AXK-NZ; Mon, 14 Nov 2022 16:29:11 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] clk: renesas: r8a779f0: Fix Ethernet Switch clocks
Date:   Mon, 14 Nov 2022 16:29:08 +0100
Message-Id: <0d11da202c68f80345838d23f31c9d565c0d0ccf.1668439211.git.geert+renesas@glider.be>
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

The RSwitch2 and EtherTSN-IF clocks were accidentally mixed up.
While at it, rename them to better match the documentation.

Fixes: a3b4137a4d4023e6 ("clk: renesas: r8a779f0: Add Ethernet Switch clocks")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Noticed while reviewing the DTS counterpart.
Compile-tested only.

To be queued in renesas-clk for v6.2.
---
 drivers/clk/renesas/r8a779f0-cpg-mssr.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/renesas/r8a779f0-cpg-mssr.c b/drivers/clk/renesas/r8a779f0-cpg-mssr.c
index 800fdc104edd657f..f03d616cc36da6e2 100644
--- a/drivers/clk/renesas/r8a779f0-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a779f0-cpg-mssr.c
@@ -163,8 +163,8 @@ static const struct mssr_mod_clk r8a779f0_mod_clks[] __initconst = {
 	DEF_MOD("cmt3",		913,	R8A779F0_CLK_R),
 	DEF_MOD("pfc0",		915,	R8A779F0_CLK_CL16M),
 	DEF_MOD("tsc",		919,	R8A779F0_CLK_CL16M),
-	DEF_MOD("tsn",		1505,	R8A779F0_CLK_S0D2_HSC),
-	DEF_MOD("rsw",		1506,	R8A779F0_CLK_RSW2),
+	DEF_MOD("rswitch2",	1505,	R8A779F0_CLK_RSW2),
+	DEF_MOD("ethertsn-if",	1506,	R8A779F0_CLK_S0D2_HSC),
 	DEF_MOD("ufs",		1514,	R8A779F0_CLK_S0D4_HSC),
 };
 
-- 
2.25.1

