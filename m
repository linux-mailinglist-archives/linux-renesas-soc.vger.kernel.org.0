Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B03A65F78A1
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  7 Oct 2022 15:10:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229757AbiJGNKS (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 7 Oct 2022 09:10:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229789AbiJGNKQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 7 Oct 2022 09:10:16 -0400
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D52003EA43
        for <linux-renesas-soc@vger.kernel.org>; Fri,  7 Oct 2022 06:10:09 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed50:a4a4:fd15:fba:df3b])
        by michel.telenet-ops.be with bizsmtp
        id V1A6280065Lh0ZK061A6Pi; Fri, 07 Oct 2022 15:10:06 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1ogn77-000uNe-SM; Fri, 07 Oct 2022 15:10:05 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1ogn77-00CPMd-7t; Fri, 07 Oct 2022 15:10:05 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 2/5] clk: renesas: r8a779g0: Fix HSCIF parent clocks
Date:   Fri,  7 Oct 2022 15:10:01 +0200
Message-Id: <b7928abc8b9f53d5b06ec8624342f449de3d24ec.1665147497.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1665147497.git.geert+renesas@glider.be>
References: <cover.1665147497.git.geert+renesas@glider.be>
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

As serial communication requires a clock signal, the High Speed Serial
Communication Interfaces with FIFO (HSCIF) must be clocked by a clock
that is not affected by Spread Spectrum or Fractional Multiplication.

Hence change the parent clocks for the HSCIF modules from the S0D3_PER
clock to the SASYNCPERD1 clock (which has the same clock rate), cfr.
R-Car V4H Hardware User's Manual rev. 0.54.

Fixes: 0ab55cf1834177a2 ("clk: renesas: cpg-mssr: Add support for R-Car V4H")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/clk/renesas/r8a779g0-cpg-mssr.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/renesas/r8a779g0-cpg-mssr.c b/drivers/clk/renesas/r8a779g0-cpg-mssr.c
index 51491b94a057b5a7..f1f0496f7605f554 100644
--- a/drivers/clk/renesas/r8a779g0-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a779g0-cpg-mssr.c
@@ -158,10 +158,10 @@ static const struct mssr_mod_clk r8a779g0_mod_clks[] __initconst = {
 	DEF_MOD("avb0",		211,	R8A779G0_CLK_S0D4_HSC),
 	DEF_MOD("avb1",		212,	R8A779G0_CLK_S0D4_HSC),
 	DEF_MOD("avb2",		213,	R8A779G0_CLK_S0D4_HSC),
-	DEF_MOD("hscif0",	514,	R8A779G0_CLK_S0D3_PER),
-	DEF_MOD("hscif1",	515,	R8A779G0_CLK_S0D3_PER),
-	DEF_MOD("hscif2",	516,	R8A779G0_CLK_S0D3_PER),
-	DEF_MOD("hscif3",	517,	R8A779G0_CLK_S0D3_PER),
+	DEF_MOD("hscif0",	514,	R8A779G0_CLK_SASYNCPERD1),
+	DEF_MOD("hscif1",	515,	R8A779G0_CLK_SASYNCPERD1),
+	DEF_MOD("hscif2",	516,	R8A779G0_CLK_SASYNCPERD1),
+	DEF_MOD("hscif3",	517,	R8A779G0_CLK_SASYNCPERD1),
 	DEF_MOD("i2c0",		518,	R8A779G0_CLK_S0D6_PER),
 	DEF_MOD("i2c1",		519,	R8A779G0_CLK_S0D6_PER),
 	DEF_MOD("i2c2",		520,	R8A779G0_CLK_S0D6_PER),
-- 
2.25.1

