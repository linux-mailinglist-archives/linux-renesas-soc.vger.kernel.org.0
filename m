Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 337D9148632
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Jan 2020 14:31:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388408AbgAXNbl (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 24 Jan 2020 08:31:41 -0500
Received: from xavier.telenet-ops.be ([195.130.132.52]:44820 "EHLO
        xavier.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387941AbgAXNbl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 24 Jan 2020 08:31:41 -0500
Received: from ramsan ([84.195.182.253])
        by xavier.telenet-ops.be with bizsmtp
        id uDXf2100t5USYZQ01DXfYb; Fri, 24 Jan 2020 14:31:39 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iuz3j-0007f7-Gx; Fri, 24 Jan 2020 14:31:39 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iuz3j-00049W-EU; Fri, 24 Jan 2020 14:31:39 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Gilad Ben-Yossef <gilad@benyossef.com>, linux-clk@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] clk: renesas: rcar-gen3: Add CCREE clocks
Date:   Fri, 24 Jan 2020 14:31:37 +0100
Message-Id: <20200124133137.15921-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add the CryptoCell module clocks and their parents for the CryptoCell
instances in the various Renesas R-Car Gen3 SoCs that do not have
support for them yet in their clock drivers (M3-W/W+, M3-N, E3, D3).

The R-Car H3 clock driver already supports these clocks.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in clk-renesas-for-v5.7.

 drivers/clk/renesas/r8a7796-cpg-mssr.c  | 2 ++
 drivers/clk/renesas/r8a77965-cpg-mssr.c | 4 +++-
 drivers/clk/renesas/r8a77990-cpg-mssr.c | 2 ++
 drivers/clk/renesas/r8a77995-cpg-mssr.c | 2 ++
 4 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/renesas/r8a7796-cpg-mssr.c b/drivers/clk/renesas/r8a7796-cpg-mssr.c
index e8420d3ada94ca45..1155d66368485ea6 100644
--- a/drivers/clk/renesas/r8a7796-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a7796-cpg-mssr.c
@@ -105,6 +105,7 @@ static const struct cpg_core_clk r8a7796_core_clks[] __initconst = {
 	DEF_GEN3_SD("sd3",      R8A7796_CLK_SD3,   CLK_SDSRC,     0x26c),
 
 	DEF_FIXED("cl",         R8A7796_CLK_CL,    CLK_PLL1_DIV2, 48, 1),
+	DEF_FIXED("cr",         R8A7796_CLK_CR,    CLK_PLL1_DIV4,  2, 1),
 	DEF_FIXED("cp",         R8A7796_CLK_CP,    CLK_EXTAL,      2, 1),
 	DEF_FIXED("cpex",       R8A7796_CLK_CPEX,  CLK_EXTAL,      2, 1),
 
@@ -132,6 +133,7 @@ static struct mssr_mod_clk r8a7796_mod_clks[] __initdata = {
 	DEF_MOD("sys-dmac2",		 217,	R8A7796_CLK_S3D1),
 	DEF_MOD("sys-dmac1",		 218,	R8A7796_CLK_S3D1),
 	DEF_MOD("sys-dmac0",		 219,	R8A7796_CLK_S0D3),
+	DEF_MOD("sceg-pub",		 229,	R8A7796_CLK_CR),
 	DEF_MOD("cmt3",			 300,	R8A7796_CLK_R),
 	DEF_MOD("cmt2",			 301,	R8A7796_CLK_R),
 	DEF_MOD("cmt1",			 302,	R8A7796_CLK_R),
diff --git a/drivers/clk/renesas/r8a77965-cpg-mssr.c b/drivers/clk/renesas/r8a77965-cpg-mssr.c
index b3af4da2ca74b15d..9530480880f185a4 100644
--- a/drivers/clk/renesas/r8a77965-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a77965-cpg-mssr.c
@@ -99,7 +99,8 @@ static const struct cpg_core_clk r8a77965_core_clks[] __initconst = {
 	DEF_GEN3_SD("sd2",	R8A77965_CLK_SD2,	CLK_SDSRC,	0x268),
 	DEF_GEN3_SD("sd3",	R8A77965_CLK_SD3,	CLK_SDSRC,	0x26c),
 
-	DEF_FIXED("cl",		R8A77965_CLK_CL,	CLK_PLL1_DIV2,	48, 1),
+	DEF_FIXED("cl",		R8A77965_CLK_CL,	CLK_PLL1_DIV2, 48, 1),
+	DEF_FIXED("cr",         R8A77965_CLK_CR,	CLK_PLL1_DIV4,  2, 1),
 	DEF_FIXED("cp",		R8A77965_CLK_CP,	CLK_EXTAL,	2, 1),
 	DEF_FIXED("cpex",	R8A77965_CLK_CPEX,	CLK_EXTAL,	2, 1),
 
@@ -127,6 +128,7 @@ static const struct mssr_mod_clk r8a77965_mod_clks[] __initconst = {
 	DEF_MOD("sys-dmac2",		217,	R8A77965_CLK_S3D1),
 	DEF_MOD("sys-dmac1",		218,	R8A77965_CLK_S3D1),
 	DEF_MOD("sys-dmac0",		219,	R8A77965_CLK_S0D3),
+	DEF_MOD("sceg-pub",		229,	R8A77965_CLK_CR),
 
 	DEF_MOD("cmt3",			300,	R8A77965_CLK_R),
 	DEF_MOD("cmt2",			301,	R8A77965_CLK_R),
diff --git a/drivers/clk/renesas/r8a77990-cpg-mssr.c b/drivers/clk/renesas/r8a77990-cpg-mssr.c
index ceabf55c21c253f7..8eda2e3e24807b37 100644
--- a/drivers/clk/renesas/r8a77990-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a77990-cpg-mssr.c
@@ -105,6 +105,7 @@ static const struct cpg_core_clk r8a77990_core_clks[] __initconst = {
 	DEF_GEN3_SD("sd3",     R8A77990_CLK_SD3,   CLK_SDSRC,	  0x026c),
 
 	DEF_FIXED("cl",        R8A77990_CLK_CL,    CLK_PLL1,      48, 1),
+	DEF_FIXED("cr",        R8A77990_CLK_CR,    CLK_PLL1D2,     2, 1),
 	DEF_FIXED("cp",        R8A77990_CLK_CP,    CLK_EXTAL,      2, 1),
 	DEF_FIXED("cpex",      R8A77990_CLK_CPEX,  CLK_EXTAL,      4, 1),
 
@@ -135,6 +136,7 @@ static const struct mssr_mod_clk r8a77990_mod_clks[] __initconst = {
 	DEF_MOD("sys-dmac2",		 217,	R8A77990_CLK_S3D1),
 	DEF_MOD("sys-dmac1",		 218,	R8A77990_CLK_S3D1),
 	DEF_MOD("sys-dmac0",		 219,	R8A77990_CLK_S3D1),
+	DEF_MOD("sceg-pub",		 229,	R8A77990_CLK_CR),
 
 	DEF_MOD("cmt3",			 300,	R8A77990_CLK_R),
 	DEF_MOD("cmt2",			 301,	R8A77990_CLK_R),
diff --git a/drivers/clk/renesas/r8a77995-cpg-mssr.c b/drivers/clk/renesas/r8a77995-cpg-mssr.c
index 962bb337f2e7c2cd..056ebf3e70e2dd49 100644
--- a/drivers/clk/renesas/r8a77995-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a77995-cpg-mssr.c
@@ -91,6 +91,7 @@ static const struct cpg_core_clk r8a77995_core_clks[] __initconst = {
 	DEF_FIXED("s3d4",      R8A77995_CLK_S3D4,  CLK_S3,         4, 1),
 
 	DEF_FIXED("cl",        R8A77995_CLK_CL,    CLK_PLL1,      48, 1),
+	DEF_FIXED("cr",        R8A77995_CLK_CR,    CLK_PLL1D2,     2, 1),
 	DEF_FIXED("cp",        R8A77995_CLK_CP,    CLK_EXTAL,      2, 1),
 	DEF_FIXED("cpex",      R8A77995_CLK_CPEX,  CLK_EXTAL,      4, 1),
 
@@ -122,6 +123,7 @@ static const struct mssr_mod_clk r8a77995_mod_clks[] __initconst = {
 	DEF_MOD("sys-dmac2",		 217,	R8A77995_CLK_S3D1),
 	DEF_MOD("sys-dmac1",		 218,	R8A77995_CLK_S3D1),
 	DEF_MOD("sys-dmac0",		 219,	R8A77995_CLK_S3D1),
+	DEF_MOD("sceg-pub",		 229,	R8A77995_CLK_CR),
 	DEF_MOD("cmt3",			 300,	R8A77995_CLK_R),
 	DEF_MOD("cmt2",			 301,	R8A77995_CLK_R),
 	DEF_MOD("cmt1",			 302,	R8A77995_CLK_R),
-- 
2.17.1

