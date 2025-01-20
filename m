Return-Path: <linux-renesas-soc+bounces-12251-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 75D76A169D4
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Jan 2025 10:47:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9359E3A1AAB
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Jan 2025 09:47:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E483D1AD403;
	Mon, 20 Jan 2025 09:47:38 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86C1318801A;
	Mon, 20 Jan 2025 09:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737366458; cv=none; b=YP3yi8A1ZpTTLrxNPwku0446CriJQ+r6wit/BPrY44XsvNFKKkuIlib/PGXX8EfgxajtfNIbTuPq1QzM5lteol0QPsjoGYWOD8MKmAI2aKR4mwXuo6bnrrE/eYexcSiX7TTMRbAmxQF/fAM6rPO+X42+VXNvzDa5LpbUX2o997I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737366458; c=relaxed/simple;
	bh=JrbtD0vBIbLl5U2RyhYOoEGtx0OzrIDMmcztLwqcstg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KgrOUO5XhmhEpk28vwBuYyl0qx+8k20j4A+6vg6aoIsAE5udSF9du4PPDPpP0yoRTWyGankkqOM1wkJcCJATvjKqpaJeyk2fBAvbixkrfAA2kNnUPfsk2NH1cWkrn501ttIROiM/HCvBg3VraaMWe0ftX68JEfGDAlA/IwUD9xQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: LQedulZPSLS9TD3QpIsG2A==
X-CSE-MsgGUID: FdDv2ackRjGQ4Mz4IUg+fQ==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 20 Jan 2025 18:47:29 +0900
Received: from localhost.localdomain (unknown [10.226.92.210])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 045BB4017D72;
	Mon, 20 Jan 2025 18:47:25 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH 02/11] clk: renesas: r9a09g047: Add ICU clock/reset
Date: Mon, 20 Jan 2025 09:46:58 +0000
Message-ID: <20250120094715.25802-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250120094715.25802-1-biju.das.jz@bp.renesas.com>
References: <20250120094715.25802-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add ICU clock and reset entries.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/clk/renesas/r9a09g047-cpg.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/clk/renesas/r9a09g047-cpg.c b/drivers/clk/renesas/r9a09g047-cpg.c
index 1886eab9ef9e..1181e7b605e8 100644
--- a/drivers/clk/renesas/r9a09g047-cpg.c
+++ b/drivers/clk/renesas/r9a09g047-cpg.c
@@ -90,6 +90,8 @@ static const struct cpg_core_clk r9a09g047_core_clks[] __initconst = {
 };
 
 static const struct rzv2h_mod_clk r9a09g047_mod_clks[] __initconst = {
+	DEF_MOD_CRITICAL("icu_0_pclk_i",	CLK_PLLCM33_DIV16, 0, 5, 0, 5,
+						BUS_MSTOP_NONE),
 	DEF_MOD_CRITICAL("gic_0_gicclk",	CLK_PLLDTY_ACPU_DIV4, 1, 3, 0, 19,
 						BUS_MSTOP(3, BIT(5))),
 	DEF_MOD("wdt_1_clkp",			CLK_PLLCLN_DIV16, 4, 13, 2, 13,
@@ -128,6 +130,7 @@ static const struct rzv2h_mod_clk r9a09g047_mod_clks[] __initconst = {
 
 static const struct rzv2h_reset r9a09g047_resets[] __initconst = {
 	DEF_RST(3, 0, 1, 1),		/* SYS_0_PRESETN */
+	DEF_RST(3, 6, 1, 7),		/* ICU_0_PRESETN_I */
 	DEF_RST(3, 8, 1, 9),		/* GIC_0_GICRESET_N */
 	DEF_RST(3, 9, 1, 10),		/* GIC_0_DBG_GICRESET_N */
 	DEF_RST(7, 6, 3, 7),		/* WDT_1_RESET */
-- 
2.43.0


