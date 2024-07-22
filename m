Return-Path: <linux-renesas-soc+bounces-7415-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 91569938E5E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jul 2024 13:50:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C32BB1C2108E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jul 2024 11:50:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F09E16D318;
	Mon, 22 Jul 2024 11:50:48 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [195.130.132.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ADB016D315
	for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Jul 2024 11:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721649048; cv=none; b=Sa/3IML3HjWT6EekQEAF99OP+bK1m5Ce4eDPXYvMfuAPAOQFJ6riMmM0aYssL4ltgOe2h7N6bq4W2efRM6Gk3udaKIH+k9RASlJaqUqIq3PmWkMtlljUc7hJ5SWXwEBS//93htKrPljKw6zUVWIEcKRSUInueaSNw9IzGoHtO9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721649048; c=relaxed/simple;
	bh=ViXWlD3eAc8m5Btmv+f22oH0omoNnIZdG5leVxsApOk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fgy/Cw6iMtI/lyCgT5E+1HcvzXW8oNk9LLI1F2ohvXMzg9cOXSWNPog9Qct0H36txrDjbJATVhtPz6+h7JzTqCUIT1gQMUriry7pv6kWMI3hi4yYgr9t98ZD6SIUN2iIiNVq3wm6oALVBxzAoENXS5Px7JDmQuiZCmlYE6TSQG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:173b:9414:53f5:de4c])
	by baptiste.telenet-ops.be with bizsmtp
	id qbqc2C00Q1wvoRx01bqcUE; Mon, 22 Jul 2024 13:50:37 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sVrYY-002zAm-9V;
	Mon, 22 Jul 2024 13:50:36 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sVrYq-0020i8-Pb;
	Mon, 22 Jul 2024 13:50:36 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v2 09/15] clk: renesas: r8a779a0: Use defines for PLL control registers
Date: Mon, 22 Jul 2024 13:50:29 +0200
Message-Id: <8cac464c7dfb15ecd299b8ab4ba88a16135f8123.1721648548.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1721648548.git.geert+renesas@glider.be>
References: <cover.1721648548.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add symbolic definitions for the various PLL control registers.
Replace hardcoded register offsets by the new definitions.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
v2:
  - Add Reviewed-by.
---
 drivers/clk/renesas/r8a779a0-cpg-mssr.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/renesas/r8a779a0-cpg-mssr.c b/drivers/clk/renesas/r8a779a0-cpg-mssr.c
index 14042d6dc4dd3e21..e6e2c3c16c8d5bef 100644
--- a/drivers/clk/renesas/r8a779a0-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a779a0-cpg-mssr.c
@@ -61,6 +61,11 @@ enum clk_ids {
 	DEF_BASE(_name, _id, CLK_TYPE_GEN4_PLL2X_3X, CLK_MAIN, \
 		 .offset = _offset)
 
+#define CPG_PLL20CR	0x0834	/* PLL20 Control Register */
+#define CPG_PLL21CR	0x0838	/* PLL21 Control Register */
+#define CPG_PLL30CR	0x083c	/* PLL30 Control Register */
+#define CPG_PLL31CR	0x0840	/* PLL31 Control Register */
+
 static const struct cpg_core_clk r8a779a0_core_clks[] __initconst = {
 	/* External Clock Inputs */
 	DEF_INPUT("extal",  CLK_EXTAL),
@@ -70,10 +75,10 @@ static const struct cpg_core_clk r8a779a0_core_clks[] __initconst = {
 	DEF_BASE(".main", CLK_MAIN,	CLK_TYPE_GEN4_MAIN, CLK_EXTAL),
 	DEF_BASE(".pll1", CLK_PLL1,	CLK_TYPE_GEN4_PLL1, CLK_MAIN),
 	DEF_BASE(".pll5", CLK_PLL5,	CLK_TYPE_GEN4_PLL5, CLK_MAIN),
-	DEF_PLL(".pll20", CLK_PLL20,	0x0834),
-	DEF_PLL(".pll21", CLK_PLL21,	0x0838),
-	DEF_PLL(".pll30", CLK_PLL30,	0x083c),
-	DEF_PLL(".pll31", CLK_PLL31,	0x0840),
+	DEF_PLL(".pll20", CLK_PLL20,	CPG_PLL20CR),
+	DEF_PLL(".pll21", CLK_PLL21,	CPG_PLL21CR),
+	DEF_PLL(".pll30", CLK_PLL30,	CPG_PLL30CR),
+	DEF_PLL(".pll31", CLK_PLL31,	CPG_PLL31CR),
 
 	DEF_FIXED(".pll1_div2",		CLK_PLL1_DIV2,	CLK_PLL1,	2, 1),
 	DEF_FIXED(".pll20_div2",	CLK_PLL20_DIV2,	CLK_PLL20,	2, 1),
-- 
2.34.1


