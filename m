Return-Path: <linux-renesas-soc+bounces-10822-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 766409E19E1
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Dec 2024 11:50:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4A7841612FE
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Dec 2024 10:50:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26F761E25F0;
	Tue,  3 Dec 2024 10:50:50 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 699611E25F5;
	Tue,  3 Dec 2024 10:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733223050; cv=none; b=CeVoUcuJdrHWhS/TUu8nxbGH2i55GI4bh0LRy2umm4GURK45gTOBC10uLle60oYYaGJa4PXvcS9+QnIe8SeuJCIVow51qb8Mm7GAmPqjP2x3k0TJU8DuoYvdknhQCdeWByrzXgewuIXCZfHHvu2jZu4Euz6EkPMhLbNMhnuIJvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733223050; c=relaxed/simple;
	bh=TehA2LY+6jKDZWnvVUQjlP2Gb3TeXPhPIgFJ1iP3ug0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mRaUjArXj3a4GalU5z4S8Xi3E665HRhSqcZora0plKiu8b9I1Csx+bouHxeBlk1FnVIT7tbVhyQl+nIObFFbVLYP6wWINJA5Vj24TYI+iafedSGrYUAT6aWAJRIUlmUkla0VIRRgm7SN6qJJOOHJH4sdLyCgWdFoK8uOvkBD/0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: XPHU79RjTQeSxbVtUjuklw==
X-CSE-MsgGUID: WB4eK+ECQ/yyNg7GQb21RQ==
X-IronPort-AV: E=Sophos;i="6.12,204,1728918000"; 
   d="scan'208";a="230754423"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 03 Dec 2024 19:50:47 +0900
Received: from localhost.localdomain (unknown [10.226.93.2])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 90FF2400753A;
	Tue,  3 Dec 2024 19:50:37 +0900 (JST)
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
Subject: [PATCH v2 08/13] clk: renesas: r9a09g047: Add CA55 core clocks
Date: Tue,  3 Dec 2024 10:49:35 +0000
Message-ID: <20241203105005.103927-9-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241203105005.103927-1-biju.das.jz@bp.renesas.com>
References: <20241203105005.103927-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add CA55 core clocks which are derived from PLLCA55.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
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


