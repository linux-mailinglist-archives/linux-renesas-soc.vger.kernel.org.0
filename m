Return-Path: <linux-renesas-soc+bounces-7427-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B560938EAA
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jul 2024 13:59:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6CC8B1C212E9
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jul 2024 11:59:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B88B16D4CA;
	Mon, 22 Jul 2024 11:59:24 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from cantor.telenet-ops.be (cantor.telenet-ops.be [195.130.132.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90A3116D32D
	for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Jul 2024 11:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721649564; cv=none; b=UWgdL3KF4LWMRro/jI83ltNV6nYjZNwb1nMGOZrWDajIDxT5W8KNppFMUl2Ia5rzW767SxhUYI60OOxRz3CvDXflV7kCpOHMYGqwq1oMk1khhZPeWTNGaG0N5UHDU8eMu4DZNECecvUBmg6a8V49lcIS6crXLmeGvXT62nCDfsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721649564; c=relaxed/simple;
	bh=1JGBM2c2i0taYR3WRvlCq854iuRTAD2V7HF0ASv/PVw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jLaw4sOlLflRi0GMTa3sISrd4pdB6iqB1a0uf0kP50MM7s4Wbqz4TMdEh3eOY4tcQ+B973W/WlzQqbTwF1Fzk7PAgMsFsDDzRasdBbsS5C69zNrTajMkmjAgRFtmLvuYTSRiXSX0Ull7HcxUK8qqrOdkdk1jlV+0HpF9tC80RmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
	by cantor.telenet-ops.be (Postfix) with ESMTPS id 4WSJWS2hkcz4wxrH
	for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Jul 2024 13:50:44 +0200 (CEST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:173b:9414:53f5:de4c])
	by laurent.telenet-ops.be with bizsmtp
	id qbqd2C0051wvoRx01bqdRA; Mon, 22 Jul 2024 13:50:37 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sVrYY-002zB6-En;
	Mon, 22 Jul 2024 13:50:37 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sVrYq-0020iX-UQ;
	Mon, 22 Jul 2024 13:50:36 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v2 14/15] clk: renesas: rcar-gen4: Remove unused fixed PLL clock types
Date: Mon, 22 Jul 2024 13:50:34 +0200
Message-Id: <c0229eb3518444f61173c6fb83bdcedb058dd079.1721648548.git.geert+renesas@glider.be>
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

All users of the fixed default PLL2/3/4/6 clock types have been
converted to fixed or variable fractional PLL clock types.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
v2:
  - Add Reviewed-by.
---
 drivers/clk/renesas/rcar-gen4-cpg.c | 20 --------------------
 drivers/clk/renesas/rcar-gen4-cpg.h |  4 ----
 2 files changed, 24 deletions(-)

diff --git a/drivers/clk/renesas/rcar-gen4-cpg.c b/drivers/clk/renesas/rcar-gen4-cpg.c
index 2a0f520d56b5aa96..31aa790fd003d45e 100644
--- a/drivers/clk/renesas/rcar-gen4-cpg.c
+++ b/drivers/clk/renesas/rcar-gen4-cpg.c
@@ -440,31 +440,11 @@ struct clk * __init rcar_gen4_cpg_clk_register(struct device *dev,
 		div = cpg_pll_config->pll1_div;
 		break;
 
-	case CLK_TYPE_GEN4_PLL2:
-		mult = cpg_pll_config->pll2_mult;
-		div = cpg_pll_config->pll2_div;
-		break;
-
-	case CLK_TYPE_GEN4_PLL3:
-		mult = cpg_pll_config->pll3_mult;
-		div = cpg_pll_config->pll3_div;
-		break;
-
-	case CLK_TYPE_GEN4_PLL4:
-		mult = cpg_pll_config->pll4_mult;
-		div = cpg_pll_config->pll4_div;
-		break;
-
 	case CLK_TYPE_GEN4_PLL5:
 		mult = cpg_pll_config->pll5_mult;
 		div = cpg_pll_config->pll5_div;
 		break;
 
-	case CLK_TYPE_GEN4_PLL6:
-		mult = cpg_pll_config->pll6_mult;
-		div = cpg_pll_config->pll6_div;
-		break;
-
 	case CLK_TYPE_GEN4_PLL2X_3X:
 		value = readl(base + core->offset);
 		mult = (FIELD_GET(CPG_PLLxCR_STC, value) + 1) * 2;
diff --git a/drivers/clk/renesas/rcar-gen4-cpg.h b/drivers/clk/renesas/rcar-gen4-cpg.h
index 2dadacacf3f911e2..fccc3090c7c34b70 100644
--- a/drivers/clk/renesas/rcar-gen4-cpg.h
+++ b/drivers/clk/renesas/rcar-gen4-cpg.h
@@ -12,12 +12,8 @@
 enum rcar_gen4_clk_types {
 	CLK_TYPE_GEN4_MAIN = CLK_TYPE_CUSTOM,
 	CLK_TYPE_GEN4_PLL1,
-	CLK_TYPE_GEN4_PLL2,
 	CLK_TYPE_GEN4_PLL2X_3X,	/* r8a779a0 only */
-	CLK_TYPE_GEN4_PLL3,
-	CLK_TYPE_GEN4_PLL4,
 	CLK_TYPE_GEN4_PLL5,
-	CLK_TYPE_GEN4_PLL6,
 	CLK_TYPE_GEN4_PLL_F8_25,	/* Fixed fractional 8.25 PLL */
 	CLK_TYPE_GEN4_PLL_V8_25,	/* Variable fractional 8.25 PLL */
 	CLK_TYPE_GEN4_PLL_F9_24,	/* Fixed fractional 9.24 PLL */
-- 
2.34.1


