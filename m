Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 83E8A2E323C
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 27 Dec 2020 18:43:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726396AbgL0Rm6 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 27 Dec 2020 12:42:58 -0500
Received: from www.zeus03.de ([194.117.254.33]:46802 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726293AbgL0Rm5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 27 Dec 2020 12:42:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=k1; bh=3CE4J0HHpKGylm
        34QYPJITOnkbK/t0f9thaCmJ/Z/4s=; b=y+PYDR7ZFMGD4zaKL1ZgJhlngq5d3V
        KFzMnsz8P59PAKj3mlKRuOUEYTYxtP4UsLkqc7c3bLJU4B0fTKJCqOg9d6kScj/j
        JSsdITTfBvSFx27QNx3s8Ww9nHcA5jV0FIOcG53uuAqK6a9U0zL/UpdY2X0B7Pau
        ghMOylg5FpKU8=
Received: (qmail 1557123 invoked from network); 27 Dec 2020 18:42:15 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 27 Dec 2020 18:42:15 +0100
X-UD-Smtp-Session: l3s3148p1@hsOMrXW3Vp5UhsuJ
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 4/6] clk: renesas: r8a779a0: add SDHI support
Date:   Sun, 27 Dec 2020 18:41:58 +0100
Message-Id: <20201227174202.40834-5-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201227174202.40834-1-wsa+renesas@sang-engineering.com>
References: <20201227174202.40834-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

We use the shiny new CPG library for that.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/clk/renesas/Kconfig             |  1 +
 drivers/clk/renesas/r8a779a0-cpg-mssr.c | 17 +++++++++++++++--
 2 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/renesas/Kconfig b/drivers/clk/renesas/Kconfig
index 7e788fee6b9f..607e64a17d72 100644
--- a/drivers/clk/renesas/Kconfig
+++ b/drivers/clk/renesas/Kconfig
@@ -148,6 +148,7 @@ config CLK_R8A77995
 
 config CLK_R8A779A0
 	bool "R-Car V3U clock support" if COMPILE_TEST
+	select CLK_RCAR_CPG_LIB
 	select CLK_RENESAS_CPG_MSSR
 
 config CLK_R9A06G032
diff --git a/drivers/clk/renesas/r8a779a0-cpg-mssr.c b/drivers/clk/renesas/r8a779a0-cpg-mssr.c
index 5be70a6a7904..d85c31a465e1 100644
--- a/drivers/clk/renesas/r8a779a0-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a779a0-cpg-mssr.c
@@ -25,6 +25,7 @@
 
 #include <dt-bindings/clock/r8a779a0-cpg-mssr.h>
 
+#include "rcar-cpg-lib.h"
 #include "renesas-cpg-mssr.h"
 
 enum rcar_r8a779a0_clk_types {
@@ -32,6 +33,7 @@ enum rcar_r8a779a0_clk_types {
 	CLK_TYPE_R8A779A0_PLL1,
 	CLK_TYPE_R8A779A0_PLL2X_3X,	/* PLL[23][01] */
 	CLK_TYPE_R8A779A0_PLL5,
+	CLK_TYPE_R8A779A0_SD,
 	CLK_TYPE_R8A779A0_MDSEL,	/* Select parent/divider using mode pin */
 	CLK_TYPE_R8A779A0_OSC,	/* OSC EXTAL predivider and fixed divider */
 };
@@ -82,6 +84,9 @@ enum clk_ids {
 	DEF_BASE(_name, _id, CLK_TYPE_R8A779A0_PLL2X_3X, CLK_MAIN, \
 		 .offset = _offset)
 
+#define DEF_SD(_name, _id, _parent, _offset)   \
+	DEF_BASE(_name, _id, CLK_TYPE_R8A779A0_SD, _parent, .offset = _offset)
+
 #define DEF_MDSEL(_name, _id, _md, _parent0, _div0, _parent1, _div1) \
 	DEF_BASE(_name, _id, CLK_TYPE_R8A779A0_MDSEL,	\
 		 (_parent0) << 16 | (_parent1),		\
@@ -113,6 +118,7 @@ static const struct cpg_core_clk r8a779a0_core_clks[] __initconst = {
 	DEF_FIXED(".pll5_div4",		CLK_PLL5_DIV4,	CLK_PLL5_DIV2,	2, 1),
 	DEF_FIXED(".s1",		CLK_S1,		CLK_PLL1_DIV2,	2, 1),
 	DEF_FIXED(".s3",		CLK_S3,		CLK_PLL1_DIV2,	4, 1),
+	DEF_FIXED(".sdsrc",		CLK_SDSRC,	CLK_PLL5_DIV4,	1, 1),
 	DEF_RATE(".oco",		CLK_OCO,	32768),
 
 	/* Core Clock Outputs */
@@ -139,6 +145,8 @@ static const struct cpg_core_clk r8a779a0_core_clks[] __initconst = {
 	DEF_FIXED("cbfusa",	R8A779A0_CLK_CBFUSA,	CLK_EXTAL,	2, 1),
 	DEF_FIXED("cp",		R8A779A0_CLK_CP,	CLK_EXTAL,	2, 1),
 
+	DEF_SD("sd0",		R8A779A0_CLK_SD0,	CLK_SDSRC,	0x870),
+
 	DEF_DIV6P1("mso",	R8A779A0_CLK_MSO,	CLK_PLL5_DIV4,	0x87c),
 	DEF_DIV6P1("canfd",	R8A779A0_CLK_CANFD,	CLK_PLL5_DIV4,	0x878),
 	DEF_DIV6P1("csi0",	R8A779A0_CLK_CSI0,	CLK_PLL5_DIV4,	0x880),
@@ -169,6 +177,7 @@ static const struct mssr_mod_clk r8a779a0_mod_clks[] __initconst = {
 	DEF_MOD("scif1",	703,	R8A779A0_CLK_S1D8),
 	DEF_MOD("scif3",	704,	R8A779A0_CLK_S1D8),
 	DEF_MOD("scif4",	705,	R8A779A0_CLK_S1D8),
+	DEF_MOD("sdhi0",	706,	R8A779A0_CLK_SD0),
 	DEF_MOD("vin00",	730,	R8A779A0_CLK_S1D1),
 	DEF_MOD("vin01",	731,	R8A779A0_CLK_S1D1),
 	DEF_MOD("vin02",	800,	R8A779A0_CLK_S1D1),
@@ -208,8 +217,6 @@ static const struct mssr_mod_clk r8a779a0_mod_clks[] __initconst = {
 	DEF_MOD("pfc3",		918,	R8A779A0_CLK_CP),
 };
 
-static spinlock_t cpg_lock;
-
 static const struct rcar_r8a779a0_cpg_pll_config *cpg_pll_config __initdata;
 static unsigned int cpg_clk_extalr __initdata;
 static u32 cpg_mode __initdata;
@@ -248,6 +255,12 @@ static struct clk * __init rcar_r8a779a0_cpg_clk_register(struct device *dev,
 		div = cpg_pll_config->pll5_div;
 		break;
 
+	case CLK_TYPE_R8A779A0_SD:
+		return cpg_sd_clk_register(core->name, base, core->offset,
+					   __clk_get_name(parent), notifiers,
+					   false);
+		break;
+
 	case CLK_TYPE_R8A779A0_MDSEL:
 		/*
 		 * Clock selectable between two parents and two fixed dividers
-- 
2.28.0

