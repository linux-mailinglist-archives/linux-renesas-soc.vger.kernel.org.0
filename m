Return-Path: <linux-renesas-soc+bounces-7308-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 77D1692FC7E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jul 2024 16:26:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A60671C21ED3
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jul 2024 14:26:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6809D13F439;
	Fri, 12 Jul 2024 14:26:52 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from andre.telenet-ops.be (andre.telenet-ops.be [195.130.132.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CA5B17166F
	for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Jul 2024 14:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720794412; cv=none; b=E7exFMt4/pwmQHgzTivc+9C0lPG+BFCYPQvtAifbZ3LcKO61lJxnDSqEB8Q0f+Qraeii5I8o8VYzZbN+uyfAfCSAqhrAotcuiTLvXoY7Ln7JKorEcLEWkEyP6B7+KxKVwVJMmN83LiGCA54kX0k+00/DR8DoUkDFYl0CRQBaBro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720794412; c=relaxed/simple;
	bh=zviy3mhdwnRu/uySHi/CfMvlfKouQQG0OPoytnNk3CM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WdXCPBrlqDohn3rvmpi1PgzGrHgnDXLK/xJPicc0lJ32EyKgbM3C/nKzgM9/2WvUTN9KA3jnj5hsAufrp+Tor/DiHRMufbTlBHcP4fbY5RQ741dy1hdWYXTgbZyQTgO8FcVVUk6Ti2sqGDPH43qdtutQHi+Iu2Wlk/pzHLNZJ9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:9b6b:6da0:997b:7165])
	by andre.telenet-ops.be with bizsmtp
	id meSn2C00146XLxg01eSnWN; Fri, 12 Jul 2024 16:26:47 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sSHEG-001qJB-8t;
	Fri, 12 Jul 2024 16:26:47 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sSHEU-000W9j-UY;
	Fri, 12 Jul 2024 16:26:46 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Cong Dang <cong.dang.xn@renesas.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 4/4] clk: renesas: r8a779h0: Initial clock descriptions should be __initconst
Date: Fri, 12 Jul 2024 16:26:46 +0200
Message-Id: <35bbcfb914ddb377fa77e3425e4e7e232c7c2cf9.1720794214.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1720794214.git.geert+renesas@glider.be>
References: <cover.1720794214.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

r8a779h0_core_clks[], r8a779h0_mod_clks[], and cpg_pll_configs[] are
only used during initialization.  Hence make them __initconst, so they
will be freed later.

Fixes: f077cab34df3010d ("clk: renesas: cpg-mssr: Add support for R-Car V4M")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/clk/renesas/r8a779h0-cpg-mssr.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/renesas/r8a779h0-cpg-mssr.c b/drivers/clk/renesas/r8a779h0-cpg-mssr.c
index e00e247a056fc96e..379e652293bf1964 100644
--- a/drivers/clk/renesas/r8a779h0-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a779h0-cpg-mssr.c
@@ -63,7 +63,7 @@ enum clk_ids {
 	MOD_CLK_BASE
 };
 
-static const struct cpg_core_clk r8a779h0_core_clks[] = {
+static const struct cpg_core_clk r8a779h0_core_clks[] __initconst = {
 	/* External Clock Inputs */
 	DEF_INPUT("extal",	CLK_EXTAL),
 	DEF_INPUT("extalr",	CLK_EXTALR),
@@ -172,7 +172,7 @@ static const struct cpg_core_clk r8a779h0_core_clks[] = {
 	DEF_GEN4_MDSEL("r",	R8A779H0_CLK_R, 29, CLK_EXTALR, 1, CLK_OCO, 1),
 };
 
-static const struct mssr_mod_clk r8a779h0_mod_clks[] = {
+static const struct mssr_mod_clk r8a779h0_mod_clks[] __initconst = {
 	DEF_MOD("avb0:rgmii0",	211,	R8A779H0_CLK_S0D8_HSC),
 	DEF_MOD("avb1:rgmii1",	212,	R8A779H0_CLK_S0D8_HSC),
 	DEF_MOD("avb2:rgmii2",	213,	R8A779H0_CLK_S0D8_HSC),
@@ -253,7 +253,7 @@ static const struct mssr_mod_clk r8a779h0_mod_clks[] = {
 #define CPG_PLL_CONFIG_INDEX(md)	((((md) & BIT(14)) >> 13) | \
 					 (((md) & BIT(13)) >> 13))
 
-static const struct rcar_gen4_cpg_pll_config cpg_pll_configs[4] = {
+static const struct rcar_gen4_cpg_pll_config cpg_pll_configs[4] __initconst = {
 	/* EXTAL div	PLL1 mult/div	PLL2 mult/div	PLL3 mult/div	PLL4 mult/div	PLL5 mult/div	PLL6 mult/div	OSC prediv */
 	{ 1,		192,	1,	240,	1,	192,	1,	240,	1,	192,	1,	168,	1,	16,	},
 	{ 1,		160,	1,	200,	1,	160,	1,	200,	1,	160,	1,	140,	1,	19,	},
-- 
2.34.1


