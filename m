Return-Path: <linux-renesas-soc+bounces-11285-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 66D5A9F0C78
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Dec 2024 13:37:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 12EE9188DB69
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Dec 2024 12:37:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C76081DFD8D;
	Fri, 13 Dec 2024 12:36:17 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DDDE1DFD87;
	Fri, 13 Dec 2024 12:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734093377; cv=none; b=CLfXO1Q+tOU5GrGUjwtgKYxSEseXtueyMhAUI2yCkIUOU9YrywJFgiNk6k1r92pxJ9/DunsrFUrdhuBYFbX+oH+IT0AaBgJ5DTogJf2yz88uCuJV1oMDkbQaJArhgawhGJXwbX+Y2btbjXBpuJfXl+kiJOJmT9FpMURpKLMpl0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734093377; c=relaxed/simple;
	bh=mxKBWrK2kjoguBsnxXyYDwSZhLuMyKTIzUtaErQHo6U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uEOUnmCO0hVH06m1I2vYofsnA/cf8xqPpy2AOwbOsJUyUObTGhdeSlO1VJT9ZbnTyfAjymvoi+ovS5WSqzO5+19sOe12zK6q/+Z0HIoCJAq3lRz+nPTMnRxzwrcQ0oymI3cnmHxcgXu2lx1jP+jtX5Ic6JcCWKGvR+9+Ps6Ri2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: ZqVaqiFvTUOhXBv52U/uQA==
X-CSE-MsgGUID: qOOepw20T6eWGgAhAiWbuQ==
X-IronPort-AV: E=Sophos;i="6.12,231,1728918000"; 
   d="scan'208";a="231760528"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 13 Dec 2024 21:36:14 +0900
Received: from localhost.localdomain (unknown [10.226.92.203])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 4342C423928E;
	Fri, 13 Dec 2024 21:36:02 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v3 3/3] clk: renesas: r9a09g047: Add CA55 core clocks
Date: Fri, 13 Dec 2024 12:35:42 +0000
Message-ID: <20241213123550.289193-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241213123550.289193-1-biju.das.jz@bp.renesas.com>
References: <20241213123550.289193-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add CA55 core clocks which are derived from PLLCA55.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2->v3:
 * Added Rb tag from Geert.
v2:
 * New patch.
---
 drivers/clk/renesas/r9a09g047-cpg.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/clk/renesas/r9a09g047-cpg.c b/drivers/clk/renesas/r9a09g047-cpg.c
index ab63a7e7e480..d4c119c06d06 100644
--- a/drivers/clk/renesas/r9a09g047-cpg.c
+++ b/drivers/clk/renesas/r9a09g047-cpg.c
@@ -37,6 +37,14 @@ enum clk_ids {
 	MOD_CLK_BASE,
 };
 
+static const struct clk_div_table dtable_1_8[] = {
+	{0, 1},
+	{1, 2},
+	{2, 4},
+	{3, 8},
+	{0, 0},
+};
+
 static const struct clk_div_table dtable_2_64[] = {
 	{0, 2},
 	{1, 4},
@@ -65,6 +73,14 @@ static const struct cpg_core_clk r9a09g047_core_clks[] __initconst = {
 
 	/* Core Clocks */
 	DEF_FIXED("sys_0_pclk", R9A09G047_SYS_0_PCLK, CLK_QEXTAL, 1, 1),
+	DEF_DDIV("ca55_0_coreclk0", R9A09G047_CA55_0_CORECLK0, CLK_PLLCA55,
+		 CDDIV1_DIVCTL0, dtable_1_8),
+	DEF_DDIV("ca55_0_coreclk1", R9A09G047_CA55_0_CORECLK1, CLK_PLLCA55,
+		 CDDIV1_DIVCTL1, dtable_1_8),
+	DEF_DDIV("ca55_0_coreclk2", R9A09G047_CA55_0_CORECLK2, CLK_PLLCA55,
+		 CDDIV1_DIVCTL2, dtable_1_8),
+	DEF_DDIV("ca55_0_coreclk3", R9A09G047_CA55_0_CORECLK3, CLK_PLLCA55,
+		 CDDIV1_DIVCTL3, dtable_1_8),
 	DEF_FIXED("iotop_0_shclk", R9A09G047_IOTOP_0_SHCLK, CLK_PLLCM33_DIV16, 1, 1),
 };
 
-- 
2.43.0


