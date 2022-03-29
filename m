Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D94A54EAAAA
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 29 Mar 2022 11:44:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234527AbiC2JqW (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 29 Mar 2022 05:46:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234786AbiC2JqT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 29 Mar 2022 05:46:19 -0400
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CF0E132E96
        for <linux-renesas-soc@vger.kernel.org>; Tue, 29 Mar 2022 02:44:32 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:d553:ff0a:6830:6bde])
        by xavier.telenet-ops.be with bizsmtp
        id C9kW2700n49QC44019kWu7; Tue, 29 Mar 2022 11:44:30 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nZ8Os-007Em5-BK; Tue, 29 Mar 2022 11:44:30 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nZ8Or-00CC8F-PC; Tue, 29 Mar 2022 11:44:29 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 1/2] clk: renesas: r8a77990: Add RPC clocks
Date:   Tue, 29 Mar 2022 11:44:25 +0200
Message-Id: <3295013f27f1e4b8fbf3f79b950d65157ea95ef2.1648546700.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1648546700.git.geert+renesas@glider.be>
References: <cover.1648546700.git.geert+renesas@glider.be>
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

Describe the various clocks used by the SPI Multi I/O Bus Controller
(RPC-IF) on the R-Car E3 SoC: RPCSRC internal clock, RPC{,D2} clocks
derived from it, and RPC-IF module clock.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/clk/renesas/r8a77990-cpg-mssr.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/clk/renesas/r8a77990-cpg-mssr.c b/drivers/clk/renesas/r8a77990-cpg-mssr.c
index d34d97baab35f3be..a5c95e0021f82e7f 100644
--- a/drivers/clk/renesas/r8a77990-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a77990-cpg-mssr.c
@@ -44,6 +44,7 @@ enum clk_ids {
 	CLK_S2,
 	CLK_S3,
 	CLK_SDSRC,
+	CLK_RPCSRC,
 	CLK_RINT,
 	CLK_OCO,
 
@@ -74,6 +75,8 @@ static const struct cpg_core_clk r8a77990_core_clks[] __initconst = {
 	DEF_FIXED(".s3",       CLK_S3,             CLK_PLL1,       6, 1),
 	DEF_FIXED(".sdsrc",    CLK_SDSRC,          CLK_PLL1,       2, 1),
 
+	DEF_FIXED_RPCSRC_E3(".rpcsrc", CLK_RPCSRC, CLK_PLL0, CLK_PLL1),
+
 	DEF_DIV6_RO(".r",      CLK_RINT,           CLK_EXTAL, CPG_RCKCR, 32),
 
 	DEF_RATE(".oco",       CLK_OCO,            8 * 1000 * 1000),
@@ -107,6 +110,11 @@ static const struct cpg_core_clk r8a77990_core_clks[] __initconst = {
 	DEF_GEN3_SD("sd1",     R8A77990_CLK_SD1,   R8A77990_CLK_SD1H, 0x0078),
 	DEF_GEN3_SD("sd3",     R8A77990_CLK_SD3,   R8A77990_CLK_SD3H, 0x026c),
 
+	DEF_BASE("rpc",		R8A77990_CLK_RPC, CLK_TYPE_GEN3_RPC,
+		 CLK_RPCSRC),
+	DEF_BASE("rpcd2",	R8A77990_CLK_RPCD2, CLK_TYPE_GEN3_RPCD2,
+		 R8A77990_CLK_RPC),
+
 	DEF_FIXED("cl",        R8A77990_CLK_CL,    CLK_PLL1,      48, 1),
 	DEF_FIXED("cr",        R8A77990_CLK_CR,    CLK_PLL1D2,     2, 1),
 	DEF_FIXED("cp",        R8A77990_CLK_CP,    CLK_EXTAL,      2, 1),
@@ -215,6 +223,7 @@ static const struct mssr_mod_clk r8a77990_mod_clks[] __initconst = {
 	DEF_MOD("can-fd",		 914,	R8A77990_CLK_S3D2),
 	DEF_MOD("can-if1",		 915,	R8A77990_CLK_S3D4),
 	DEF_MOD("can-if0",		 916,	R8A77990_CLK_S3D4),
+	DEF_MOD("rpc-if",		 917,	R8A77990_CLK_RPCD2),
 	DEF_MOD("i2c6",			 918,	R8A77990_CLK_S3D2),
 	DEF_MOD("i2c5",			 919,	R8A77990_CLK_S3D2),
 	DEF_MOD("i2c-dvfs",		 926,	R8A77990_CLK_CP),
-- 
2.25.1

