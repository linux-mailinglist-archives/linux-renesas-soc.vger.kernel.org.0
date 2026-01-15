Return-Path: <linux-renesas-soc+bounces-26854-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 90CE8D2493F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 Jan 2026 13:42:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 526A33002D2C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 Jan 2026 12:37:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2FA5396B66;
	Thu, 15 Jan 2026 12:37:00 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8FA135F8B1;
	Thu, 15 Jan 2026 12:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768480620; cv=none; b=h4BINgcg/hqmmzrd1jmLxSJE6mL7nPJf7p/kqFcJx73uAO01fC4F+4bZXe22IRi+cpf+BtuU2Tt1o+HfIYejpGGbRXtFTGCUlkaJ7nD/wxy2zHwrrVl43l+JhOjz0+J04kdHZCFCInqUZ3VqkJ8BLcfqDau1jhNdu1TOsvRq/Zo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768480620; c=relaxed/simple;
	bh=15WchRST5fUvoZ+2mpjDsOpXIUZ0v0VFuSJBeEUdmRE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DG9//VMpltVHmykPbhhnd/tqk+NlZoSUGN9+cU3TJU8WSao6GLSLsMo5shrCXEoThkSxKp2+wCV1LdfEQ9xxa+P4IjHULuiyzhuc8lNMGfywQR+WgPFVPeQuCE669rDmU+9wjPP3Ka3FY77y8oPZ60aU+U3ka7yVN6vgSyU9H9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D301C116D0;
	Thu, 15 Jan 2026 12:36:59 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] clk: renesas: Add missing log message terminators
Date: Thu, 15 Jan 2026 13:36:56 +0100
Message-ID: <cd0b3624066b80ed0bb00d489c99e2c1a06d755f.1768480559.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Complete printed messages should be terminated by newline characters.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in renesas-clk for v6.20.
---
 drivers/clk/renesas/clk-vbattb.c       | 4 ++--
 drivers/clk/renesas/renesas-cpg-mssr.c | 2 +-
 drivers/clk/renesas/rzg2l-cpg.c        | 6 +++---
 drivers/clk/renesas/rzv2h-cpg.c        | 6 +++---
 4 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/clk/renesas/clk-vbattb.c b/drivers/clk/renesas/clk-vbattb.c
index ff9d1ead455c3848..2a961775b1d86dda 100644
--- a/drivers/clk/renesas/clk-vbattb.c
+++ b/drivers/clk/renesas/clk-vbattb.c
@@ -69,11 +69,11 @@ static void vbattb_clk_action(void *data)
 
 	ret = reset_control_assert(rstc);
 	if (ret)
-		dev_err(dev, "Failed to de-assert reset!");
+		dev_err(dev, "Failed to de-assert reset!\n");
 
 	ret = pm_runtime_put_sync(dev);
 	if (ret < 0)
-		dev_err(dev, "Failed to runtime suspend!");
+		dev_err(dev, "Failed to runtime suspend!\n");
 
 	of_clk_del_provider(dev->of_node);
 }
diff --git a/drivers/clk/renesas/renesas-cpg-mssr.c b/drivers/clk/renesas/renesas-cpg-mssr.c
index fad3d0cf84e4f2ea..4824607d56c0886a 100644
--- a/drivers/clk/renesas/renesas-cpg-mssr.c
+++ b/drivers/clk/renesas/renesas-cpg-mssr.c
@@ -404,7 +404,7 @@ struct clk *cpg_mssr_clk_src_twocell_get(struct of_phandle_args *clkspec,
 	}
 
 	if (IS_ERR(clk))
-		dev_err(dev, "Cannot get %s clock %u: %ld", type, clkidx,
+		dev_err(dev, "Cannot get %s clock %u: %ld\n", type, clkidx,
 		       PTR_ERR(clk));
 	else
 		dev_dbg(dev, "clock (%u, %u) is %pC at %lu Hz\n",
diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
index 52160a75fa2f0668..bd35cd037b7b0080 100644
--- a/drivers/clk/renesas/rzg2l-cpg.c
+++ b/drivers/clk/renesas/rzg2l-cpg.c
@@ -979,7 +979,7 @@ static int rzg2l_cpg_sipll5_set_rate(struct clk_hw *hw,
 	ret = readl_poll_timeout(priv->base + CPG_SIPLL5_MON, val,
 				 !(val & CPG_SIPLL5_MON_PLL5_LOCK), 100, 250000);
 	if (ret) {
-		dev_err(priv->dev, "failed to release pll5 lock");
+		dev_err(priv->dev, "failed to release pll5 lock\n");
 		return ret;
 	}
 
@@ -1006,7 +1006,7 @@ static int rzg2l_cpg_sipll5_set_rate(struct clk_hw *hw,
 	ret = readl_poll_timeout(priv->base + CPG_SIPLL5_MON, val,
 				 (val & CPG_SIPLL5_MON_PLL5_LOCK), 100, 250000);
 	if (ret) {
-		dev_err(priv->dev, "failed to lock pll5");
+		dev_err(priv->dev, "failed to lock pll5\n");
 		return ret;
 	}
 
@@ -1214,7 +1214,7 @@ static struct clk
 	}
 
 	if (IS_ERR(clk))
-		dev_err(dev, "Cannot get %s clock %u: %ld", type, clkidx,
+		dev_err(dev, "Cannot get %s clock %u: %ld\n", type, clkidx,
 			PTR_ERR(clk));
 	else
 		dev_dbg(dev, "clock (%u, %u) is %pC at %lu Hz\n",
diff --git a/drivers/clk/renesas/rzv2h-cpg.c b/drivers/clk/renesas/rzv2h-cpg.c
index 1db92284025e25b9..f6c47fb89bca5918 100644
--- a/drivers/clk/renesas/rzv2h-cpg.c
+++ b/drivers/clk/renesas/rzv2h-cpg.c
@@ -602,7 +602,7 @@ static int rzv2h_cpg_pll_set_rate(struct pll_clk *pll_clk,
 					val, !(val & CPG_PLL_MON_LOCK),
 					100, 2000);
 	if (ret) {
-		dev_err(priv->dev, "Failed to put PLLDSI into standby mode");
+		dev_err(priv->dev, "Failed to put PLLDSI into standby mode\n");
 		return ret;
 	}
 
@@ -630,7 +630,7 @@ static int rzv2h_cpg_pll_set_rate(struct pll_clk *pll_clk,
 					val, (val & CPG_PLL_MON_LOCK),
 					100, 2000);
 	if (ret) {
-		dev_err(priv->dev, "Failed to put PLLDSI into normal mode");
+		dev_err(priv->dev, "Failed to put PLLDSI into normal mode\n");
 		return ret;
 	}
 
@@ -1013,7 +1013,7 @@ static struct clk
 	}
 
 	if (IS_ERR(clk))
-		dev_err(dev, "Cannot get %s clock %u: %ld", type, clkidx,
+		dev_err(dev, "Cannot get %s clock %u: %ld\n", type, clkidx,
 			PTR_ERR(clk));
 	else
 		dev_dbg(dev, "clock (%u, %u) is %pC at %lu Hz\n",
-- 
2.43.0


