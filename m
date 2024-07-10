Return-Path: <linux-renesas-soc+bounces-7236-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FDB692D277
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Jul 2024 15:11:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EBE701F237DE
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Jul 2024 13:11:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7E93192B90;
	Wed, 10 Jul 2024 13:10:59 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from andre.telenet-ops.be (andre.telenet-ops.be [195.130.132.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A75A0192B84
	for <linux-renesas-soc@vger.kernel.org>; Wed, 10 Jul 2024 13:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720617059; cv=none; b=KSlk/gRsAtuKXekDAQYQFzkSMBtl6wfMATQorCcEVbaGqjKVrcM2QFLSPF8Jw/+J4qbaDxCxEb1GjmmZ+rtFdTyq6tbX64IN6Z1Z+/zNVZu+hNuh1oljZXoHsWv4Q8xAyJtgvD1V/8Xi1wi8bvoX0Sr/Yxr38OTPiB65+WGevV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720617059; c=relaxed/simple;
	bh=zhKJU9lI2n+j7C+F3NyNm5ScaKXR2AQ2rCFgT0TUZdc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=QlCDdaszNta7NKY+sm5Q/kZuwpvwgfLTEEJcmuBv0EKpRprJDipq3oDnm00nqJufFbinuaJKX3Cx6ulPRJFwjCnkR9l2gG/hjy5sFgInGuIRtGxXpB1u7qEVuKZ23yfRlcBBq3wKBpApDDDu2qYva0U9iXeNY1Fvqd7YzIN7HOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:2340:18a1:4138:37d2])
	by andre.telenet-ops.be with bizsmtp
	id lpAp2C00R4znMfS01pAptA; Wed, 10 Jul 2024 15:10:50 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sRX5g-001cTq-4q;
	Wed, 10 Jul 2024 15:10:49 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sRX5t-00CQCY-NU;
	Wed, 10 Jul 2024 15:10:49 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 13/14] clk: renesas: rcar-gen4: Remove unused variable PLL2 clock type
Date: Wed, 10 Jul 2024 15:10:47 +0200
Message-Id: <49dee6c1a3f7edd51f501e1a78c32401559637a6.1720616233.git.geert+renesas@glider.be>
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

The variable PLL2 clock type was superseded by the more generic
variable fractional 8.25 PLL clock type, and its sole user was converted.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/clk/renesas/rcar-gen4-cpg.c | 9 ---------
 drivers/clk/renesas/rcar-gen4-cpg.h | 1 -
 2 files changed, 10 deletions(-)

diff --git a/drivers/clk/renesas/rcar-gen4-cpg.c b/drivers/clk/renesas/rcar-gen4-cpg.c
index 440d930dd84c9b49..5fcfd0b4f1216beb 100644
--- a/drivers/clk/renesas/rcar-gen4-cpg.c
+++ b/drivers/clk/renesas/rcar-gen4-cpg.c
@@ -439,15 +439,6 @@ struct clk * __init rcar_gen4_cpg_clk_register(struct device *dev,
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
index a4b972fb85ce73ca..9bca280a924fde13 100644
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


