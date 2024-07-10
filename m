Return-Path: <linux-renesas-soc+bounces-7231-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5552892D26B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Jul 2024 15:11:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0BEE0282146
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Jul 2024 13:11:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 311C4192B75;
	Wed, 10 Jul 2024 13:10:56 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from albert.telenet-ops.be (albert.telenet-ops.be [195.130.137.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16925192B60
	for <linux-renesas-soc@vger.kernel.org>; Wed, 10 Jul 2024 13:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.90
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720617056; cv=none; b=Lq6Xmx0pyhr4oIK8O+DAv/Rm9jg05g+tDqW67v3EzUFCyXBsLwNKS9DP3MP1+0sdjpHYhECyEpRn7Z8Fm2vt0y+oNxEuC4uWVtLe2Qie4SCHhsiv3i/5mRq6OX9m818IU9hcARtncNG9nBUCZpmjH10GHBMB94pjY+y2ASCCdhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720617056; c=relaxed/simple;
	bh=OLVknDlcrWAB/aMne/cvuZ4AR5RKu8Xn+57H+CXQqv8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=TSoBTLeug6whIK4hB0wqZeeMsO3pCooFMHGwim5Oe/RZo15sth2IjZF7B9eNO8WH9H4V5afvks62YLvh3MZLSQyia+G5GZp8nzAH46eXgSFgGorDpezY61SxkBe9Sbg+BrpgWuIK0OMU2OTJoSuuiPHq3qGlkpzkbch+uDb9Ios=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:2340:18a1:4138:37d2])
	by albert.telenet-ops.be with bizsmtp
	id lpAp2C00N4znMfS06pApDK; Wed, 10 Jul 2024 15:10:50 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sRX5g-001cTi-2X;
	Wed, 10 Jul 2024 15:10:49 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sRX5t-00CQCP-LU;
	Wed, 10 Jul 2024 15:10:49 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 11/14] clk: renesas: r8a779g0: Model PLL1/3/4/6 as fractional PLLs
Date: Wed, 10 Jul 2024 15:10:45 +0200
Message-Id: <6a85b1285e9457de6fb257fc1f9b2f8c93380d55.1720616233.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1720616233.git.geert+renesas@glider.be>
References: <cover.1720616233.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, all PLLs but PLL2 are modelled as fixed divider clocks, based
on the state of the mode pins.  However, the boot loader stack may have
changed the actual PLL configuration from the default, leading to
incorrect clock frequencies.

Describe PLL1 as a fixed fractional PLL instead, and PLL2, PLL3, PLL4,
and PLL6 as variable fractional PLLs.

Reformat nearby lines to retain a consistent layout.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/clk/renesas/r8a779g0-cpg-mssr.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/renesas/r8a779g0-cpg-mssr.c b/drivers/clk/renesas/r8a779g0-cpg-mssr.c
index 3c13645f45871700..9e65f311c35dc834 100644
--- a/drivers/clk/renesas/r8a779g0-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a779g0-cpg-mssr.c
@@ -66,13 +66,13 @@ static const struct cpg_core_clk r8a779g0_core_clks[] __initconst = {
 	DEF_INPUT("extalr",	CLK_EXTALR),
 
 	/* Internal Core Clocks */
-	DEF_BASE(".main", CLK_MAIN,	CLK_TYPE_GEN4_MAIN,     CLK_EXTAL),
-	DEF_BASE(".pll1", CLK_PLL1,	CLK_TYPE_GEN4_PLL1,     CLK_MAIN),
-	DEF_BASE(".pll2", CLK_PLL2,	CLK_TYPE_GEN4_PLL2_VAR, CLK_MAIN),
-	DEF_BASE(".pll3", CLK_PLL3,	CLK_TYPE_GEN4_PLL3,     CLK_MAIN),
-	DEF_BASE(".pll4", CLK_PLL4,	CLK_TYPE_GEN4_PLL4,     CLK_MAIN),
-	DEF_BASE(".pll5", CLK_PLL5,	CLK_TYPE_GEN4_PLL5,     CLK_MAIN),
-	DEF_BASE(".pll6", CLK_PLL6,	CLK_TYPE_GEN4_PLL6,     CLK_MAIN),
+	DEF_BASE(".main", CLK_MAIN,	CLK_TYPE_GEN4_MAIN,	CLK_EXTAL),
+	DEF_GEN4_PLL_F8_25(".pll1", 1,	CLK_PLL1,		CLK_MAIN),
+	DEF_GEN4_PLL_V8_25(".pll2", 2,	CLK_PLL2,		CLK_MAIN),
+	DEF_GEN4_PLL_V8_25(".pll3", 3,	CLK_PLL3,		CLK_MAIN),
+	DEF_GEN4_PLL_V8_25(".pll4", 4,	CLK_PLL4,		CLK_MAIN),
+	DEF_BASE(".pll5", CLK_PLL5,	CLK_TYPE_GEN4_PLL5,	CLK_MAIN),
+	DEF_GEN4_PLL_V8_25(".pll6", 6,	CLK_PLL6,		CLK_MAIN),
 
 	DEF_FIXED(".pll1_div2",	CLK_PLL1_DIV2,	CLK_PLL1,	2, 1),
 	DEF_FIXED(".pll2_div2",	CLK_PLL2_DIV2,	CLK_PLL2,	2, 1),
-- 
2.34.1


