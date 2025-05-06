Return-Path: <linux-renesas-soc+bounces-16714-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 327C2AAC390
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  6 May 2025 14:13:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2A0651C23F12
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  6 May 2025 12:13:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEC3E27F75D;
	Tue,  6 May 2025 12:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="AKv0CRuJ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F94627F196;
	Tue,  6 May 2025 12:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746533598; cv=none; b=VeJD0Tb7AiB+nwZiTb8jYKSs/xwPmtvLctLyZsTwXFsiaKz9lS2IOCxZfO8kFGkaCSfHEsS7OMdtIYEx5zinstvttCJOjqAFRt6RdMeYTvNjMvniaq5xn9W21/lxXjV4E+Y04+H06nY2E6BpCIkPhQij5cjXh6mOYsCHOcvvJr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746533598; c=relaxed/simple;
	bh=aQb67FmKb71KWB/1t7nQx1c5Azlj85Co4idcfWfRmeU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=IZdo/En0V/dia8UovSMioDg27ANyMjyIdKZR9aTHU7kYCFR1NJKQiPe7nYi506/wjJXmO6xkbu6D4/LVAQRBST/DkztwqpKYV42dMPbYT0eN3dBphm4qUEKCfzrXrt01tpA9YsXQQnL7rA4gYO69d7BZvucEHTWNuYc7CooUhDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=AKv0CRuJ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E71E974C;
	Tue,  6 May 2025 14:12:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1746533576;
	bh=aQb67FmKb71KWB/1t7nQx1c5Azlj85Co4idcfWfRmeU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AKv0CRuJnjs3AepQu+bnJ7JDE+KfBzx/HXQ2UVQK8v86WXl4Y/6arxaXcRO78mk1n
	 wMKtqY2a51jozxCOMgFQxZnPrN50wUzoubTo3XtHoYOCtJoARHTiHHG6XkSRVTabe8
	 UoxlA9SAp2l1I4Ux9e/4iAkw1c3Dgk/bj7FPVqHc=
From: Daniel Scally <dan.scally@ideasonboard.com>
To: linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	magnus.damm@gmail.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	Daniel Scally <dan.scally+renesas@ideasonboard.com>
Subject: [PATCH 2/4] clk: renesas: r9a09g057-cpg: Add clock entries for RZ/V2H ISP
Date: Tue,  6 May 2025 13:12:50 +0100
Message-Id: <20250506121252.557170-3-dan.scally@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250506121252.557170-1-dan.scally@ideasonboard.com>
References: <20250506121252.557170-1-dan.scally@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Daniel Scally <dan.scally+renesas@ideasonboard.com>

Add the clock entries for the ISP in the RZ/V2H SoC

Signed-off-by: Daniel Scally <dan.scally+renesas@ideasonboard.com>
---
 drivers/clk/renesas/r9a09g057-cpg.c | 11 +++++++++++
 drivers/clk/renesas/rzv2h-cpg.h     |  2 ++
 2 files changed, 13 insertions(+)

diff --git a/drivers/clk/renesas/r9a09g057-cpg.c b/drivers/clk/renesas/r9a09g057-cpg.c
index d63eafbca780..cb001ae5f98b 100644
--- a/drivers/clk/renesas/r9a09g057-cpg.c
+++ b/drivers/clk/renesas/r9a09g057-cpg.c
@@ -47,6 +47,7 @@ enum clk_ids {
 	CLK_PLLVDO_CRU1,
 	CLK_PLLVDO_CRU2,
 	CLK_PLLVDO_CRU3,
+	CLK_PLLVDO_ISP0,
 
 	/* Module Clocks */
 	MOD_CLK_BASE,
@@ -110,6 +111,8 @@ static const struct cpg_core_clk r9a09g057_core_clks[] __initconst = {
 	DEF_DDIV(".pllvdo_cru2", CLK_PLLVDO_CRU2, CLK_PLLVDO, CDDIV4_DIVCTL1, dtable_2_4),
 	DEF_DDIV(".pllvdo_cru3", CLK_PLLVDO_CRU3, CLK_PLLVDO, CDDIV4_DIVCTL2, dtable_2_4),
 
+	DEF_DDIV(".pllvdo_isp0", CLK_PLLVDO_ISP0, CLK_PLLVDO, CDDIV2_DIVCTL3, dtable_2_64),
+
 	/* Core Clocks */
 	DEF_FIXED("sys_0_pclk", R9A09G057_SYS_0_PCLK, CLK_QEXTAL, 1, 1),
 	DEF_DDIV("ca55_0_coreclk0", R9A09G057_CA55_0_CORE_CLK0, CLK_PLLCA55,
@@ -238,6 +241,14 @@ static const struct rzv2h_mod_clk r9a09g057_mod_clks[] __initconst = {
 						BUS_MSTOP(9, BIT(7))),
 	DEF_MOD("cru_3_pclk",			CLK_PLLDTY_DIV16, 13, 13, 6, 29,
 						BUS_MSTOP(9, BIT(7))),
+	DEF_MOD("isp_0_reg_aclk",		CLK_PLLDTY_ACPU_DIV2, 14, 2, 7, 2,
+						BUS_MSTOP(9, BIT(8))),
+	DEF_MOD("isp_0_pclk",			CLK_PLLDTY_DIV16, 14, 3, 7, 3,
+						BUS_MSTOP(9, BIT(8))),
+	DEF_MOD("isp_0_vin_aclk",		CLK_PLLDTY_ACPU_DIV2, 14, 4, 7, 4,
+						BUS_MSTOP(9, BIT(9))),
+	DEF_MOD("isp_0_isp_sclk",		CLK_PLLVDO_ISP0, 14, 5, 7, 5,
+						BUS_MSTOP(9, BIT(9))),
 };
 
 static const struct rzv2h_reset r9a09g057_resets[] __initconst = {
diff --git a/drivers/clk/renesas/rzv2h-cpg.h b/drivers/clk/renesas/rzv2h-cpg.h
index 576a070763cb..c2e09199a8cd 100644
--- a/drivers/clk/renesas/rzv2h-cpg.h
+++ b/drivers/clk/renesas/rzv2h-cpg.h
@@ -35,6 +35,7 @@ struct ddiv {
 
 #define CPG_CDDIV0		(0x400)
 #define CPG_CDDIV1		(0x404)
+#define CPG_CDDIV2		(0x408)
 #define CPG_CDDIV3		(0x40C)
 #define CPG_CDDIV4		(0x410)
 
@@ -44,6 +45,7 @@ struct ddiv {
 #define CDDIV1_DIVCTL1	DDIV_PACK(CPG_CDDIV1, 4, 2, 5)
 #define CDDIV1_DIVCTL2	DDIV_PACK(CPG_CDDIV1, 8, 2, 6)
 #define CDDIV1_DIVCTL3	DDIV_PACK(CPG_CDDIV1, 12, 2, 7)
+#define CDDIV2_DIVCTL3	DDIV_PACK(CPG_CDDIV2, 12, 3, 11)
 #define CDDIV3_DIVCTL2	DDIV_PACK(CPG_CDDIV3, 8, 3, 14)
 #define CDDIV3_DIVCTL3	DDIV_PACK(CPG_CDDIV3, 12, 1, 15)
 #define CDDIV4_DIVCTL0	DDIV_PACK(CPG_CDDIV4, 0, 1, 16)
-- 
2.34.1


