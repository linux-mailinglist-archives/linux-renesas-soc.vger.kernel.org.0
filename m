Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A64404FBCA5
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 Apr 2022 14:59:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346299AbiDKNCF (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 11 Apr 2022 09:02:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237127AbiDKNCE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 11 Apr 2022 09:02:04 -0400
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 150251A059
        for <linux-renesas-soc@vger.kernel.org>; Mon, 11 Apr 2022 05:59:47 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:b509:6862:2557:437a])
        by baptiste.telenet-ops.be with bizsmtp
        id HQzm2700C1G7NMJ01Qzmus; Mon, 11 Apr 2022 14:59:46 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1ndtdx-000ASe-VW; Mon, 11 Apr 2022 14:59:45 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1ndtdx-009JV5-4p; Mon, 11 Apr 2022 14:59:45 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] clk: renesas: Move RPC core clocks
Date:   Mon, 11 Apr 2022 14:59:44 +0200
Message-Id: <a938b938f00939b9206d7fbaba78e2ef09915f5f.1649681891.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
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

The RPC and RPCD2 core clocks were added to the sections for internal
core clocks, while they are core clock outputs, visible from DT.

Move them to the correct sections.
Rename the ".rpc" clock on R-Car S4 to "rpc".
Fixup nearby whitespace to increase uniformity.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/clk/renesas/r8a774a1-cpg-mssr.c |  9 ++++-----
 drivers/clk/renesas/r8a774b1-cpg-mssr.c |  9 ++++-----
 drivers/clk/renesas/r8a774c0-cpg-mssr.c |  8 +++-----
 drivers/clk/renesas/r8a774e1-cpg-mssr.c |  9 ++++-----
 drivers/clk/renesas/r8a7795-cpg-mssr.c  |  9 ++++-----
 drivers/clk/renesas/r8a7796-cpg-mssr.c  |  9 ++++-----
 drivers/clk/renesas/r8a77965-cpg-mssr.c |  9 ++++-----
 drivers/clk/renesas/r8a77980-cpg-mssr.c | 10 +++++-----
 drivers/clk/renesas/r8a77990-cpg-mssr.c |  6 ++----
 drivers/clk/renesas/r8a77995-cpg-mssr.c | 10 ++++------
 drivers/clk/renesas/r8a779a0-cpg-mssr.c | 11 +++++++----
 drivers/clk/renesas/r8a779f0-cpg-mssr.c |  9 ++++++---
 12 files changed, 51 insertions(+), 57 deletions(-)

diff --git a/drivers/clk/renesas/r8a774a1-cpg-mssr.c b/drivers/clk/renesas/r8a774a1-cpg-mssr.c
index 95dd56b64d6409b5..ad03c09ebc1f97ce 100644
--- a/drivers/clk/renesas/r8a774a1-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a774a1-cpg-mssr.c
@@ -68,12 +68,8 @@ static const struct cpg_core_clk r8a774a1_core_clks[] __initconst = {
 	DEF_FIXED(".s2",        CLK_S2,            CLK_PLL1_DIV2,  4, 1),
 	DEF_FIXED(".s3",        CLK_S3,            CLK_PLL1_DIV2,  6, 1),
 	DEF_FIXED(".sdsrc",     CLK_SDSRC,         CLK_PLL1_DIV2,  2, 1),
-	DEF_BASE(".rpcsrc",     CLK_RPCSRC, CLK_TYPE_GEN3_RPCSRC, CLK_PLL1),
 
-	DEF_BASE("rpc",         R8A774A1_CLK_RPC, CLK_TYPE_GEN3_RPC,
-		 CLK_RPCSRC),
-	DEF_BASE("rpcd2",       R8A774A1_CLK_RPCD2, CLK_TYPE_GEN3_RPCD2,
-		 R8A774A1_CLK_RPC),
+	DEF_BASE(".rpcsrc",     CLK_RPCSRC, CLK_TYPE_GEN3_RPCSRC, CLK_PLL1),
 
 	DEF_GEN3_OSC(".r",      CLK_RINT,          CLK_EXTAL,      32),
 
@@ -109,6 +105,9 @@ static const struct cpg_core_clk r8a774a1_core_clks[] __initconst = {
 	DEF_GEN3_SD("sd2",      R8A774A1_CLK_SD2,   R8A774A1_CLK_SD2H, 0x268),
 	DEF_GEN3_SD("sd3",      R8A774A1_CLK_SD3,   R8A774A1_CLK_SD3H, 0x26c),
 
+	DEF_BASE("rpc",         R8A774A1_CLK_RPC,   CLK_TYPE_GEN3_RPC,   CLK_RPCSRC),
+	DEF_BASE("rpcd2",       R8A774A1_CLK_RPCD2, CLK_TYPE_GEN3_RPCD2, R8A774A1_CLK_RPC),
+
 	DEF_FIXED("cl",         R8A774A1_CLK_CL,    CLK_PLL1_DIV2, 48, 1),
 	DEF_FIXED("cp",         R8A774A1_CLK_CP,    CLK_EXTAL,      2, 1),
 	DEF_FIXED("cpex",       R8A774A1_CLK_CPEX,  CLK_EXTAL,      2, 1),
diff --git a/drivers/clk/renesas/r8a774b1-cpg-mssr.c b/drivers/clk/renesas/r8a774b1-cpg-mssr.c
index 56061b9b8437d24b..ab087b02ef90e98b 100644
--- a/drivers/clk/renesas/r8a774b1-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a774b1-cpg-mssr.c
@@ -66,12 +66,8 @@ static const struct cpg_core_clk r8a774b1_core_clks[] __initconst = {
 	DEF_FIXED(".s2",        CLK_S2,            CLK_PLL1_DIV2,  4, 1),
 	DEF_FIXED(".s3",        CLK_S3,            CLK_PLL1_DIV2,  6, 1),
 	DEF_FIXED(".sdsrc",     CLK_SDSRC,         CLK_PLL1_DIV2,  2, 1),
-	DEF_BASE(".rpcsrc",     CLK_RPCSRC, CLK_TYPE_GEN3_RPCSRC, CLK_PLL1),
 
-	DEF_BASE("rpc",         R8A774B1_CLK_RPC, CLK_TYPE_GEN3_RPC,
-		 CLK_RPCSRC),
-	DEF_BASE("rpcd2",       R8A774B1_CLK_RPCD2, CLK_TYPE_GEN3_RPCD2,
-		 R8A774B1_CLK_RPC),
+	DEF_BASE(".rpcsrc",     CLK_RPCSRC, CLK_TYPE_GEN3_RPCSRC, CLK_PLL1),
 
 	DEF_GEN3_OSC(".r",      CLK_RINT,          CLK_EXTAL,      32),
 
@@ -106,6 +102,9 @@ static const struct cpg_core_clk r8a774b1_core_clks[] __initconst = {
 	DEF_GEN3_SD("sd2",      R8A774B1_CLK_SD2,   R8A774B1_CLK_SD2H, 0x268),
 	DEF_GEN3_SD("sd3",      R8A774B1_CLK_SD3,   R8A774B1_CLK_SD3H, 0x26c),
 
+	DEF_BASE("rpc",         R8A774B1_CLK_RPC,   CLK_TYPE_GEN3_RPC,   CLK_RPCSRC),
+	DEF_BASE("rpcd2",       R8A774B1_CLK_RPCD2, CLK_TYPE_GEN3_RPCD2, R8A774B1_CLK_RPC),
+
 	DEF_FIXED("cl",         R8A774B1_CLK_CL,    CLK_PLL1_DIV2, 48, 1),
 	DEF_FIXED("cp",         R8A774B1_CLK_CP,    CLK_EXTAL,      2, 1),
 	DEF_FIXED("cpex",       R8A774B1_CLK_CPEX,  CLK_EXTAL,      2, 1),
diff --git a/drivers/clk/renesas/r8a774c0-cpg-mssr.c b/drivers/clk/renesas/r8a774c0-cpg-mssr.c
index b5eb5dc45d62eb51..c9c8fde0f0a6c122 100644
--- a/drivers/clk/renesas/r8a774c0-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a774c0-cpg-mssr.c
@@ -77,11 +77,6 @@ static const struct cpg_core_clk r8a774c0_core_clks[] __initconst = {
 
 	DEF_FIXED_RPCSRC_E3(".rpcsrc", CLK_RPCSRC, CLK_PLL0, CLK_PLL1),
 
-	DEF_BASE("rpc",		R8A774C0_CLK_RPC, CLK_TYPE_GEN3_RPC,
-		 CLK_RPCSRC),
-	DEF_BASE("rpcd2",	R8A774C0_CLK_RPCD2, CLK_TYPE_GEN3_RPCD2,
-		 R8A774C0_CLK_RPC),
-
 	DEF_DIV6_RO(".r",      CLK_RINT,           CLK_EXTAL, CPG_RCKCR, 32),
 
 	DEF_RATE(".oco",       CLK_OCO,            8 * 1000 * 1000),
@@ -108,6 +103,9 @@ static const struct cpg_core_clk r8a774c0_core_clks[] __initconst = {
 	DEF_FIXED("s3d2",      R8A774C0_CLK_S3D2,  CLK_S3,         2, 1),
 	DEF_FIXED("s3d4",      R8A774C0_CLK_S3D4,  CLK_S3,         4, 1),
 
+	DEF_BASE("rpc",        R8A774C0_CLK_RPC,   CLK_TYPE_GEN3_RPC,   CLK_RPCSRC),
+	DEF_BASE("rpcd2",      R8A774C0_CLK_RPCD2, CLK_TYPE_GEN3_RPCD2, R8A774C0_CLK_RPC),
+
 	DEF_GEN3_SDH("sd0h",   R8A774C0_CLK_SD0H, CLK_SDSRC,         0x0074),
 	DEF_GEN3_SDH("sd1h",   R8A774C0_CLK_SD1H, CLK_SDSRC,         0x0078),
 	DEF_GEN3_SDH("sd3h",   R8A774C0_CLK_SD3H, CLK_SDSRC,         0x026c),
diff --git a/drivers/clk/renesas/r8a774e1-cpg-mssr.c b/drivers/clk/renesas/r8a774e1-cpg-mssr.c
index 2950f0db90aeb285..a790061db877cc9b 100644
--- a/drivers/clk/renesas/r8a774e1-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a774e1-cpg-mssr.c
@@ -68,12 +68,8 @@ static const struct cpg_core_clk r8a774e1_core_clks[] __initconst = {
 	DEF_FIXED(".s2",        CLK_S2,            CLK_PLL1_DIV2,  4, 1),
 	DEF_FIXED(".s3",        CLK_S3,            CLK_PLL1_DIV2,  6, 1),
 	DEF_FIXED(".sdsrc",     CLK_SDSRC,         CLK_PLL1_DIV2,  2, 1),
-	DEF_BASE(".rpcsrc",	CLK_RPCSRC, CLK_TYPE_GEN3_RPCSRC, CLK_PLL1),
 
-	DEF_BASE("rpc",		R8A774E1_CLK_RPC, CLK_TYPE_GEN3_RPC,
-		 CLK_RPCSRC),
-	DEF_BASE("rpcd2",	R8A774E1_CLK_RPCD2, CLK_TYPE_GEN3_RPCD2,
-		 R8A774E1_CLK_RPC),
+	DEF_BASE(".rpcsrc",     CLK_RPCSRC, CLK_TYPE_GEN3_RPCSRC, CLK_PLL1),
 
 	DEF_GEN3_OSC(".r",      CLK_RINT,          CLK_EXTAL,      32),
 
@@ -109,6 +105,9 @@ static const struct cpg_core_clk r8a774e1_core_clks[] __initconst = {
 	DEF_GEN3_SD("sd2",      R8A774E1_CLK_SD2,   R8A774E1_CLK_SD2H, 0x268),
 	DEF_GEN3_SD("sd3",      R8A774E1_CLK_SD3,   R8A774E1_CLK_SD3H, 0x26c),
 
+	DEF_BASE("rpc",         R8A774E1_CLK_RPC,   CLK_TYPE_GEN3_RPC,   CLK_RPCSRC),
+	DEF_BASE("rpcd2",       R8A774E1_CLK_RPCD2, CLK_TYPE_GEN3_RPCD2, R8A774E1_CLK_RPC),
+
 	DEF_FIXED("cl",         R8A774E1_CLK_CL,    CLK_PLL1_DIV2, 48, 1),
 	DEF_FIXED("cr",         R8A774E1_CLK_CR,    CLK_PLL1_DIV4,  2, 1),
 	DEF_FIXED("cp",         R8A774E1_CLK_CP,    CLK_EXTAL,      2, 1),
diff --git a/drivers/clk/renesas/r8a7795-cpg-mssr.c b/drivers/clk/renesas/r8a7795-cpg-mssr.c
index 991a44315d715024..301475c74f500181 100644
--- a/drivers/clk/renesas/r8a7795-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a7795-cpg-mssr.c
@@ -71,12 +71,8 @@ static struct cpg_core_clk r8a7795_core_clks[] __initdata = {
 	DEF_FIXED(".s2",        CLK_S2,            CLK_PLL1_DIV2,  4, 1),
 	DEF_FIXED(".s3",        CLK_S3,            CLK_PLL1_DIV2,  6, 1),
 	DEF_FIXED(".sdsrc",     CLK_SDSRC,         CLK_PLL1_DIV2,  2, 1),
-	DEF_BASE(".rpcsrc",	CLK_RPCSRC, CLK_TYPE_GEN3_RPCSRC, CLK_PLL1),
 
-	DEF_BASE("rpc",		R8A7795_CLK_RPC, CLK_TYPE_GEN3_RPC,
-		 CLK_RPCSRC),
-	DEF_BASE("rpcd2",	R8A7795_CLK_RPCD2, CLK_TYPE_GEN3_RPCD2,
-		 R8A7795_CLK_RPC),
+	DEF_BASE(".rpcsrc",     CLK_RPCSRC, CLK_TYPE_GEN3_RPCSRC, CLK_PLL1),
 
 	DEF_GEN3_OSC(".r",      CLK_RINT,          CLK_EXTAL,      32),
 
@@ -113,6 +109,9 @@ static struct cpg_core_clk r8a7795_core_clks[] __initdata = {
 	DEF_GEN3_SD("sd2",      R8A7795_CLK_SD2,   R8A7795_CLK_SD2H, 0x268),
 	DEF_GEN3_SD("sd3",      R8A7795_CLK_SD3,   R8A7795_CLK_SD3H, 0x26c),
 
+	DEF_BASE("rpc",         R8A7795_CLK_RPC,   CLK_TYPE_GEN3_RPC,   CLK_RPCSRC),
+	DEF_BASE("rpcd2",       R8A7795_CLK_RPCD2, CLK_TYPE_GEN3_RPCD2, R8A7795_CLK_RPC),
+
 	DEF_FIXED("cl",         R8A7795_CLK_CL,    CLK_PLL1_DIV2, 48, 1),
 	DEF_FIXED("cr",         R8A7795_CLK_CR,    CLK_PLL1_DIV4,  2, 1),
 	DEF_FIXED("cp",         R8A7795_CLK_CP,    CLK_EXTAL,      2, 1),
diff --git a/drivers/clk/renesas/r8a7796-cpg-mssr.c b/drivers/clk/renesas/r8a7796-cpg-mssr.c
index 7950313611efa526..c4969318508eb44d 100644
--- a/drivers/clk/renesas/r8a7796-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a7796-cpg-mssr.c
@@ -73,12 +73,8 @@ static const struct cpg_core_clk r8a7796_core_clks[] __initconst = {
 	DEF_FIXED(".s2",        CLK_S2,            CLK_PLL1_DIV2,  4, 1),
 	DEF_FIXED(".s3",        CLK_S3,            CLK_PLL1_DIV2,  6, 1),
 	DEF_FIXED(".sdsrc",     CLK_SDSRC,         CLK_PLL1_DIV2,  2, 1),
-	DEF_BASE(".rpcsrc",	CLK_RPCSRC, CLK_TYPE_GEN3_RPCSRC, CLK_PLL1),
 
-	DEF_BASE("rpc",		R8A7796_CLK_RPC, CLK_TYPE_GEN3_RPC,
-		 CLK_RPCSRC),
-	DEF_BASE("rpcd2",	R8A7796_CLK_RPCD2, CLK_TYPE_GEN3_RPCD2,
-		 R8A7796_CLK_RPC),
+	DEF_BASE(".rpcsrc",     CLK_RPCSRC, CLK_TYPE_GEN3_RPCSRC, CLK_PLL1),
 
 	DEF_GEN3_OSC(".r",      CLK_RINT,          CLK_EXTAL,      32),
 
@@ -115,6 +111,9 @@ static const struct cpg_core_clk r8a7796_core_clks[] __initconst = {
 	DEF_GEN3_SD("sd2",      R8A7796_CLK_SD2,   R8A7796_CLK_SD2H, 0x268),
 	DEF_GEN3_SD("sd3",      R8A7796_CLK_SD3,   R8A7796_CLK_SD3H, 0x26c),
 
+	DEF_BASE("rpc",         R8A7796_CLK_RPC,   CLK_TYPE_GEN3_RPC,   CLK_RPCSRC),
+	DEF_BASE("rpcd2",       R8A7796_CLK_RPCD2, CLK_TYPE_GEN3_RPCD2, R8A7796_CLK_RPC),
+
 	DEF_FIXED("cl",         R8A7796_CLK_CL,    CLK_PLL1_DIV2, 48, 1),
 	DEF_FIXED("cr",         R8A7796_CLK_CR,    CLK_PLL1_DIV4,  2, 1),
 	DEF_FIXED("cp",         R8A7796_CLK_CP,    CLK_EXTAL,      2, 1),
diff --git a/drivers/clk/renesas/r8a77965-cpg-mssr.c b/drivers/clk/renesas/r8a77965-cpg-mssr.c
index d687c29efa3cec9b..78f6e530848ecc6e 100644
--- a/drivers/clk/renesas/r8a77965-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a77965-cpg-mssr.c
@@ -69,12 +69,8 @@ static const struct cpg_core_clk r8a77965_core_clks[] __initconst = {
 	DEF_FIXED(".s2",	CLK_S2,			CLK_PLL1_DIV2,	4, 1),
 	DEF_FIXED(".s3",	CLK_S3,			CLK_PLL1_DIV2,	6, 1),
 	DEF_FIXED(".sdsrc",	CLK_SDSRC,		CLK_PLL1_DIV2,	2, 1),
-	DEF_BASE(".rpcsrc",	CLK_RPCSRC, CLK_TYPE_GEN3_RPCSRC, CLK_PLL1),
 
-	DEF_BASE("rpc",		R8A77965_CLK_RPC, CLK_TYPE_GEN3_RPC,
-		 CLK_RPCSRC),
-	DEF_BASE("rpcd2",	R8A77965_CLK_RPCD2, CLK_TYPE_GEN3_RPCD2,
-		 R8A77965_CLK_RPC),
+	DEF_BASE(".rpcsrc",	CLK_RPCSRC, CLK_TYPE_GEN3_RPCSRC, CLK_PLL1),
 
 	DEF_GEN3_OSC(".r",	CLK_RINT,		CLK_EXTAL,	32),
 
@@ -110,6 +106,9 @@ static const struct cpg_core_clk r8a77965_core_clks[] __initconst = {
 	DEF_GEN3_SD("sd2",	R8A77965_CLK_SD2,	R8A77965_CLK_SD2H, 0x268),
 	DEF_GEN3_SD("sd3",	R8A77965_CLK_SD3,	R8A77965_CLK_SD3H, 0x26c),
 
+	DEF_BASE("rpc",		R8A77965_CLK_RPC,	CLK_TYPE_GEN3_RPC,   CLK_RPCSRC),
+	DEF_BASE("rpcd2",	R8A77965_CLK_RPCD2,	CLK_TYPE_GEN3_RPCD2, R8A77965_CLK_RPC),
+
 	DEF_FIXED("cl",		R8A77965_CLK_CL,	CLK_PLL1_DIV2, 48, 1),
 	DEF_FIXED("cr",         R8A77965_CLK_CR,	CLK_PLL1_DIV4,  2, 1),
 	DEF_FIXED("cp",		R8A77965_CLK_CP,	CLK_EXTAL,	2, 1),
diff --git a/drivers/clk/renesas/r8a77980-cpg-mssr.c b/drivers/clk/renesas/r8a77980-cpg-mssr.c
index f3cd64de4dc6e0a8..06f925aff407b1c1 100644
--- a/drivers/clk/renesas/r8a77980-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a77980-cpg-mssr.c
@@ -66,13 +66,10 @@ static const struct cpg_core_clk r8a77980_core_clks[] __initconst = {
 	DEF_FIXED(".s2",	CLK_S2,		   CLK_PLL1_DIV2,  4, 1),
 	DEF_FIXED(".s3",	CLK_S3,		   CLK_PLL1_DIV2,  6, 1),
 	DEF_FIXED(".sdsrc",	CLK_SDSRC,	   CLK_PLL1_DIV2,  2, 1),
+
 	DEF_BASE(".rpcsrc",	CLK_RPCSRC, CLK_TYPE_GEN3_RPCSRC, CLK_PLL1),
-	DEF_RATE(".oco",	CLK_OCO,           32768),
 
-	DEF_BASE("rpc",		R8A77980_CLK_RPC, CLK_TYPE_GEN3_RPC,
-		 CLK_RPCSRC),
-	DEF_BASE("rpcd2",	R8A77980_CLK_RPCD2, CLK_TYPE_GEN3_RPCD2,
-		 R8A77980_CLK_RPC),
+	DEF_RATE(".oco",	CLK_OCO,           32768),
 
 	/* Core Clock Outputs */
 	DEF_FIXED("ztr",	R8A77980_CLK_ZTR,   CLK_PLL1_DIV2,  6, 1),
@@ -99,6 +96,9 @@ static const struct cpg_core_clk r8a77980_core_clks[] __initconst = {
 	DEF_GEN3_SDH("sd0h",	R8A77980_CLK_SD0H,  CLK_SDSRC,	       0x0074),
 	DEF_GEN3_SD("sd0",	R8A77980_CLK_SD0,   R8A77980_CLK_SD0H, 0x0074),
 
+	DEF_BASE("rpc",		R8A77980_CLK_RPC,   CLK_TYPE_GEN3_RPC,   CLK_RPCSRC),
+	DEF_BASE("rpcd2",	R8A77980_CLK_RPCD2, CLK_TYPE_GEN3_RPCD2, R8A77980_CLK_RPC),
+
 	DEF_FIXED("cl",		R8A77980_CLK_CL,    CLK_PLL1_DIV2, 48, 1),
 	DEF_FIXED("cp",		R8A77980_CLK_CP,    CLK_EXTAL,	    2, 1),
 	DEF_FIXED("cpex",	R8A77980_CLK_CPEX,  CLK_EXTAL,	    2, 1),
diff --git a/drivers/clk/renesas/r8a77990-cpg-mssr.c b/drivers/clk/renesas/r8a77990-cpg-mssr.c
index a5c95e0021f82e7f..b666d099365ef01d 100644
--- a/drivers/clk/renesas/r8a77990-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a77990-cpg-mssr.c
@@ -110,10 +110,8 @@ static const struct cpg_core_clk r8a77990_core_clks[] __initconst = {
 	DEF_GEN3_SD("sd1",     R8A77990_CLK_SD1,   R8A77990_CLK_SD1H, 0x0078),
 	DEF_GEN3_SD("sd3",     R8A77990_CLK_SD3,   R8A77990_CLK_SD3H, 0x026c),
 
-	DEF_BASE("rpc",		R8A77990_CLK_RPC, CLK_TYPE_GEN3_RPC,
-		 CLK_RPCSRC),
-	DEF_BASE("rpcd2",	R8A77990_CLK_RPCD2, CLK_TYPE_GEN3_RPCD2,
-		 R8A77990_CLK_RPC),
+	DEF_BASE("rpc",        R8A77990_CLK_RPC,   CLK_TYPE_GEN3_RPC,   CLK_RPCSRC),
+	DEF_BASE("rpcd2",      R8A77990_CLK_RPCD2, CLK_TYPE_GEN3_RPCD2, R8A77990_CLK_RPC),
 
 	DEF_FIXED("cl",        R8A77990_CLK_CL,    CLK_PLL1,      48, 1),
 	DEF_FIXED("cr",        R8A77990_CLK_CR,    CLK_PLL1D2,     2, 1),
diff --git a/drivers/clk/renesas/r8a77995-cpg-mssr.c b/drivers/clk/renesas/r8a77995-cpg-mssr.c
index 22e7bf0de9fe1f53..24ba9093a72f7341 100644
--- a/drivers/clk/renesas/r8a77995-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a77995-cpg-mssr.c
@@ -106,13 +106,11 @@ static const struct cpg_core_clk r8a77995_core_clks[] __initconst = {
 	DEF_GEN3_PE("s3d2c",   R8A77995_CLK_S3D2C, CLK_S3, 2, CLK_PE, 2),
 	DEF_GEN3_PE("s3d4c",   R8A77995_CLK_S3D4C, CLK_S3, 4, CLK_PE, 4),
 
-	DEF_GEN3_SDH("sd0h",   R8A77995_CLK_SD0H, CLK_SDSRC,         0x268),
-	DEF_GEN3_SD("sd0",     R8A77995_CLK_SD0,  R8A77995_CLK_SD0H, 0x268),
+	DEF_GEN3_SDH("sd0h",   R8A77995_CLK_SD0H,  CLK_SDSRC,         0x268),
+	DEF_GEN3_SD("sd0",     R8A77995_CLK_SD0,   R8A77995_CLK_SD0H, 0x268),
 
-	DEF_BASE("rpc",		R8A77995_CLK_RPC, CLK_TYPE_GEN3_RPC,
-		 CLK_RPCSRC),
-	DEF_BASE("rpcd2",	R8A77995_CLK_RPCD2, CLK_TYPE_GEN3_RPCD2,
-		 R8A77995_CLK_RPC),
+	DEF_BASE("rpc",        R8A77995_CLK_RPC,   CLK_TYPE_GEN3_RPC,   CLK_RPCSRC),
+	DEF_BASE("rpcd2",      R8A77995_CLK_RPCD2, CLK_TYPE_GEN3_RPCD2, R8A77995_CLK_RPC),
 
 	DEF_DIV6P1("canfd",    R8A77995_CLK_CANFD, CLK_PLL0D3,    0x244),
 	DEF_DIV6P1("mso",      R8A77995_CLK_MSO,   CLK_PLL1D2,    0x014),
diff --git a/drivers/clk/renesas/r8a779a0-cpg-mssr.c b/drivers/clk/renesas/r8a779a0-cpg-mssr.c
index fadd8a1718c66cbf..fb84f7b51f61c064 100644
--- a/drivers/clk/renesas/r8a779a0-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a779a0-cpg-mssr.c
@@ -85,11 +85,10 @@ static const struct cpg_core_clk r8a779a0_core_clks[] __initconst = {
 	DEF_FIXED(".s1",		CLK_S1,		CLK_PLL1_DIV2,	2, 1),
 	DEF_FIXED(".s3",		CLK_S3,		CLK_PLL1_DIV2,	4, 1),
 	DEF_FIXED(".sdsrc",		CLK_SDSRC,	CLK_PLL5_DIV4,	1, 1),
+
 	DEF_RATE(".oco",		CLK_OCO,	32768),
-	DEF_BASE(".rpcsrc",	 CLK_RPCSRC,	   CLK_TYPE_GEN4_RPCSRC, CLK_PLL5),
-	DEF_BASE("rpc",		 R8A779A0_CLK_RPC, CLK_TYPE_GEN4_RPC, CLK_RPCSRC),
-	DEF_BASE("rpcd2",	 R8A779A0_CLK_RPCD2, CLK_TYPE_GEN4_RPCD2,
-		 R8A779A0_CLK_RPC),
+
+	DEF_BASE(".rpcsrc",		CLK_RPCSRC,	CLK_TYPE_GEN4_RPCSRC, CLK_PLL5),
 
 	/* Core Clock Outputs */
 	DEF_GEN4_Z("z0",	R8A779A0_CLK_Z0,	CLK_TYPE_GEN4_Z,	CLK_PLL20,	2, 0),
@@ -120,6 +119,10 @@ static const struct cpg_core_clk r8a779a0_core_clks[] __initconst = {
 	DEF_GEN4_SDH("sdh0",	R8A779A0_CLK_SD0H,	CLK_SDSRC,	   0x870),
 	DEF_GEN4_SD("sd0",	R8A779A0_CLK_SD0,	R8A779A0_CLK_SD0H, 0x870),
 
+	DEF_BASE("rpc",		R8A779A0_CLK_RPC, CLK_TYPE_GEN4_RPC, CLK_RPCSRC),
+	DEF_BASE("rpcd2",	R8A779A0_CLK_RPCD2, CLK_TYPE_GEN4_RPCD2,
+		 R8A779A0_CLK_RPC),
+
 	DEF_DIV6P1("mso",	R8A779A0_CLK_MSO,	CLK_PLL5_DIV4,	0x87c),
 	DEF_DIV6P1("canfd",	R8A779A0_CLK_CANFD,	CLK_PLL5_DIV4,	0x878),
 	DEF_DIV6P1("csi0",	R8A779A0_CLK_CSI0,	CLK_PLL5_DIV4,	0x880),
diff --git a/drivers/clk/renesas/r8a779f0-cpg-mssr.c b/drivers/clk/renesas/r8a779f0-cpg-mssr.c
index 76b441965037798d..08e8d95ce5e7eca2 100644
--- a/drivers/clk/renesas/r8a779f0-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a779f0-cpg-mssr.c
@@ -70,12 +70,11 @@ static const struct cpg_core_clk r8a779f0_core_clks[] __initconst = {
 	DEF_FIXED(".pll5_div4",	CLK_PLL5_DIV4,	CLK_PLL5_DIV2,	2, 1),
 	DEF_FIXED(".pll6_div2",	CLK_PLL6_DIV2,	CLK_PLL6,	2, 1),
 	DEF_FIXED(".s0",	CLK_S0,		CLK_PLL1_DIV2,	2, 1),
+
 	DEF_BASE(".sdsrc",	CLK_SDSRC,	CLK_TYPE_GEN4_SDSRC, CLK_PLL5),
 	DEF_RATE(".oco",	CLK_OCO,	32768),
 
-	DEF_BASE(".rpcsrc",	CLK_RPCSRC,		CLK_TYPE_GEN4_RPCSRC, CLK_PLL5),
-	DEF_BASE(".rpc",	R8A779F0_CLK_RPC,	CLK_TYPE_GEN4_RPC, CLK_RPCSRC),
-	DEF_BASE("rpcd2",	R8A779F0_CLK_RPCD2,	CLK_TYPE_GEN4_RPCD2, R8A779F0_CLK_RPC),
+	DEF_BASE(".rpcsrc",	CLK_RPCSRC,	CLK_TYPE_GEN4_RPCSRC, CLK_PLL5),
 
 	/* Core Clock Outputs */
 	DEF_FIXED("s0d2",	R8A779F0_CLK_S0D2,	CLK_S0,		2, 1),
@@ -108,6 +107,10 @@ static const struct cpg_core_clk r8a779f0_core_clks[] __initconst = {
 	DEF_FIXED("cpex",	R8A779F0_CLK_CPEX,	CLK_EXTAL,	2, 1),
 
 	DEF_GEN4_SD("sd0",	R8A779F0_CLK_SD0,	CLK_SDSRC,	0x870),
+
+	DEF_BASE("rpc",		R8A779F0_CLK_RPC,	CLK_TYPE_GEN4_RPC, CLK_RPCSRC),
+	DEF_BASE("rpcd2",	R8A779F0_CLK_RPCD2,	CLK_TYPE_GEN4_RPCD2, R8A779F0_CLK_RPC),
+
 	DEF_DIV6P1("mso",	R8A779F0_CLK_MSO,	CLK_PLL5_DIV4,	0x87c),
 
 	DEF_GEN4_OSC("osc",	R8A779F0_CLK_OSC,	CLK_EXTAL,	8),
-- 
2.25.1

