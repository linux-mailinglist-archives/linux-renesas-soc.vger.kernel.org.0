Return-Path: <linux-renesas-soc+bounces-18932-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DCA3BAEE770
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Jun 2025 21:25:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2A898168F4F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Jun 2025 19:25:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6A0A241CB7;
	Mon, 30 Jun 2025 19:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="JeIw4yLf"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F132328AB11
	for <linux-renesas-soc@vger.kernel.org>; Mon, 30 Jun 2025 19:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751311500; cv=none; b=FoThCEMvV5Hh9HfhW/82Mo4E0/r/tIkCJjLHTzhbDHUH+WY049ayI4SVG/I6FItcxw0/Le9CeYJaKwtAelCFRkWjJ9B7O/14v0DMqEIa2yaXWiLN9KkvP+PeED3C4Jy25vkGmzcCJdiiTB7+Vy/K81pJI3rhAio6+TClWirB9sc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751311500; c=relaxed/simple;
	bh=wc4HAFsZ7kIFDm6m43qroHG1q95JfdK3z19LySP5jT8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FPJyXRCG5iG7Q9l/MAKhRt4fLUCTPG1FJXU6xolcCqsoLehUIgnFhsz7aeltSS45Z1uOn2f83CVV0MJG0EdRHd8xqxrfwh7A+UVVTrKHxvkSzpNj4KKxMZWWCwfyYokcdexQTDfooScfeEOMnPEMfiDsOKOxIEo/nwSNR4EdtaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=JeIw4yLf; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=4/LCbwFpzUbKFE
	xOXHgaxctPMbt2oqsv6EgfTa4IgaQ=; b=JeIw4yLfktyfZzUozMP+rsTUGZSmhw
	LESDRpDUksu4daDd0RvJqFolAFrNIcMpCHToMVWaiCEvg0GHMy0NIG4wdBlT4ylU
	c9xcfH87bD1oK/82oFrlwCfUiaYBuZk2wLThbOKrxt9bF9d2/BaQU2wEIyqWy2fH
	WDmZpbvWsR1RTo8WqaA0IRpKD/YA6V6Iy38YCwzSqhuKhPK478EAJNRU5FvL8o/m
	HworXaJL/V8g934bt3B9v21rl0xKRgtmHiIeI0dfjDlCLX8pZiGnAPP+rOEvj6RX
	Zq4jSYPHushIYCb975qZyrFYwYc16UEqwbKh7m5gmS0NU5bveVNbVo4g==
Received: (qmail 2678660 invoked from network); 30 Jun 2025 21:24:44 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 30 Jun 2025 21:24:44 +0200
X-UD-Smtp-Session: l3s3148p1@tiPs+s44zM8gAwDPXyUmAP5FmBXRrw7R
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-clk@vger.kernel.org
Subject: [PATCH] clk: renesas: r9a08g045: Add I3C clocks and resets
Date: Mon, 30 Jun 2025 21:21:31 +0200
Message-ID: <20250630192438.38311-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Extracted from the BSP driver and rebased.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Changes since RFC:
* seperated from larger series
* refactored because pm_domain-array is gone now
* rebased to renesas-drivers as of today

Thanks to Geert for the pointers! Tested on HW.

 drivers/clk/renesas/r9a08g045-cpg.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/clk/renesas/r9a08g045-cpg.c b/drivers/clk/renesas/r9a08g045-cpg.c
index 405907925bb7..93aae270665f 100644
--- a/drivers/clk/renesas/r9a08g045-cpg.c
+++ b/drivers/clk/renesas/r9a08g045-cpg.c
@@ -183,6 +183,7 @@ static const struct cpg_core_clk r9a08g045_core_clks[] __initconst = {
 	DEF_G3S_DIV("P3", R9A08G045_CLK_P3, CLK_PLL3_DIV2_4, DIVPL3C, G3S_DIVPL3C_STS,
 		    dtable_1_32, 0, 0, 0, NULL),
 	DEF_FIXED("P3_DIV2", CLK_P3_DIV2, R9A08G045_CLK_P3, 1, 2),
+	DEF_FIXED("P5", R9A08G045_CLK_P5, CLK_PLL2_DIV2, 1, 4),
 	DEF_FIXED("ZT", R9A08G045_CLK_ZT, CLK_PLL3_DIV2_8, 1, 1),
 	DEF_FIXED("S0", R9A08G045_CLK_S0, CLK_SEL_PLL4, 1, 2),
 	DEF_FIXED("OSC", R9A08G045_OSCCLK, CLK_EXTAL, 1, 1),
@@ -289,6 +290,10 @@ static const struct rzg2l_mod_clk r9a08g045_mod_clks[] = {
 					MSTOP(BUS_MCPU2, BIT(14))),
 	DEF_MOD("tsu_pclk",		R9A08G045_TSU_PCLK, R9A08G045_CLK_TSU, 0x5ac, 0,
 					MSTOP(BUS_MCPU2, BIT(15))),
+	DEF_MOD("i3c_pclk",             R9A08G045_I3C_PCLK, R9A08G045_CLK_TSU, 0x610, 0,
+					MSTOP(BUS_MCPU3, BIT(10))),
+	DEF_MOD("i3c_tclk",             R9A08G045_I3C_TCLK, R9A08G045_CLK_P5, 0x610, 1,
+					MSTOP(BUS_MCPU3, BIT(10))),
 	DEF_MOD("vbat_bclk",		R9A08G045_VBAT_BCLK, R9A08G045_OSCCLK, 0x614, 0,
 					MSTOP(BUS_MCPU3, GENMASK(8, 7))),
 };
@@ -329,6 +334,8 @@ static const struct rzg2l_reset r9a08g045_resets[] = {
 	DEF_RST(R9A08G045_ADC_PRESETN, 0x8a8, 0),
 	DEF_RST(R9A08G045_ADC_ADRST_N, 0x8a8, 1),
 	DEF_RST(R9A08G045_TSU_PRESETN, 0x8ac, 0),
+	DEF_RST(R9A08G045_I3C_TRESETN, 0x910, 0),
+	DEF_RST(R9A08G045_I3C_PRESETN, 0x910, 1),
 	DEF_RST(R9A08G045_VBAT_BRESETN, 0x914, 0),
 };
 
-- 
2.47.2


