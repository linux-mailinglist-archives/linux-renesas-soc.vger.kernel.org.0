Return-Path: <linux-renesas-soc+bounces-7409-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F3C0938E56
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jul 2024 13:50:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C022A1F21D7E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jul 2024 11:50:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38713288B5;
	Mon, 22 Jul 2024 11:50:47 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [195.130.132.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85D0116D308
	for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Jul 2024 11:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721649047; cv=none; b=cWHLE4Oz12pbfsd7RgNnR93SqMiFtIagS4ZshB11WO5MmQteDINQ8SfadkCYqgRLwpMx+M6fFsTNXyq82bWYquHWvqtPDZtDV8rINm8m1fzB0tTpX+HCAwOeP/8CmxW0X+t4cpnwMa2FZ/4TxK3Nn22L7t+pP+W1mcOuIeUJqXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721649047; c=relaxed/simple;
	bh=z17gZ01wDDMdBg4K87TjRj6f7/4kfXUvn2XGiqCD1QY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=c8TC4xMQBtA4aSvg/FXYTNOhI98QOoDT/cUH4zucbHFE3lwTc3AOrO8QCl5BjsgtuZCwZZ77fKWg1z6VW7jfMEmu8clRO40k+igqxgK0p9aoujmtSbwDHxHdmQ2aFLSznmHwPcLCjNYvK02FpGdUhylY+74OApioajf6ayKTu98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:173b:9414:53f5:de4c])
	by xavier.telenet-ops.be with bizsmtp
	id qbqd2C0021wvoRx01bqd6R; Mon, 22 Jul 2024 13:50:37 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sVrYY-002zB3-E8;
	Mon, 22 Jul 2024 13:50:37 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sVrYq-0020iS-Tf;
	Mon, 22 Jul 2024 13:50:36 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v2 13/15] clk: renesas: rcar-gen4: Remove unused variable PLL2 clock type
Date: Mon, 22 Jul 2024 13:50:33 +0200
Message-Id: <8e5564958002351f29435f63de1304fb3b51a725.1721648548.git.geert+renesas@glider.be>
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

The variable PLL2 clock type was superseded by the more generic
variable fractional 8.25 PLL clock type, and its sole user was converted.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
v2:
  - Add Reviewed-by.
---
 drivers/clk/renesas/rcar-gen4-cpg.c | 9 ---------
 drivers/clk/renesas/rcar-gen4-cpg.h | 1 -
 2 files changed, 10 deletions(-)

diff --git a/drivers/clk/renesas/rcar-gen4-cpg.c b/drivers/clk/renesas/rcar-gen4-cpg.c
index d3db602d7c5ec617..2a0f520d56b5aa96 100644
--- a/drivers/clk/renesas/rcar-gen4-cpg.c
+++ b/drivers/clk/renesas/rcar-gen4-cpg.c
@@ -440,15 +440,6 @@ struct clk * __init rcar_gen4_cpg_clk_register(struct device *dev,
 		div = cpg_pll_config->pll1_div;
 		break;
 
-	case CLK_TYPE_GEN4_PLL2_VAR:
-		/*
-		 * PLL2 is implemented as a custom clock, to change the
-		 * multiplier when cpufreq changes between normal and boost
-		 * modes.
-		 */
-		return cpg_pll_clk_register(core->name, __clk_get_name(parent),
-					    base, 2, &cpg_pll_v8_25_clk_ops);
-
 	case CLK_TYPE_GEN4_PLL2:
 		mult = cpg_pll_config->pll2_mult;
 		div = cpg_pll_config->pll2_div;
diff --git a/drivers/clk/renesas/rcar-gen4-cpg.h b/drivers/clk/renesas/rcar-gen4-cpg.h
index 80a455e62cc1321e..2dadacacf3f911e2 100644
--- a/drivers/clk/renesas/rcar-gen4-cpg.h
+++ b/drivers/clk/renesas/rcar-gen4-cpg.h
@@ -13,7 +13,6 @@ enum rcar_gen4_clk_types {
 	CLK_TYPE_GEN4_MAIN = CLK_TYPE_CUSTOM,
 	CLK_TYPE_GEN4_PLL1,
 	CLK_TYPE_GEN4_PLL2,
-	CLK_TYPE_GEN4_PLL2_VAR,
 	CLK_TYPE_GEN4_PLL2X_3X,	/* r8a779a0 only */
 	CLK_TYPE_GEN4_PLL3,
 	CLK_TYPE_GEN4_PLL4,
-- 
2.34.1


