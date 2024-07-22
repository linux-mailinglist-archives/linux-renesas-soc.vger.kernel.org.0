Return-Path: <linux-renesas-soc+bounces-7421-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DCF6938EA0
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jul 2024 13:59:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 19B69281DF5
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jul 2024 11:59:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C346316D33B;
	Mon, 22 Jul 2024 11:59:20 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from gauss.telenet-ops.be (gauss.telenet-ops.be [195.130.132.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41B8116D31C
	for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Jul 2024 11:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721649560; cv=none; b=OkhGYH1+YDCMPH0Bx5z8rtN3Ht7yB/w7et0lgg+2ZhH7oTPRf5pI9H+1w9iivOHXS9sWySVoJzpg2cpFwNwnUU54xdvwgwbcyydxjJ3CvQInCJXSjqrelYWlYg+aRNJepWF8+G9LcIbZDZA8psyBNugjsmk8ZXpWrzIPZENqasI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721649560; c=relaxed/simple;
	bh=1Yug8lHPPTuzb3Pq9pkj29n9wIVWSnzJy0Viupj0t3U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rJaj/byIrbVaIN5uMWqB8vBM6Uf9j1UYZFoXH7YWiQG66NpzntGDny85R87pDfwRn1jHulgiGosSIWp3yYxD4CVcbDcncLcX7Q2fCF4DumyiLsQKzGk+yW0DEoBWxq6UNDctJviC8HT/rnA/H1R2ldLW+XjM5vSea/Rw0My/2WA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
	by gauss.telenet-ops.be (Postfix) with ESMTPS id 4WSJWS2kLXz4x1pn
	for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Jul 2024 13:50:44 +0200 (CEST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:173b:9414:53f5:de4c])
	by laurent.telenet-ops.be with bizsmtp
	id qbqc2C00P1wvoRx01bqcR4; Mon, 22 Jul 2024 13:50:37 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sVrYY-002zAI-4D;
	Mon, 22 Jul 2024 13:50:36 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sVrYq-0020he-Kh;
	Mon, 22 Jul 2024 13:50:36 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v2 03/15] clk: renesas: rcar-gen4: Use FIELD_GET()
Date: Mon, 22 Jul 2024 13:50:23 +0200
Message-Id: <fb19ad829738f02effa340fa04c178a162d41202.1721648548.git.geert+renesas@glider.be>
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

Improve readability by using the FIELD_GET() helper instead of
open-coding the same operation, and by adding field definitions to get
rid of hardcoded values.

While at it, move register definitions that are only used inside the
rcar-gen4-cpg.c source file out of the rcar-gen4-cpg.h header file.
Add a "CPG_" prefix to SD0CKCR1.  Add comments where appropriate.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
v2:
  - Add Reviewed-by.
---
 drivers/clk/renesas/rcar-gen4-cpg.c | 13 +++++++++++--
 drivers/clk/renesas/rcar-gen4-cpg.h |  3 ---
 2 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/renesas/rcar-gen4-cpg.c b/drivers/clk/renesas/rcar-gen4-cpg.c
index cd8799e04b37556e..ae18470d9732ec3a 100644
--- a/drivers/clk/renesas/rcar-gen4-cpg.c
+++ b/drivers/clk/renesas/rcar-gen4-cpg.c
@@ -55,6 +55,14 @@ static u32 cpg_mode __initdata;
 /* Fractional 8.25 PLL */
 #define CPG_PLLxCR0_NI8		GENMASK(27, 20)	/* Integer mult. factor */
 
+#define CPG_PLLxCR_STC		GENMASK(30, 24)	/* R_Car V3U PLLxCR */
+
+#define CPG_RPCCKCR		0x874	/* RPC Clock Freq. Control Register */
+
+#define CPG_SD0CKCR1		0x8a4	/* SD-IF0 Clock Freq. Control Reg. 1 */
+
+#define CPG_SD0CKCR1_SDSRC_SEL	GENMASK(30, 29)	/* SDSRC clock freq. select */
+
 /* PLL Clocks */
 struct cpg_pll_clk {
 	struct clk_hw hw;
@@ -392,7 +400,7 @@ struct clk * __init rcar_gen4_cpg_clk_register(struct device *dev,
 
 	case CLK_TYPE_GEN4_PLL2X_3X:
 		value = readl(base + core->offset);
-		mult = (((value >> 24) & 0x7f) + 1) * 2;
+		mult = (FIELD_GET(CPG_PLLxCR_STC, value) + 1) * 2;
 		break;
 
 	case CLK_TYPE_GEN4_Z:
@@ -400,7 +408,8 @@ struct clk * __init rcar_gen4_cpg_clk_register(struct device *dev,
 					  base, core->div, core->offset);
 
 	case CLK_TYPE_GEN4_SDSRC:
-		div = ((readl(base + SD0CKCR1) >> 29) & 0x03) + 4;
+		value = readl(base + CPG_SD0CKCR1);
+		div = FIELD_GET(CPG_SD0CKCR1_SDSRC_SEL, value) + 4;
 		break;
 
 	case CLK_TYPE_GEN4_SDH:
diff --git a/drivers/clk/renesas/rcar-gen4-cpg.h b/drivers/clk/renesas/rcar-gen4-cpg.h
index 006537e29e4eb10e..d0329ac84730d681 100644
--- a/drivers/clk/renesas/rcar-gen4-cpg.h
+++ b/drivers/clk/renesas/rcar-gen4-cpg.h
@@ -67,9 +67,6 @@ struct rcar_gen4_cpg_pll_config {
 	u8 osc_prediv;
 };
 
-#define CPG_RPCCKCR	0x874
-#define SD0CKCR1	0x8a4
-
 struct clk *rcar_gen4_cpg_clk_register(struct device *dev,
 	const struct cpg_core_clk *core, const struct cpg_mssr_info *info,
 	struct clk **clks, void __iomem *base,
-- 
2.34.1


