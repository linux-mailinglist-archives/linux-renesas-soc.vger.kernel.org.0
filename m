Return-Path: <linux-renesas-soc+bounces-24704-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id D9C1FC66291
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Nov 2025 21:57:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C2A184ED4C7
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Nov 2025 20:57:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E1F132E12A;
	Mon, 17 Nov 2025 20:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q+mw19tH"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1270328635
	for <linux-renesas-soc@vger.kernel.org>; Mon, 17 Nov 2025 20:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763413027; cv=none; b=SjidjHW+Ib6mGEDUegoYmxnf4DnbLwntzKNT8SRcLJX+uWiNOfuLbuGtnTrPAiEdAxUcBYMKtAHRZRDtYuJFKnxDnPeSyna7jfyTqSXQxgscjNxNfPPQorAPJCFTZWsTM6mpEYASqpHjl8zkBcERSLVcBlgrDO7OlFzJKBs6fwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763413027; c=relaxed/simple;
	bh=YV1cT30Fs84kRwoFjvogDxZle/2IR7xAJ5WUTPhzP/k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TT557cs0NAcMrgD+t47A3DdXiR3RCjnlN0A0IKUCkLzKnqFzog0fA3vCAGMEFCZzsNpKvCr62kuIA002Hy5YYQCAcMvuvn/WXSDD6eL7SoMMc3pptQiUUEgtZ4XsR4hu3Oh0BJA1pgkT+XuQWYO5eY2TGVhCOvlx7Hm8Fuie7o4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q+mw19tH; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-42b427cda88so3396747f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 17 Nov 2025 12:57:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763413024; x=1764017824; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kbV4QFu7SV5wp1gKegpOjdnpu0Me/oc7lWbeUbQn2wc=;
        b=Q+mw19tHesXBzDuJxHq6jY+Pty9Yc31XELIW25zLSrKpnMYQvyDDojmfJvY2x/2bP9
         VZY6h7GEYHDcKU33eB5sEr0pmrDnydPrrQg0FmZlGVoQaewKb4eeuNidnJqeMcKF2QqH
         lhcqY5P2AZZ0U1s44vJIRPzM1Z/O5VDt3TmbzGkdotQS3r6ZCCIy5waAk0O33TkL0AEK
         zLRu43y6BieSSCsA8kJE9mJSzPnrqfbYyVmgOZ0tcJNhuDyFp3sPynpf9QRtgj3/Wwha
         AvdrjdHJkpNuR7hI456NXXWn7iVCtH8ZaWiMLUwpAVep6jwXFXVhqVQ+dt8RH1MZWKBn
         1Xxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763413024; x=1764017824;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kbV4QFu7SV5wp1gKegpOjdnpu0Me/oc7lWbeUbQn2wc=;
        b=i4Id5btKE1VDxgEjL1Sdylr/qB0fOOnv5uxEaB0tsKFDc8AgsjmWZQNOme7HCHsO9T
         6jJgH/ZUns2OAoJunt7VbBVxZFonKiCcuWq17Tg1npeUz4kdC2CypdKY2c62FZmWSHfr
         2iQyJOzj3f5ZBGLqrFLZX1dUWP509ud7lmHtJj+PPrTjTywzqJohVOpJvTEmbN81o8Ji
         0olPpjHpk8b2TDh9K4GQZhdxnT7BUH/TjvB1MOPm17DvjB20Uc3m5ISb1jI3gP6UTxI1
         mXYWtrJx/kjynJgxEMzXyp+69Kgv13qX9ubpF1FM/mGgdpvWGcXuiisNt4KHHxIQTdyf
         JZkQ==
X-Gm-Message-State: AOJu0YzkOxQTzZytQaOhChpEq2Bf55eJF8CQLWTRGfNKXK/WNefVostB
	FKGfVdEVsB2bsRqjfjFhlmm/v380+0vbzaizPeN3J/KssnbKNwS9JKNb
X-Gm-Gg: ASbGncv1fFhc5WqJGaaV53g/C5gdiUlVgOp0dRJrGErz7orQ1fPNlHQzBtmUWDrOWyA
	nSlsGffjNuKxOYyi9cXjcI0PVeKE6KIAULI7bDXVVYGZI1cBjtJXOBIh4fzfqbby4yEdNQg9u7/
	PSvNEdd2Tm6IDnEi6VQpVRLBBG0wL6Yd13ekcS1HzHL454AR3tBEW54BcRCbKOx4uTXUg876Qql
	YWs+pPxodX8plNKjHE/7LgZ+GjZCfHQ1q6R2c07uO1vaENfBiZBS3IZp0Rg6/aLyTSB3Is4l20U
	EhOW+b5zg23p39nnJYkCQvnlSIE8myFYiawY2rdgsIQzVJm5f6qbzF9oxAbaoF9LRJP9Ryt6zvS
	y8zG+xO2AvqZvZpePngoZhhYOt4mLbzRE0AhJ7SvQ7698ZwAEbmtIuemmYsW9/7rie0tV9vBIAf
	CleZKJ0RczYML8R86+ZENWO2ujPwem+N6DUms=
X-Google-Smtp-Source: AGHT+IHIvfWl18rNuBEc0KEc0UirxD2tBSwWoyvLORHNoqoTK7Mk85rYZRNurUeLeUXAKFV0X8BrIQ==
X-Received: by 2002:a05:6000:22c9:b0:42b:3963:d08e with SMTP id ffacd0b85a97d-42b593391a8mr14256692f8f.22.1763413023945;
        Mon, 17 Nov 2025 12:57:03 -0800 (PST)
Received: from iku.Home ([2a06:5906:61b:2d00:c6f8:3eed:d120:33b3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53f206aasm28203490f8f.40.2025.11.17.12.57.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 12:57:03 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3] clk: renesas: r9a09g077: Add xSPI core and module clocks
Date: Mon, 17 Nov 2025 20:56:27 +0000
Message-ID: <20251117205627.39376-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.51.2
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
Note this patch was originally part of series [0] as rest of the series
is already merged into linux-next, sending only this patch as v3.
[0] https://lore.kernel.org/all/20251028165127.991351-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

v2->v3:
- Dropped check for 800/600 MHz in
  r9a09g077_cpg_fselxspi_determine_rate() instead compared divider values 3/4.
- Sorted pll4d1_div3/pll4d1_div4 definitions to be with other pll4d1 dividers.
- Dropped u64 caset in DIV_ROUND_UP_ULL()
- Hardcoded the maxdiv when no dividers are found
- Rebaesed to latest -next

v1->v2:
- Added custom divider clock type for XSPI clocks to enforce hardware
  constraints on supported operating rates.
---
 drivers/clk/renesas/r9a09g077-cpg.c | 189 +++++++++++++++++++++++++++-
 1 file changed, 188 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/renesas/r9a09g077-cpg.c b/drivers/clk/renesas/r9a09g077-cpg.c
index fb6cc94d08a1..7367a713991d 100644
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
@@ -58,11 +60,16 @@
 #define DIVSCI3ASYNC	CONF_PACK(SCKCR3, 12, 2)
 #define DIVSCI4ASYNC	CONF_PACK(SCKCR3, 14, 2)
 
+#define FSELXSPI0	CONF_PACK(SCKCR, 0, 3)
+#define FSELXSPI1	CONF_PACK(SCKCR, 8, 3)
+#define DIVSEL_XSPI0	CONF_PACK(SCKCR, 6, 1)
+#define DIVSEL_XSPI1	CONF_PACK(SCKCR, 14, 1)
 #define SEL_PLL		CONF_PACK(SCKCR, 22, 1)
 
 enum rzt2h_clk_types {
 	CLK_TYPE_RZT2H_DIV = CLK_TYPE_CUSTOM,	/* Clock with divider */
 	CLK_TYPE_RZT2H_MUX,			/* Clock with clock source selector */
+	CLK_TYPE_RZT2H_FSELXSPI,		/* Clock with FSELXSPIn source selector */
 };
 
 #define DEF_DIV(_name, _id, _parent, _conf, _dtable) \
@@ -72,10 +79,13 @@ enum rzt2h_clk_types {
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
@@ -91,6 +101,8 @@ enum clk_ids {
 	CLK_SEL_CLK_PLL2,
 	CLK_SEL_CLK_PLL4,
 	CLK_PLL4D1,
+	CLK_PLL4D1_DIV3,
+	CLK_PLL4D1_DIV4,
 	CLK_SCI0ASYNC,
 	CLK_SCI1ASYNC,
 	CLK_SCI2ASYNC,
@@ -101,6 +113,8 @@ enum clk_ids {
 	CLK_SPI1ASYNC,
 	CLK_SPI2ASYNC,
 	CLK_SPI3ASYNC,
+	CLK_DIVSELXSPI0_SCKCR,
+	CLK_DIVSELXSPI1_SCKCR,
 
 	/* Module Clocks */
 	MOD_CLK_BASE,
@@ -112,6 +126,15 @@ static const struct clk_div_table dtable_1_2[] = {
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
@@ -126,6 +149,7 @@ static const char * const sel_clk_pll0[] = { ".loco", ".pll0" };
 static const char * const sel_clk_pll1[] = { ".loco", ".pll1" };
 static const char * const sel_clk_pll2[] = { ".loco", ".pll2" };
 static const char * const sel_clk_pll4[] = { ".loco", ".pll4" };
+static const char * const sel_clk_pll4d1_div3_div4[] = { ".pll4d1_div3", ".pll4d1_div4" };
 
 static const struct cpg_core_clk r9a09g077_core_clks[] __initconst = {
 	/* External Clock Inputs */
@@ -148,6 +172,8 @@ static const struct cpg_core_clk r9a09g077_core_clks[] __initconst = {
 		sel_clk_pll4, ARRAY_SIZE(sel_clk_pll4), CLK_MUX_READ_ONLY),
 
 	DEF_FIXED(".pll4d1", CLK_PLL4D1, CLK_SEL_CLK_PLL4, 1, 1),
+	DEF_FIXED(".pll4d1_div3", CLK_PLL4D1_DIV3, CLK_PLL4D1, 3, 1),
+	DEF_FIXED(".pll4d1_div4", CLK_PLL4D1_DIV4, CLK_PLL4D1, 4, 1),
 	DEF_DIV(".sci0async", CLK_SCI0ASYNC, CLK_PLL4D1, DIVSCI0ASYNC,
 		dtable_24_25_30_32),
 	DEF_DIV(".sci1async", CLK_SCI1ASYNC, CLK_PLL4D1, DIVSCI1ASYNC,
@@ -170,6 +196,13 @@ static const struct cpg_core_clk r9a09g077_core_clks[] __initconst = {
 	DEF_DIV(".spi3async", CLK_SPI3ASYNC, CLK_PLL4D1, DIVSPI3ASYNC,
 		dtable_24_25_30_32),
 
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
@@ -194,9 +227,15 @@ static const struct cpg_core_clk r9a09g077_core_clks[] __initconst = {
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
@@ -284,6 +323,152 @@ r9a09g077_cpg_mux_clk_register(struct device *dev,
 	return clk_hw->clk;
 }
 
+static unsigned int r9a09g077_cpg_fselxspi_get_divider(struct clk_hw *hw, unsigned long rate,
+						       unsigned int num_parents)
+{
+	struct clk_fixed_factor *ff;
+	struct clk_hw *parent_hw;
+	unsigned long best_rate;
+	unsigned int i;
+
+	for (i = 0; i < num_parents; i++) {
+		parent_hw = clk_hw_get_parent_by_index(hw, i);
+		best_rate = clk_hw_round_rate(parent_hw, rate);
+
+		if (best_rate == rate) {
+			ff = to_clk_fixed_factor(parent_hw);
+			return ff->div;
+		}
+	}
+
+	/* No parent could provide the exact rate - this should not happen */
+	return 0;
+}
+
+static int r9a09g077_cpg_fselxspi_determine_rate(struct clk_hw *hw,
+						 struct clk_rate_request *req)
+{
+	struct clk_divider *divider = to_clk_divider(hw);
+	unsigned long parent_rate, best = 0, now;
+	const struct clk_div_table *clkt;
+	unsigned long rate = req->rate;
+	unsigned int num_parents;
+	unsigned int divselxspi;
+	unsigned int div = 0;
+
+	if (!rate)
+		rate = 1;
+
+	/* Get the number of parents for FSELXSPIn */
+	num_parents = clk_hw_get_num_parents(req->best_parent_hw);
+
+	for (clkt = divider->table; clkt->div; clkt++) {
+		parent_rate = clk_hw_round_rate(req->best_parent_hw, rate * clkt->div);
+		/* Skip if parent can't provide any valid rate */
+		if (!parent_rate)
+			continue;
+
+		/* Determine which DIVSELXSPIn divider (3 or 4) provides this parent_rate */
+		divselxspi = r9a09g077_cpg_fselxspi_get_divider(req->best_parent_hw, parent_rate,
+								num_parents);
+		if (!divselxspi)
+			continue;
+
+		/*
+		 * DIVSELXSPIx supports 800MHz and 600MHz operation.
+		 * When divselxspi is 4 (600MHz operation), only FSELXSPIn dividers of 8 and 16
+		 * are supported. Otherwise, when divselxspi is 3 (800MHz operation),
+		 * dividers of 6, 8, 16, 32, and 64 are supported. This check ensures that
+		 * FSELXSPIx is set correctly based on hardware limitations.
+		 */
+		if (divselxspi == 4 && (clkt->div != 8 && clkt->div != 16))
+			continue;
+		now = DIV_ROUND_UP_ULL(parent_rate, clkt->div);
+		if (abs(rate - now) < abs(rate - best)) {
+			div = clkt->div;
+			best = now;
+			req->best_parent_rate = parent_rate;
+		}
+	}
+
+	if (!div) {
+		req->best_parent_rate = clk_hw_round_rate(req->best_parent_hw, 1);
+		divselxspi = r9a09g077_cpg_fselxspi_get_divider(req->best_parent_hw,
+								req->best_parent_rate,
+								num_parents);
+		/* default to divider 3 which will result DIVSELXSPIn = 800 MHz */
+		if (!divselxspi)
+			divselxspi = 3;
+		/*
+		 * Use the maximum divider based on the parent clock rate:
+		 *  - 64 when DIVSELXSPIx is 800 MHz (divider = 3)
+		 *  - 16 when DIVSELXSPIx is 600 MHz (divider = 4)
+		 */
+		if (divselxspi == 3)
+			div = 64;
+		else
+			div = 16;
+	}
+
+	req->rate = DIV_ROUND_UP_ULL(req->best_parent_rate, div);
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
@@ -298,6 +483,8 @@ r9a09g077_cpg_clk_register(struct device *dev, const struct cpg_core_clk *core,
 		return r9a09g077_cpg_div_clk_register(dev, core, addr, pub);
 	case CLK_TYPE_RZT2H_MUX:
 		return r9a09g077_cpg_mux_clk_register(dev, core, addr, pub);
+	case CLK_TYPE_RZT2H_FSELXSPI:
+		return r9a09g077_cpg_fselxspi_div_clk_register(dev, core, addr, pub);
 	default:
 		return ERR_PTR(-EINVAL);
 	}
-- 
2.51.2


