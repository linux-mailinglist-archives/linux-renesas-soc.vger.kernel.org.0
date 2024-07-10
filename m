Return-Path: <linux-renesas-soc+bounces-7237-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BB84E92D27A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Jul 2024 15:11:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 416B3B22512
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Jul 2024 13:11:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8ED6192B72;
	Wed, 10 Jul 2024 13:10:59 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [195.130.132.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88B7A192B65
	for <linux-renesas-soc@vger.kernel.org>; Wed, 10 Jul 2024 13:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720617059; cv=none; b=NVCbl+1AuOCSlUxyk9tgSR7qB8mvWCc0lrwx65iiiajRWIClYfRaOjpEx8OXqAdzsx3ShRFXPy1odqudNIaZ+dTqBwPu5V96CWxlSlU5M1bPejeqEb7q9DkGafi8jeh7yE7M31hInc3R2ARwYjDp3R2wjFMHhHS0K9J7BqJs/fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720617059; c=relaxed/simple;
	bh=qc9jySmhbhghor/UZ/lBr/egEY0xGdfx8JHomyvn0FA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Ll6h6m5FHkoFqvVck0PpG9kZa4/oavP0Jy010gHODEZPg25RzUQW47n4eeCqbqLEXsLqbGO74DYUSNZCevPh2lSCp0dTfXjLPC/KwlHgTQamZ9E3euJqYp5kbbs/nhTxHzBWNJh3pSWE1wd5zcxw9B/EnQ4dRSjadJ1QoPzr718=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:2340:18a1:4138:37d2])
	by baptiste.telenet-ops.be with bizsmtp
	id lpAp2C00k4znMfS01pApdG; Wed, 10 Jul 2024 15:10:50 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sRX5g-001cTs-5q;
	Wed, 10 Jul 2024 15:10:49 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sRX5t-00CQCd-Ok;
	Wed, 10 Jul 2024 15:10:49 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 14/14] clk: renesas: rcar-gen4: Remove unused fixed PLL clock types
Date: Wed, 10 Jul 2024 15:10:48 +0200
Message-Id: <ac9ec7b9b9bb1ea4c82cf1420448aec776bb7876.1720616233.git.geert+renesas@glider.be>
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

All users of the fixed default PLL2/3/4/6 clock types have been
converted to fixed or variable fractional PLL clock types.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/clk/renesas/rcar-gen4-cpg.c | 20 --------------------
 drivers/clk/renesas/rcar-gen4-cpg.h |  4 ----
 2 files changed, 24 deletions(-)

diff --git a/drivers/clk/renesas/rcar-gen4-cpg.c b/drivers/clk/renesas/rcar-gen4-cpg.c
index 5fcfd0b4f1216beb..b180ca286c913c6c 100644
--- a/drivers/clk/renesas/rcar-gen4-cpg.c
+++ b/drivers/clk/renesas/rcar-gen4-cpg.c
@@ -439,31 +439,11 @@ struct clk * __init rcar_gen4_cpg_clk_register(struct device *dev,
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
index 9bca280a924fde13..13f4ae28c5041433 100644
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


