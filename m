Return-Path: <linux-renesas-soc+bounces-18083-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EB10AD505B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Jun 2025 11:43:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A296A188C97A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Jun 2025 09:40:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1F99261399;
	Wed, 11 Jun 2025 09:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="VjkGlXqm"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEB4B226D19
	for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Jun 2025 09:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749634801; cv=none; b=cqhX4OpDY2j6RcTG88KGnw9SViw+SOO0rzP14Yysdjzc9WH66ofTR9LaTw2ox46WNyAg+T+PkRsfaaxHnD8xdN9XVbu1KWk5h6oF5LsSjuWzwLKTlNrXT2CO9DDG6EwEq5n7oJBy6Sv5h5Nff1aTNjh9Y4OiJhh28zZRe/SLIi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749634801; c=relaxed/simple;
	bh=pQYo6ovR3DBPpdHuYfK3v9t9eXeVeMCOvv4inlO6fQ8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b/GdAKXm7GiPMJSuu4aRDyTaHxNr4e3utqqSYNnBX18zAfxCElWAOzFYEymOdQS+tAxl9av5LfEfdelU7DvugopBS8vEwG2zeGfoM0iCI0bT1FRxi03cDmOWTZiicsnYeUFi01euhEj98w7+7pNqEea03+OXk0RzfKasOvQUyzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=VjkGlXqm; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=EOK1t9YISoD6SwTepOMJT3MGWUQV/XDy2VUzPb1GX4Q=; b=VjkGlX
	qm//gYB2LmUVc8RCs+hujDN+rULQSZIkytx46n5oR+nQdv7elXDHZL7BnhmN7tK2
	N224S4PXy5jNqaCHKce/VERaHoGJoSaFHaZWW287yUMMXSdLEd9zJMTg/PLclKCq
	s6/hVjQR+VxIde5VHxQnrUQguCgXs+i6LM16vOJklppXtSonRAIhk+Rko4/fUx3e
	NFV2cnYvajrraAvm8POzCtQRtACchgC3cdwCFFCtZYqulHKOrQOG7BPYDqqpQQje
	igDZp4C90M5QCYcBpqqJi0v9AFu7KsrpoRMgOqN8vGgGLgFit6LY+/bJVONdIuj0
	5bzagYw+z2btuLZg==
Received: (qmail 3186350 invoked from network); 11 Jun 2025 11:39:49 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 11 Jun 2025 11:39:49 +0200
X-UD-Smtp-Session: l3s3148p1@Yl0WmEg34rAgAwDPXy2/ACpZfVCNKldR
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-clk@vger.kernel.org
Subject: [PATCH RFC 1/7] clk: renesas: r9a08g045: Add I3C clocks, resets and power domain
Date: Wed, 11 Jun 2025 11:39:25 +0200
Message-ID: <20250611093934.4208-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250611093934.4208-1-wsa+renesas@sang-engineering.com>
References: <20250611093934.4208-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Clocks extracted from the BSP driver and rebased. Power domain handling
added by Claudiu.

Co-developed-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/clk/renesas/r9a08g045-cpg.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/clk/renesas/r9a08g045-cpg.c b/drivers/clk/renesas/r9a08g045-cpg.c
index 4035f3443598..afc23bb25181 100644
--- a/drivers/clk/renesas/r9a08g045-cpg.c
+++ b/drivers/clk/renesas/r9a08g045-cpg.c
@@ -189,6 +189,7 @@ static const struct cpg_core_clk r9a08g045_core_clks[] __initconst = {
 	DEF_FIXED("OSC2", R9A08G045_OSCCLK2, CLK_EXTAL, 1, 3),
 	DEF_FIXED("HP", R9A08G045_CLK_HP, CLK_PLL6, 1, 2),
 	DEF_FIXED("TSU", R9A08G045_CLK_TSU, CLK_PLL2_DIV2, 1, 8),
+	DEF_FIXED("P5", R9A08G045_CLK_P5, CLK_PLL2_DIV2, 1, 4),
 };
 
 static const struct rzg2l_mod_clk r9a08g045_mod_clks[] = {
@@ -243,6 +244,8 @@ static const struct rzg2l_mod_clk r9a08g045_mod_clks[] = {
 	DEF_MOD("adc_adclk",		R9A08G045_ADC_ADCLK, R9A08G045_CLK_TSU, 0x5a8, 0),
 	DEF_MOD("adc_pclk",		R9A08G045_ADC_PCLK, R9A08G045_CLK_TSU, 0x5a8, 1),
 	DEF_MOD("tsu_pclk",		R9A08G045_TSU_PCLK, R9A08G045_CLK_TSU, 0x5ac, 0),
+	DEF_MOD("i3c_pclk",		R9A08G045_I3C_PCLK, R9A08G045_CLK_TSU, 0x610, 0),
+	DEF_MOD("i3c_tclk",		R9A08G045_I3C_TCLK, R9A08G045_CLK_P5, 0x610, 1),
 	DEF_MOD("vbat_bclk",		R9A08G045_VBAT_BCLK, R9A08G045_OSCCLK, 0x614, 0),
 };
 
@@ -282,6 +285,8 @@ static const struct rzg2l_reset r9a08g045_resets[] = {
 	DEF_RST(R9A08G045_ADC_PRESETN, 0x8a8, 0),
 	DEF_RST(R9A08G045_ADC_ADRST_N, 0x8a8, 1),
 	DEF_RST(R9A08G045_TSU_PRESETN, 0x8ac, 0),
+	DEF_RST(R9A08G045_I3C_TRESETN, 0x910, 0),
+	DEF_RST(R9A08G045_I3C_PRESETN, 0x910, 1),
 	DEF_RST(R9A08G045_VBAT_BRESETN, 0x914, 0),
 };
 
@@ -358,6 +363,8 @@ static const struct rzg2l_cpg_pm_domain_init_data r9a08g045_pm_domains[] = {
 				DEF_REG_CONF(CPG_BUS_MCPU2_MSTOP, BIT(14)), 0),
 	DEF_PD("tsu",		R9A08G045_PD_TSU,
 				DEF_REG_CONF(CPG_BUS_MCPU2_MSTOP, BIT(15)), 0),
+	DEF_PD("i3c",		R9A08G045_PD_I3C,
+				DEF_REG_CONF(CPG_BUS_MCPU3_MSTOP, BIT(10)), 0),
 	DEF_PD("vbat",		R9A08G045_PD_VBAT,
 				DEF_REG_CONF(CPG_BUS_MCPU3_MSTOP, BIT(8)),
 				GENPD_FLAG_ALWAYS_ON),
-- 
2.47.2


