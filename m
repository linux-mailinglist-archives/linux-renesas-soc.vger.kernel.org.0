Return-Path: <linux-renesas-soc+bounces-23784-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B328DC1601A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Oct 2025 17:58:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A83CE1A64ABE
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Oct 2025 16:54:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8809522A1D5;
	Tue, 28 Oct 2025 16:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IxWNFNEY"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F4013469F4
	for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Oct 2025 16:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761670339; cv=none; b=chtD/imj0Rg+1aK6p5qAkDYxtrnYmrxpEbKDPGhTNJHCNEVXJTecN3HEVwSJTtSf+r/T6qsqcGoTyO9E578KsgqyY5oxFyfa4LkkG6BLzm9zcq1CkGjpQezUota691qm8Yt3Q6k63PXtCDpcPiUy0r5BI3nEwAyJYS2Lrvo+OuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761670339; c=relaxed/simple;
	bh=WFew7RLc9Zd+tpZCR+smsad3xkEUOcASLxfJhKIGvy4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tkfv6OGrlkOuZ4/fvulGIa2F2CGah+YWXs9Dw3ihaFhrQusRgFlpIcyRVx1Ny8Ws8TvI7K7HsOzkm9AynPNkDLJU7OVHKS9zNa8YziCPsooW1y3MRFe3L5kULBofD3iwaVRzOtlSpyoDOqp7GPperRNIpif0BH/VbDrG2Bz4qG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IxWNFNEY; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-29292eca5dbso82173505ad.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Oct 2025 09:52:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761670337; x=1762275137; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b2Zr7HjUEXtUzytWwmBSdtq4q5NXObpurWZ+b8YgjWQ=;
        b=IxWNFNEYxhQTCM2rMYn9CW50pF1EGoNavVi50nn8nqXEI7ayg8E3DmJDMY/+5dk+D/
         S7fLZNaC+GdqZwCCojlM6FelFlmo5/IBmObTjSMlYFn30Zv7+e3v06wUawTlBndVajPp
         1PzwKDkts6rHMUv2NGYzVIq0WcsZRoMmuHnrelmVBPp2+PBT7LXUs/jOql2QWiDtPTs/
         ow0VgzyvUdJtTwuJJYCJXPoczTq8nR8/WHOEs183cBdDFztPATx7tos7SEYDRKD01lS2
         R5P6tVl9QnJb2bj/MOAgOYA6IQiB7dkqVWpejmpOe9fUmCMK3sHkUHGs1LHwtckac1RS
         /CcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761670337; x=1762275137;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b2Zr7HjUEXtUzytWwmBSdtq4q5NXObpurWZ+b8YgjWQ=;
        b=a7cBuWKPRD3dgoTikGcX243GD7Q8Rl4onvzckmP0q3wYHMMZbuJAQC2V8kP6zBAwiT
         i1uRYsMuQQCUgk5p4TnwLytAKpTOgccahsuUrwaOvoD7UcwnmzFL1XH8z37ZtSQ5fGLE
         HuSN0IOOL1Gl9fknH8a60TguatNri8NCulMA7eSAGxg4HvrGB/VBKVrYMf5gxp2NTyn3
         zjl5i0UF9V45nFGBUOa26TqIzTrTnCJxOLH6Ic5loKIFp7DxlYAm+ObGHgXZV47a+ZCM
         Y8Cy2eyKAdzPDvnp/mhAQdWJq/A+qoNzJGES260HgBA3iVhTWxlknZn3eypnKxnjIc0d
         WoTg==
X-Gm-Message-State: AOJu0YxvLJ/REe5rsrUK0L2ooRevKllIJCuMewRqbAxqE0lO8W+JGmGz
	KsAyRFPQpGKQnGJIzzsbn+bIfM4ZM/lO1lTTiVHWzebSXaz5jblraTex1jIiPsV6
X-Gm-Gg: ASbGncuBhxVneltnwPs4TJVlotNA7BcmHVNhJmLNUzSCnGn+n3dRXprQha+wQ3v2ba4
	pPNpS3zXKyigXkNr/PnS05Pyg19V+QR1tbe3DPWw+AOH9Wh8+Mrz6hj6VIlfHAtLHrYq6wnkzeh
	zkARdV+6aXPbyj6sTNfJJUvoyXL1/nqFEmsQ8WpucPwY2tZhg62EfOx6VGnRArosPnM+uA/xbr6
	1QgR4R+uG/3FCulFxvr/phwPeVNXXQdQErUUjSiZ5quI1Zzrz4v5wqP1Iwp9M5ZhjdNHzslOwcg
	9ELPBz32JJHttWx30jCtiuTg1onLTKjE9s6gNrRgJxNnxNX32c0V8zs+ShFn8uswzshPGA3eWUt
	beYLVChDFKVn+xuevA7Z1DzSfYmKgbKcNrVrDB7v6KcMlJighRoQQjxPn0K+Lv2/slwhrErJI0O
	r7e0JNtxd/3ZAl1ypPpYd1tw==
X-Google-Smtp-Source: AGHT+IEgwFJI5NAIzF94P9PLCgQBGcLOI50Ks257zb4cT6sx/wW+6XXdpe9DB0mcBPoFARxUuU9xfg==
X-Received: by 2002:a17:902:f68f:b0:26f:f489:bba6 with SMTP id d9443c01a7336-294cb540d36mr54558825ad.50.1761670336773;
        Tue, 28 Oct 2025 09:52:16 -0700 (PDT)
Received: from iku.. ([2401:4900:1c06:77f0:168f:479e:bf92:ce93])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498f0be0esm122123665ad.96.2025.10.28.09.52.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 09:52:16 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 5/5] clk: renesas: r9a09g077: Add xSPI core and module clocks
Date: Tue, 28 Oct 2025 16:51:27 +0000
Message-ID: <20251028165127.991351-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251028165127.991351-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20251028165127.991351-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add core clocks and module clock definitions required by the xSPI
(Expanded SPI) IP on the R9A09G077 SoC.

Define the new SCKCR fields FSELXSPI0/FSELXSPI1 and DIVSEL_XSPI0/1 and
add two new core clocks XSPI_CLK0 and XSPI_CLK1. The xSPI block uses
PCLKH as its bus clock (use as module clock parent) while the operation
clock (XSPI_CLKn) is derived from PLL4. To support this arrangement
provide mux/div selectors and divider tables for the supported
XSPI operating rates.

Add CLK_TYPE_RZT2H_FSELXSPI to implement a custom divider/mux clock
where the determine_rate() callback enforces the hardware constraint:
when the parent output is 600MHz only dividers 8 and 16 are valid,
whereas for 800MHz operation the full divider set (6,8,16,32,64) may
be used. The custom determine_rate() picks the best parent/divider pair
to match the requested rate and programs the appropriate SCKCR fields.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2:
- Added custom divider clock type for XSPI clocks to enforce hardware
  constraints on supported operating rates.
---
 drivers/clk/renesas/r9a09g077-cpg.c | 155 +++++++++++++++++++++++++++-
 1 file changed, 154 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/renesas/r9a09g077-cpg.c b/drivers/clk/renesas/r9a09g077-cpg.c
index b46167d42084..678dc36461c0 100644
--- a/drivers/clk/renesas/r9a09g077-cpg.c
+++ b/drivers/clk/renesas/r9a09g077-cpg.c
@@ -11,6 +11,8 @@
 #include <linux/device.h>
 #include <linux/init.h>
 #include <linux/kernel.h>
+#include <linux/math.h>
+#include <linux/types.h>
 
 #include <dt-bindings/clock/renesas,r9a09g077-cpg-mssr.h>
 #include <dt-bindings/clock/renesas,r9a09g087-cpg-mssr.h>
@@ -54,12 +56,19 @@
 #define DIVSCI3ASYNC	CONF_PACK(SCKCR3, 12, 2)
 #define DIVSCI4ASYNC	CONF_PACK(SCKCR3, 14, 2)
 
+#define FSELXSPI0	CONF_PACK(SCKCR, 0, 3)
+#define FSELXSPI1	CONF_PACK(SCKCR, 8, 3)
+#define DIVSEL_XSPI0	CONF_PACK(SCKCR, 6, 1)
+#define DIVSEL_XSPI1	CONF_PACK(SCKCR, 14, 1)
 #define SEL_PLL		CONF_PACK(SCKCR, 22, 1)
 
+#define DIVSELXSPI_RATE_600MHZ		600000000UL
+#define DIVSELXSPI_RATE_800MHZ		800000000UL
 
 enum rzt2h_clk_types {
 	CLK_TYPE_RZT2H_DIV = CLK_TYPE_CUSTOM,	/* Clock with divider */
 	CLK_TYPE_RZT2H_MUX,			/* Clock with clock source selector */
+	CLK_TYPE_RZT2H_FSELXSPI,
 };
 
 #define DEF_DIV(_name, _id, _parent, _conf, _dtable) \
@@ -69,10 +78,13 @@ enum rzt2h_clk_types {
 	DEF_TYPE(_name, _id, CLK_TYPE_RZT2H_MUX, .conf = _conf, \
 		 .parent_names = _parent_names, .num_parents = _num_parents, \
 		 .flag = 0, .mux_flags = _mux_flags)
+#define DEF_DIV_FSELXSPI(_name, _id, _parent, _conf, _dtable) \
+	DEF_TYPE(_name, _id, CLK_TYPE_RZT2H_FSELXSPI, .conf = _conf, \
+		 .parent = _parent, .dtable = _dtable, .flag = 0)
 
 enum clk_ids {
 	/* Core Clock Outputs exported to DT */
-	LAST_DT_CORE_CLK = R9A09G077_ETCLKE,
+	LAST_DT_CORE_CLK = R9A09G077_XSPI_CLK1,
 
 	/* External Input Clocks */
 	CLK_EXTAL,
@@ -88,12 +100,16 @@ enum clk_ids {
 	CLK_SEL_CLK_PLL2,
 	CLK_SEL_CLK_PLL4,
 	CLK_PLL4D1,
+	CLK_PLL4D1_DIV3,
+	CLK_PLL4D1_DIV4,
 	CLK_SCI0ASYNC,
 	CLK_SCI1ASYNC,
 	CLK_SCI2ASYNC,
 	CLK_SCI3ASYNC,
 	CLK_SCI4ASYNC,
 	CLK_SCI5ASYNC,
+	CLK_DIVSELXSPI0_SCKCR,
+	CLK_DIVSELXSPI1_SCKCR,
 
 	/* Module Clocks */
 	MOD_CLK_BASE,
@@ -105,6 +121,15 @@ static const struct clk_div_table dtable_1_2[] = {
 	{0, 0},
 };
 
+static const struct clk_div_table dtable_6_8_16_32_64[] = {
+	{6, 64},
+	{5, 32},
+	{4, 16},
+	{3, 8},
+	{2, 6},
+	{0, 0},
+};
+
 static const struct clk_div_table dtable_24_25_30_32[] = {
 	{0, 32},
 	{1, 30},
@@ -119,6 +144,7 @@ static const char * const sel_clk_pll0[] = { ".loco", ".pll0" };
 static const char * const sel_clk_pll1[] = { ".loco", ".pll1" };
 static const char * const sel_clk_pll2[] = { ".loco", ".pll2" };
 static const char * const sel_clk_pll4[] = { ".loco", ".pll4" };
+static const char * const sel_clk_pll4d1_div3_div4[] = { ".pll4d1_div3", ".pll4d1_div4" };
 
 static const struct cpg_core_clk r9a09g077_core_clks[] __initconst = {
 	/* External Clock Inputs */
@@ -154,6 +180,15 @@ static const struct cpg_core_clk r9a09g077_core_clks[] __initconst = {
 	DEF_DIV(".sci5async", CLK_SCI5ASYNC, CLK_PLL4D1, DIVSCI5ASYNC,
 		dtable_24_25_30_32),
 
+	DEF_FIXED(".pll4d1_div3", CLK_PLL4D1_DIV3, CLK_PLL4D1, 3, 1),
+	DEF_FIXED(".pll4d1_div4", CLK_PLL4D1_DIV4, CLK_PLL4D1, 4, 1),
+	DEF_MUX(".divselxspi0", CLK_DIVSELXSPI0_SCKCR, DIVSEL_XSPI0,
+		sel_clk_pll4d1_div3_div4,
+		ARRAY_SIZE(sel_clk_pll4d1_div3_div4), 0),
+	DEF_MUX(".divselxspi1", CLK_DIVSELXSPI1_SCKCR, DIVSEL_XSPI1,
+		sel_clk_pll4d1_div3_div4,
+		ARRAY_SIZE(sel_clk_pll4d1_div3_div4), 0),
+
 	/* Core output clk */
 	DEF_DIV("CA55C0", R9A09G077_CLK_CA55C0, CLK_SEL_CLK_PLL0, DIVCA55C0,
 		dtable_1_2),
@@ -178,9 +213,15 @@ static const struct cpg_core_clk r9a09g077_core_clks[] __initconst = {
 	DEF_FIXED("ETCLKC", R9A09G077_ETCLKC, CLK_SEL_CLK_PLL1, 10, 1),
 	DEF_FIXED("ETCLKD", R9A09G077_ETCLKD, CLK_SEL_CLK_PLL1, 20, 1),
 	DEF_FIXED("ETCLKE", R9A09G077_ETCLKE, CLK_SEL_CLK_PLL1, 40, 1),
+	DEF_DIV_FSELXSPI("XSPI_CLK0", R9A09G077_XSPI_CLK0, CLK_DIVSELXSPI0_SCKCR,
+			 FSELXSPI0, dtable_6_8_16_32_64),
+	DEF_DIV_FSELXSPI("XSPI_CLK1", R9A09G077_XSPI_CLK1, CLK_DIVSELXSPI1_SCKCR,
+			 FSELXSPI1, dtable_6_8_16_32_64),
 };
 
 static const struct mssr_mod_clk r9a09g077_mod_clks[] __initconst = {
+	DEF_MOD("xspi0", 4, R9A09G077_CLK_PCLKH),
+	DEF_MOD("xspi1", 5, R9A09G077_CLK_PCLKH),
 	DEF_MOD("sci0fck", 8, CLK_SCI0ASYNC),
 	DEF_MOD("sci1fck", 9, CLK_SCI1ASYNC),
 	DEF_MOD("sci2fck", 10, CLK_SCI2ASYNC),
@@ -264,6 +305,116 @@ r9a09g077_cpg_mux_clk_register(struct device *dev,
 	return clk_hw->clk;
 }
 
+static int r9a09g077_cpg_fselxspi_determine_rate(struct clk_hw *hw,
+						 struct clk_rate_request *req)
+{
+	struct clk_divider *divider = to_clk_divider(hw);
+	unsigned long parent_rate, best = 0, now;
+	const struct clk_div_table *clkt;
+	unsigned long rate = req->rate;
+	int div = 0;
+
+	if (!rate)
+		rate = 1;
+
+	for (clkt = divider->table; clkt->div; clkt++) {
+		parent_rate = clk_hw_round_rate(req->best_parent_hw, rate * clkt->div);
+		/*
+		 * DIVSELXSPIx supports 800MHz and 600MHz operation.
+		 * When the parent_rate is 600MHz, only dividers of 8 and 16
+		 * are supported otherwise dividers of 6, 8, 16, 32, 64 are supported.
+		 * This check ensures that FSELXSPIx is set correctly.
+		 */
+		if (parent_rate == DIVSELXSPI_RATE_600MHZ &&
+		    (clkt->div != 8 && clkt->div != 16))
+			continue;
+		now = DIV_ROUND_UP_ULL((u64)parent_rate, clkt->div);
+		if (abs(rate - now) < abs(rate - best)) {
+			div = clkt->div;
+			best = now;
+			req->best_parent_rate = parent_rate;
+		}
+	}
+
+	if (!div) {
+		u8 maxdiv = 0;
+
+		req->best_parent_rate = clk_hw_round_rate(req->best_parent_hw, 1);
+		/*
+		 * If DIVSELXSPIx is set to 800MHz set the maximum divider
+		 * or else fall back to divider of 16 which is a maximum
+		 * supported divider for 600MHz operation.
+		 */
+		if (req->best_parent_rate == DIVSELXSPI_RATE_800MHZ) {
+			for (clkt = divider->table; clkt->div; clkt++) {
+				if (clkt->div > maxdiv)
+					maxdiv = clkt->div;
+			}
+			div = maxdiv;
+		} else {
+			div = 16;
+		}
+	}
+
+	req->rate = DIV_ROUND_UP_ULL((u64)req->best_parent_rate, div);
+
+	return 0;
+}
+
+static struct clk * __init
+r9a09g077_cpg_fselxspi_div_clk_register(struct device *dev,
+					const struct cpg_core_clk *core,
+					void __iomem *addr,
+					struct cpg_mssr_pub *pub)
+{
+	static struct clk_ops *xspi_div_ops;
+	struct clk_init_data init = {};
+	const struct clk *parent;
+	const char *parent_name;
+	struct clk_divider *div;
+	struct clk_hw *hw;
+	int ret;
+
+	parent = pub->clks[core->parent];
+	if (IS_ERR(parent))
+		return ERR_CAST(parent);
+
+	div = devm_kzalloc(dev, sizeof(*div), GFP_KERNEL);
+	if (!div)
+		return ERR_PTR(-ENOMEM);
+
+	if (!xspi_div_ops) {
+		xspi_div_ops = devm_kzalloc(dev, sizeof(*xspi_div_ops), GFP_KERNEL);
+		if (!xspi_div_ops)
+			return  ERR_PTR(-ENOMEM);
+		memcpy(xspi_div_ops, &clk_divider_ops,
+		       sizeof(const struct clk_ops));
+		xspi_div_ops->determine_rate = r9a09g077_cpg_fselxspi_determine_rate;
+	}
+
+	parent_name = __clk_get_name(parent);
+	init.name = core->name;
+	init.ops = xspi_div_ops;
+	init.flags = CLK_SET_RATE_PARENT;
+	init.parent_names = &parent_name;
+	init.num_parents = 1;
+
+	div->reg = addr;
+	div->shift = GET_SHIFT(core->conf);
+	div->width = GET_WIDTH(core->conf);
+	div->flags = core->flag;
+	div->lock = &pub->rmw_lock;
+	div->hw.init = &init;
+	div->table = core->dtable;
+
+	hw = &div->hw;
+	ret = devm_clk_hw_register(dev, hw);
+	if (ret)
+		return ERR_PTR(ret);
+
+	return hw->clk;
+}
+
 static struct clk * __init
 r9a09g077_cpg_clk_register(struct device *dev, const struct cpg_core_clk *core,
 			   const struct cpg_mssr_info *info,
@@ -278,6 +429,8 @@ r9a09g077_cpg_clk_register(struct device *dev, const struct cpg_core_clk *core,
 		return r9a09g077_cpg_div_clk_register(dev, core, addr, pub);
 	case CLK_TYPE_RZT2H_MUX:
 		return r9a09g077_cpg_mux_clk_register(dev, core, addr, pub);
+	case CLK_TYPE_RZT2H_FSELXSPI:
+		return r9a09g077_cpg_fselxspi_div_clk_register(dev, core, addr, pub);
 	default:
 		return ERR_PTR(-EINVAL);
 	}
-- 
2.43.0


