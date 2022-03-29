Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 78F444EAAA7
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 29 Mar 2022 11:44:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234791AbiC2JqU (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 29 Mar 2022 05:46:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234527AbiC2JqT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 29 Mar 2022 05:46:19 -0400
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1608139CFD
        for <linux-renesas-soc@vger.kernel.org>; Tue, 29 Mar 2022 02:44:34 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:d553:ff0a:6830:6bde])
        by baptiste.telenet-ops.be with bizsmtp
        id C9kX2700G49QC44019kXix; Tue, 29 Mar 2022 11:44:33 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nZ8Ot-007EmL-4S; Tue, 29 Mar 2022 11:44:31 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nZ8Os-00CC8W-MZ; Tue, 29 Mar 2022 11:44:30 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 2/2] clk: renesas: r8a77995: Add RPC clocks
Date:   Tue, 29 Mar 2022 11:44:26 +0200
Message-Id: <3fd1e886b7737cd0e199603bae81d01be9dcf3aa.1648546700.git.geert+renesas@glider.be>
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
(RPC-IF) on the R-Car D3 SoC: RPCSRC internal clock, RPC{,D2} clocks
derived from it, and RPC-IF module clock.

The RPCSRC clock divider on R-Car D3 is very similar to the one on R-Car
E3, but uses a different pre-divider for the PLL0 parent.  Add a new
macro to describe it, reusing the existing clock type for R-Car E3.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/clk/renesas/r8a77995-cpg-mssr.c | 9 +++++++++
 drivers/clk/renesas/rcar-gen3-cpg.h     | 3 +++
 2 files changed, 12 insertions(+)

diff --git a/drivers/clk/renesas/r8a77995-cpg-mssr.c b/drivers/clk/renesas/r8a77995-cpg-mssr.c
index 525eef197fd9a9ab..22e7bf0de9fe1f53 100644
--- a/drivers/clk/renesas/r8a77995-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a77995-cpg-mssr.c
@@ -42,6 +42,7 @@ enum clk_ids {
 	CLK_S2,
 	CLK_S3,
 	CLK_SDSRC,
+	CLK_RPCSRC,
 	CLK_RINT,
 	CLK_OCO,
 
@@ -70,6 +71,8 @@ static const struct cpg_core_clk r8a77995_core_clks[] __initconst = {
 	DEF_FIXED(".s3",       CLK_S3,             CLK_PLL1,       6, 1),
 	DEF_FIXED(".sdsrc",    CLK_SDSRC,          CLK_PLL1,       2, 1),
 
+	DEF_FIXED_RPCSRC_D3(".rpcsrc", CLK_RPCSRC, CLK_PLL0, CLK_PLL1),
+
 	DEF_DIV6_RO(".r",      CLK_RINT,           CLK_EXTAL, CPG_RCKCR, 32),
 
 	DEF_RATE(".oco",       CLK_OCO,            8 * 1000 * 1000),
@@ -106,6 +109,11 @@ static const struct cpg_core_clk r8a77995_core_clks[] __initconst = {
 	DEF_GEN3_SDH("sd0h",   R8A77995_CLK_SD0H, CLK_SDSRC,         0x268),
 	DEF_GEN3_SD("sd0",     R8A77995_CLK_SD0,  R8A77995_CLK_SD0H, 0x268),
 
+	DEF_BASE("rpc",		R8A77995_CLK_RPC, CLK_TYPE_GEN3_RPC,
+		 CLK_RPCSRC),
+	DEF_BASE("rpcd2",	R8A77995_CLK_RPCD2, CLK_TYPE_GEN3_RPCD2,
+		 R8A77995_CLK_RPC),
+
 	DEF_DIV6P1("canfd",    R8A77995_CLK_CANFD, CLK_PLL0D3,    0x244),
 	DEF_DIV6P1("mso",      R8A77995_CLK_MSO,   CLK_PLL1D2,    0x014),
 
@@ -174,6 +182,7 @@ static const struct mssr_mod_clk r8a77995_mod_clks[] __initconst = {
 	DEF_MOD("can-fd",		 914,	R8A77995_CLK_S3D2),
 	DEF_MOD("can-if1",		 915,	R8A77995_CLK_S3D4),
 	DEF_MOD("can-if0",		 916,	R8A77995_CLK_S3D4),
+	DEF_MOD("rpc-if",		 917,	R8A77995_CLK_RPCD2),
 	DEF_MOD("i2c3",			 928,	R8A77995_CLK_S3D2),
 	DEF_MOD("i2c2",			 929,	R8A77995_CLK_S3D2),
 	DEF_MOD("i2c1",			 930,	R8A77995_CLK_S3D2),
diff --git a/drivers/clk/renesas/rcar-gen3-cpg.h b/drivers/clk/renesas/rcar-gen3-cpg.h
index 2bc0afadf60413d2..a13df006f531519e 100644
--- a/drivers/clk/renesas/rcar-gen3-cpg.h
+++ b/drivers/clk/renesas/rcar-gen3-cpg.h
@@ -62,6 +62,9 @@ enum rcar_gen3_clk_types {
 #define DEF_FIXED_RPCSRC_E3(_name, _id, _parent0, _parent1)	\
 	DEF_BASE(_name, _id, CLK_TYPE_GEN3_E3_RPCSRC,	\
 		 (_parent0) << 16 | (_parent1), .div = 8)
+#define DEF_FIXED_RPCSRC_D3(_name, _id, _parent0, _parent1)	\
+	DEF_BASE(_name, _id, CLK_TYPE_GEN3_E3_RPCSRC,	\
+		 (_parent0) << 16 | (_parent1), .div = 5)
 
 struct rcar_gen3_cpg_pll_config {
 	u8 extal_div;
-- 
2.25.1

