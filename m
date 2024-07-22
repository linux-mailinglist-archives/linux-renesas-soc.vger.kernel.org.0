Return-Path: <linux-renesas-soc+bounces-7425-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E68C7938EA9
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jul 2024 13:59:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9D3181F20FCB
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jul 2024 11:59:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D238316D4C5;
	Mon, 22 Jul 2024 11:59:23 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from weierstrass.telenet-ops.be (weierstrass.telenet-ops.be [195.130.137.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33D1F16D308
	for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Jul 2024 11:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721649563; cv=none; b=bRlsRVfsm1/ulyvMLRS86Tf7MD9t7eZwpjnW+lgmWUcxngOskTRWuB3oMGTfucT46KR5RcmgIkmS0v76rpbQZ94wAeYWcP1joggF7GWM28QVwmFpMkJgAtm3uTCqtv6ov3XkoB6UtG5gHEoFjrxmWhfpgm3SNuE8mn/43guX35I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721649563; c=relaxed/simple;
	bh=P/xhWjvkOurIQAUdHFphv+ELwI7u0tV8QHMAFEXFaH4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=d5ysgeMV2fCstWRKHRR2MqL2+uxzEbIROlnbbTWGhDhCpHosPJlZBx0aQBHSHxsAsKi9wfV3z3s68CgfGVAJMKfA24wQlO/g+F0P2ypVb4eLFJdwzftVtOYm7hwbbvtP+cgCjX1jvOtrIOoZnsLxFB0y7beABJq7Aci9gIH4Lig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
	by weierstrass.telenet-ops.be (Postfix) with ESMTPS id 4WSJWS1pTWz4x1p6
	for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Jul 2024 13:50:44 +0200 (CEST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:173b:9414:53f5:de4c])
	by michel.telenet-ops.be with bizsmtp
	id qbqc2C00N1wvoRx06bqcKo; Mon, 22 Jul 2024 13:50:37 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sVrYY-002zAq-AZ;
	Mon, 22 Jul 2024 13:50:36 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sVrYq-0020iC-QT;
	Mon, 22 Jul 2024 13:50:36 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v2 10/15] clk: renesas: r8a779f0: Model PLL1/2/3/6 as fractional PLLs
Date: Mon, 22 Jul 2024 13:50:30 +0200
Message-Id: <8544571f507e00ed6fc61617d27c9e19de5e9d11.1721648548.git.geert+renesas@glider.be>
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

Currently, all PLLs are modelled as fixed divider clocks, based on the
state of the mode pins.  However, the boot loader stack may have changed
the actual PLL configuration from the default, leading to incorrect
clock frequencies.

Describe PLL1 as a fixed fractional PLL instead, and PLL2, PLL3, and
PLL6 as variable fractional PLLs.  Note that the R-Car Gen4 clock driver
does not support variable 9.24 PLLs yet, so the driver will downgrade
them to fixed fractional PLLs, too.

Reformat nearby lines to retain a consistent layout.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
v2:
  - Add Reviewed-by.
---
 drivers/clk/renesas/r8a779f0-cpg-mssr.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/renesas/r8a779f0-cpg-mssr.c b/drivers/clk/renesas/r8a779f0-cpg-mssr.c
index 832ba0bacdf02346..b6b6012f71238627 100644
--- a/drivers/clk/renesas/r8a779f0-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a779f0-cpg-mssr.c
@@ -57,12 +57,12 @@ static const struct cpg_core_clk r8a779f0_core_clks[] __initconst = {
 	DEF_INPUT("extalr",	CLK_EXTALR),
 
 	/* Internal Core Clocks */
-	DEF_BASE(".main", CLK_MAIN,	CLK_TYPE_GEN4_MAIN, CLK_EXTAL),
-	DEF_BASE(".pll1", CLK_PLL1,	CLK_TYPE_GEN4_PLL1, CLK_MAIN),
-	DEF_BASE(".pll2", CLK_PLL2,	CLK_TYPE_GEN4_PLL2, CLK_MAIN),
-	DEF_BASE(".pll3", CLK_PLL3,	CLK_TYPE_GEN4_PLL3, CLK_MAIN),
-	DEF_BASE(".pll5", CLK_PLL5,	CLK_TYPE_GEN4_PLL5, CLK_MAIN),
-	DEF_BASE(".pll6", CLK_PLL6,	CLK_TYPE_GEN4_PLL6, CLK_MAIN),
+	DEF_BASE(".main", CLK_MAIN,	CLK_TYPE_GEN4_MAIN,	CLK_EXTAL),
+	DEF_GEN4_PLL_F9_24(".pll1", 1,	CLK_PLL1,		CLK_MAIN),
+	DEF_GEN4_PLL_V9_24(".pll2", 2,	CLK_PLL2,		CLK_MAIN),
+	DEF_GEN4_PLL_V9_24(".pll3", 3,	CLK_PLL3,		CLK_MAIN),
+	DEF_BASE(".pll5", CLK_PLL5,	CLK_TYPE_GEN4_PLL5,	CLK_MAIN),
+	DEF_GEN4_PLL_V9_24(".pll6", 6,	CLK_PLL6,		CLK_MAIN),
 
 	DEF_FIXED(".pll1_div2",	CLK_PLL1_DIV2,	CLK_PLL1,	2, 1),
 	DEF_FIXED(".pll2_div2",	CLK_PLL2_DIV2,	CLK_PLL2,	2, 1),
-- 
2.34.1


