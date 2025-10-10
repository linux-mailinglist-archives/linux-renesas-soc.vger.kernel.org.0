Return-Path: <linux-renesas-soc+bounces-22878-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B6AD9BCC69B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Oct 2025 11:43:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7455C423145
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Oct 2025 09:43:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC53B2D0C89;
	Fri, 10 Oct 2025 09:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Hyu87awd"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AB9A2C325B;
	Fri, 10 Oct 2025 09:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760089411; cv=none; b=o7BOQMwnji261KPh4Dh7L1PvYaIKe/xRRYBUx2v1J/EbrkQDMusXbu4oNeXcSnXNCU2dfyDK2Kc2RRsmUzNG7rMIWP1fbWhIHqmKKQ/mExnBE98VAUBHzgxB57PPkqokP01VNlSl2R9nhffVrpnc/yspMlqjbSKWYZs0Hlw7+mw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760089411; c=relaxed/simple;
	bh=YQnvT7VgvloWaeCtVW7QZ5fYbRDxAI2v4C9nz/kg3ew=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=aKDSP6DhapSr2zExLVZy67ge06zmdyo3SeG1Uay8llY2lbU2D58Bf76Og85m7FXhHrbFHGIgEj2N+MQChqw/KoECALJP2mQQdnL87BXe1bGLOrlMX8jMuaLi7hBx0BV7K5H2yrsNlcl/FHSaeBXsy7PMUrhU5sIrADQTb7PZjSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Hyu87awd; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 261FF593;
	Fri, 10 Oct 2025 11:41:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1760089307;
	bh=YQnvT7VgvloWaeCtVW7QZ5fYbRDxAI2v4C9nz/kg3ew=;
	h=From:Date:Subject:To:Cc:From;
	b=Hyu87awd5kKD9juDCkkpF7YIx0v6qf5k3YZWcVYU3DaYa8S+eNEt/ijFlMwFMwCrS
	 OS2qsH6xYhVPEGNumbLyYOELLr2PsLykop/DsJme0CI6hLkkynM3cR1DxXXb8mwcjg
	 xuzmcd5omUpfLmIp2op45L0vRZrXem7uKL3GhHxU=
From: Daniel Scally <dan.scally@ideasonboard.com>
Date: Fri, 10 Oct 2025 10:43:10 +0100
Subject: [PATCH v2] clk: renesas: r9a09g057-cpg: Add clock and reset
 entries for ISP
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251010-rzv2h_isp_clk-v2-1-2c8853a9af7c@ideasonboard.com>
X-B4-Tracking: v=1; b=H4sIAC3V6GgC/x3MQQ6CMBCF4auQri3pTKygK+9hCBnbIhOxJa1pR
 MLdrSz/l7xvFclFdklcqlVElzlx8CXwUAkzkn84yba0QIUaFCgZvxnHntPcm+kpYWgd4ZnaI5A
 onzm6gT+7d+tKj5zeIS47n+G/7pLS6gQIqLHWuoFGSZCWfJ0MTdNyZesoBX8PFG1twkt027b9A
 NlV+5mrAAAA
X-Change-ID: 20251010-rzv2h_isp_clk-1f8ea29a841a
To: Geert Uytterhoeven <geert+renesas@glider.be>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: fabrizio.castro.jz@renesas.com, linux-renesas-soc@vger.kernel.org, 
 linux-clk@vger.kernel.org, prabhakar.mahadev-lad.rj@bp.renesas.com, 
 Daniel Scally <dan.scally@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3820;
 i=dan.scally@ideasonboard.com; h=from:subject:message-id;
 bh=YQnvT7VgvloWaeCtVW7QZ5fYbRDxAI2v4C9nz/kg3ew=;
 b=owEBbQKS/ZANAwAKAchJV3psRXUyAcsmYgBo6NU5UxA3zBKaswSeyoACAY3YYQQhYWUtfgAkk
 JwedLXf+ImJAjMEAAEKAB0WIQQqyuwyDnZdb+mxmm/ISVd6bEV1MgUCaOjVOQAKCRDISVd6bEV1
 MlaKD/sHdxeZyp29G6yYn/Ct+vEvZWCGxCI5q6Ep+L2z9E+CdiznJkjszrvjDoi+apIINo1U1Q0
 RMo4ZbDfkyE5096PYrkIbhS/sRASO2pNRYlgNhX/WR6NL/4RKaoBMhqkl/Co8cGPwviUL5cAuld
 D0g2NI6thl7uGxNbOVxMeCTCfoj4MpK5iyR+5wsmaQXw7hQTDHSVnTkrSJ7uQX1t4eeTxzXKtcq
 6B+kMwCizwnEqUKmPfWui7/R5HXs4JIN2K3XkmGPJb33L3V77jyC7yeR7q6FGVlvAXF+k2RnUiX
 GHl6X38X2Q555zCsR3LprhtALvn/6z9kVorG41svuD99dqwZlcTfktALTLzAjZ6E9uP8xGE8uD8
 Yvi2F12+UA17Io1HOhyVWLWajf2GdDcRz4AbAibYcRWslS5vlLXvwEH49C6yeVjPerfgDuMr/89
 IpUKkDqyNrbzb0Yj6dCml6E8r9Be/jHnyTDRI9wGnQDtlRtETYggXoprjxgdR4hXtHI3yj8EgBv
 t/fs8eHEEkZqapDAyHnxwQejATCYaBL+YkLN7rfRexTgZvJEO2Upc/0hFwEMBq5nBjib1sT/V/d
 gWnRmTeSW1mjfWlFXeEuL+WiWPgp5gJR9n/tf7lz4uTeM1NHjw6X6MF0l5ZQLn57+Mji4p6CcgM
 yHcPTwACc7LFmrw==
X-Developer-Key: i=dan.scally@ideasonboard.com; a=openpgp;
 fpr=EEC699ACA1B7CB5D31330C0BBD501C2A3546CCF6

Add entries detailing the clocks and resets for the ISP in the
RZ/V2H(P) SoC.

Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
---
Changes in v2:
- Dropped the dt-bindings patches since the macros weren't needed
- Squashed the separate patches adding clock and reset definitions
  into a single patch
- Link to v1: https://lore.kernel.org/r/20250506121252.557170-1-dan.scally@ideasonboard.com
---
 drivers/clk/renesas/r9a09g057-cpg.c | 14 ++++++++++++++
 drivers/clk/renesas/rzv2h-cpg.h     |  2 ++
 2 files changed, 16 insertions(+)

diff --git a/drivers/clk/renesas/r9a09g057-cpg.c b/drivers/clk/renesas/r9a09g057-cpg.c
index 6389c4b6a5231e444d5d54eba963eec7bbfd47e3..081b64fcbc6b4d7fafc3c88726cd3677672fffd7 100644
--- a/drivers/clk/renesas/r9a09g057-cpg.c
+++ b/drivers/clk/renesas/r9a09g057-cpg.c
@@ -64,6 +64,7 @@ enum clk_ids {
 	CLK_SMUX2_GBE1_TXCLK,
 	CLK_SMUX2_GBE1_RXCLK,
 	CLK_PLLGPU_GEAR,
+	CLK_PLLVDO_ISP,
 
 	/* Module Clocks */
 	MOD_CLK_BASE,
@@ -170,6 +171,7 @@ static const struct cpg_core_clk r9a09g057_core_clks[] __initconst = {
 	DEF_SMUX(".smux2_gbe1_rxclk", CLK_SMUX2_GBE1_RXCLK, SSEL1_SELCTL1, smux2_gbe1_rxclk),
 
 	DEF_DDIV(".pllgpu_gear", CLK_PLLGPU_GEAR, CLK_PLLGPU, CDDIV3_DIVCTL1, dtable_2_64),
+	DEF_DDIV(".pllvdo_isp", CLK_PLLVDO_ISP, CLK_PLLVDO, CDDIV2_DIVCTL3, dtable_2_64),
 
 	/* Core Clocks */
 	DEF_FIXED("sys_0_pclk", R9A09G057_SYS_0_PCLK, CLK_QEXTAL, 1, 1),
@@ -377,6 +379,14 @@ static const struct rzv2h_mod_clk r9a09g057_mod_clks[] __initconst = {
 						BUS_MSTOP(3, BIT(4))),
 	DEF_MOD("gpu_0_ace_clk",		CLK_PLLDTY_ACPU_DIV2, 15, 2, 7, 18,
 						BUS_MSTOP(3, BIT(4))),
+	DEF_MOD("isp_0_reg_aclk",		CLK_PLLDTY_ACPU_DIV2, 14, 2, 7, 2,
+						BUS_MSTOP(9, BIT(8))),
+	DEF_MOD("isp_0_pclk",			CLK_PLLDTY_DIV16, 14, 3, 7, 3,
+						BUS_MSTOP(9, BIT(8))),
+	DEF_MOD("isp_0_vin_aclk",		CLK_PLLDTY_ACPU_DIV2, 14, 4, 7, 4,
+						BUS_MSTOP(9, BIT(9))),
+	DEF_MOD("isp_0_isp_sclk",		CLK_PLLVDO_ISP, 14, 5, 7, 5,
+						BUS_MSTOP(9, BIT(9))),
 };
 
 static const struct rzv2h_reset r9a09g057_resets[] __initconst = {
@@ -442,6 +452,10 @@ static const struct rzv2h_reset r9a09g057_resets[] __initconst = {
 	DEF_RST(12, 14, 5, 31),		/* CRU_3_PRESETN */
 	DEF_RST(12, 15, 6, 0),		/* CRU_3_ARESETN */
 	DEF_RST(13, 0, 6, 1),		/* CRU_3_S_RESETN */
+	DEF_RST(13, 1, 6, 2),		/* ISP_0_VIN_ARESETN */
+	DEF_RST(13, 2, 6, 3),		/* ISP_0_REG_ARESETN */
+	DEF_RST(13, 3, 6, 4),		/* ISP_0_ISP_SRESETN */
+	DEF_RST(13, 4, 6, 5),		/* ISP_0_PRESETN */
 	DEF_RST(13, 13, 6, 14),		/* GPU_0_RESETN */
 	DEF_RST(13, 14, 6, 15),		/* GPU_0_AXI_RESETN */
 	DEF_RST(13, 15, 6, 16),		/* GPU_0_ACE_RESETN */
diff --git a/drivers/clk/renesas/rzv2h-cpg.h b/drivers/clk/renesas/rzv2h-cpg.h
index 840eed25aeda72f83644c6ba60d3f4368979b60e..e020d9624dfd75fbbf3dccf5ea045f81d26e0ae3 100644
--- a/drivers/clk/renesas/rzv2h-cpg.h
+++ b/drivers/clk/renesas/rzv2h-cpg.h
@@ -115,6 +115,7 @@ struct fixed_mod_conf {
 #define CPG_SSEL1		(0x304)
 #define CPG_CDDIV0		(0x400)
 #define CPG_CDDIV1		(0x404)
+#define CPG_CDDIV2		(0x408)
 #define CPG_CDDIV3		(0x40C)
 #define CPG_CDDIV4		(0x410)
 #define CPG_CSDIV0		(0x500)
@@ -125,6 +126,7 @@ struct fixed_mod_conf {
 #define CDDIV1_DIVCTL1	DDIV_PACK(CPG_CDDIV1, 4, 2, 5)
 #define CDDIV1_DIVCTL2	DDIV_PACK(CPG_CDDIV1, 8, 2, 6)
 #define CDDIV1_DIVCTL3	DDIV_PACK(CPG_CDDIV1, 12, 2, 7)
+#define CDDIV2_DIVCTL3	DDIV_PACK(CPG_CDDIV2, 12, 3, 11)
 #define CDDIV3_DIVCTL1	DDIV_PACK(CPG_CDDIV3, 4, 3, 13)
 #define CDDIV3_DIVCTL2	DDIV_PACK(CPG_CDDIV3, 8, 3, 14)
 #define CDDIV3_DIVCTL3	DDIV_PACK(CPG_CDDIV3, 12, 1, 15)

---
base-commit: b5788b96cba97da01e1f0e1316133427c1102ff6
change-id: 20251010-rzv2h_isp_clk-1f8ea29a841a

Best regards,
-- 
Daniel Scally <dan.scally@ideasonboard.com>


