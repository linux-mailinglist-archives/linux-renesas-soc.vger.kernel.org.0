Return-Path: <linux-renesas-soc+bounces-26101-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ED8FCDCE41
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Dec 2025 17:51:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 65DDB3029D2E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Dec 2025 16:51:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EBD033711E;
	Wed, 24 Dec 2025 16:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FEeUMPgF"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9666B32937A
	for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Dec 2025 16:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766595064; cv=none; b=RUjfYfqFwlW3x5LNLEYL64IumZZSOIXoQVdzy5rNeUfQUI0chFpwcSW7ugkZpjKOYF1YsMmi+fvguZvS6HlxACkFBvA+zxRXMoSeskXuCmipwBr9/hyYW17JC5nnvJ0PbCJnXWtUueRiIBfKuxikPBU64GqVUaNdrhByrMrNdi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766595064; c=relaxed/simple;
	bh=tQ2MoAosKlRlrd/npA5g9SYg6s0JOpLKa8kN/mDNYvM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sWDH40ChUbvCh2DpkpBMP339nWrEEa44AG1c1eoekiKBqM196rXzqScfMCat7IZYjbLjttF4aKOSuGaQN8W8GDtFeuLK7+gFrbm1wlb3gym9G0re/T79s4hABm4hoqoAkZbErgL72PgOtDvzYk0unkHoPyedTvseHS+Kyl3hi14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FEeUMPgF; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-477b198f4bcso39685725e9.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Dec 2025 08:51:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766595061; x=1767199861; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/EK1HCfHzeEgXjAFyaR94Cl2pyhmBKIAz+AoGEI4/Ug=;
        b=FEeUMPgFPZRQR8AIiWtBdhMp83dEibSTYNX/jn4RDkuFzZGBE/5xjefWHuhRpwJ+xV
         yOW6yKBRYLOy8yd101Sw8AwxQuca/L1r6pEX6OTU6diIcYr2Xbqn4xMfjr7Dx3ZfiZaI
         J0C4W8AgQI3rHemFk64NNIAqbAmtJa7F9cd8jjNu0QsR7Rmvp+H6gmcDd+anc993PzUj
         8mEG6zFhfkI+hvWfhC3FRxzmM/71IeH2Nfl+90g6hMw50exAxKZtBHL6Pbxxpa5h0tta
         6SuyrhsylU0R3QUR8YD3lpnwnu5bdT1Jiek0v4sFS9VksDCgHkRbL910sgTMxSxaq0Aw
         AKHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766595061; x=1767199861;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/EK1HCfHzeEgXjAFyaR94Cl2pyhmBKIAz+AoGEI4/Ug=;
        b=OtqEgdPm99Du5h8g/ZIg6DMUMmiJ2yXdNoeD5xxH9g009jF/4O3O+XEd79N48OSIp7
         9NMLaLtWBFhfqNMCUKdHvyiBTkJVyXK3vvTiKhGgkHmi0SSeU+dPfFdxubPcIE9d3xGh
         2iqKdw41YQv+NC2AMCmgui50BXIESJRVsF6Axmw1k4RsQ1gJ55wTlF11T3m7jYMVjPCm
         kAy/Oma7LagWl0qhyaMrwSGnj+0lnO82sDVpN+dpqOo7eArdVh7Xbpj+1qZo+fJa0Q83
         /tM4WVX6dy3M93cAs//I5Cxs0tDGFrjKNV/x72aayPaQjVT8u5kdiLoUG61a4s+cNmsT
         IVOg==
X-Gm-Message-State: AOJu0YwrYgRb0t+nw5JMcq1/XkfRzCW9pkgGp2r2H7lEA2HxRLn+K/k7
	9h7QBAaY/dAeB7LjdBV+PI9WZKOI4q6u1cw3lOHGwfRGUcXmGxBt11J0
X-Gm-Gg: AY/fxX4O6jb2K27y2MFVwJFNOPMI+Hcy+rVT1TQDVzDO3Y9eUNkBXoeOMPZF8U/hoW+
	IWZRPwoMruCXf+EpkLU7Oh+uM8FuSfblfGyGEeh5wbN/IhFClCABcDLfLyB+873HCWlUwGLAUlV
	rlElJcChc/bZ0Zf3buntN/nhNo9PpWRP6iu4Upweko0p12ktyvP1P4YAncgGMFzX2YGwGAq5DWo
	qsuktkIF87e1ss8gY62JcVj/gRZNlkx2K6bQ4gxxOeCx6rscovZcDx6qc6C0VIGJiZYtDXrD2UZ
	carQOk+yZzLmxv5F+oOYQ4WFfl3soMGEM9xi0JLkTMxDdgRmTV0zl9mYU70NskevrDOEusdnBFM
	0U1qW/fVbCgMg6hjglkwU6nyKPOd6nE7G9bSTCs3zMhiyuZY7hwo5nmRwVhwQMHb/IjXTvRM2iR
	j5X5nK1g0uQKOJUcgotunlWAhVfMi2Rt7+eYy+TlwTB74M9G6nVoetWGv6z6OPcJjn2BkUr6lmB
	HTtiVr084TX6Z9/kYDeUWhg
X-Google-Smtp-Source: AGHT+IFMmmdKR2ai07VwzQ+dheytzl1jN/5R2f9ax4s3XC55YUFsi5RIoHlEF2i6KCabE4OZezv3nA==
X-Received: by 2002:a05:600c:4fc6:b0:477:333a:f71f with SMTP id 5b1f17b1804b1-47d19576cc6mr189259755e9.17.1766595060884;
        Wed, 24 Dec 2025 08:51:00 -0800 (PST)
Received: from iku.Home ([2a06:5906:61b:2d00:3371:7b65:aaf4:d2e4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be3ac5409sm136482305e9.15.2025.12.24.08.50.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 08:51:00 -0800 (PST)
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
Subject: [PATCH 2/4] clk: renesas: r9a09g077: Add CANFD clocks
Date: Wed, 24 Dec 2025 16:50:47 +0000
Message-ID: <20251224165049.3384870-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251224165049.3384870-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20251224165049.3384870-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

The Renesas RZ/T2H (R9A09G077) and RZ/N2H (R9A09G087) SoCs have a CANFD
peripheral which has three input clocks PCLKM (peripheral clock),
PCLKH (RAM clock) and PCLKCAN (CANFD clock).

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/clk/renesas/r9a09g077-cpg.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/renesas/r9a09g077-cpg.c b/drivers/clk/renesas/r9a09g077-cpg.c
index dee25cdadf1d..93b15e06a19b 100644
--- a/drivers/clk/renesas/r9a09g077-cpg.c
+++ b/drivers/clk/renesas/r9a09g077-cpg.c
@@ -47,6 +47,7 @@
 #define FSELXSPI1	CONF_PACK(SCKCR, 8, 3)
 #define DIVSEL_XSPI0	CONF_PACK(SCKCR, 6, 1)
 #define DIVSEL_XSPI1	CONF_PACK(SCKCR, 14, 1)
+#define FSELCANFD	CONF_PACK(SCKCR, 20, 1)
 #define SEL_PLL		CONF_PACK(SCKCR, 22, 1)
 
 #define DIVCA55C0	CONF_PACK(SCKCR2, 8, 1)
@@ -85,7 +86,7 @@ enum rzt2h_clk_types {
 
 enum clk_ids {
 	/* Core Clock Outputs exported to DT */
-	LAST_DT_CORE_CLK = R9A09G077_XSPI_CLK1,
+	LAST_DT_CORE_CLK = R9A09G077_PCLKCAN,
 
 	/* External Input Clocks */
 	CLK_EXTAL,
@@ -103,6 +104,9 @@ enum clk_ids {
 	CLK_PLL4D1,
 	CLK_PLL4D1_DIV3,
 	CLK_PLL4D1_DIV4,
+	CLK_PLL4D3,
+	CLK_PLL4D3_DIV10,
+	CLK_PLL4D3_DIV20,
 	CLK_SCI0ASYNC,
 	CLK_SCI1ASYNC,
 	CLK_SCI2ASYNC,
@@ -150,6 +154,7 @@ static const char * const sel_clk_pll1[] = { ".loco", ".pll1" };
 static const char * const sel_clk_pll2[] = { ".loco", ".pll2" };
 static const char * const sel_clk_pll4[] = { ".loco", ".pll4" };
 static const char * const sel_clk_pll4d1_div3_div4[] = { ".pll4d1_div3", ".pll4d1_div4" };
+static const char * const sel_clk_pll4d3_div10_div20[] = { ".pll4d3_div10", ".pll4d3_div20" };
 
 static const struct cpg_core_clk r9a09g077_core_clks[] __initconst = {
 	/* External Clock Inputs */
@@ -174,6 +179,9 @@ static const struct cpg_core_clk r9a09g077_core_clks[] __initconst = {
 	DEF_FIXED(".pll4d1", CLK_PLL4D1, CLK_SEL_CLK_PLL4, 1, 1),
 	DEF_FIXED(".pll4d1_div3", CLK_PLL4D1_DIV3, CLK_PLL4D1, 3, 1),
 	DEF_FIXED(".pll4d1_div4", CLK_PLL4D1_DIV4, CLK_PLL4D1, 4, 1),
+	DEF_FIXED(".pll4d3", CLK_PLL4D3, CLK_SEL_CLK_PLL4, 3, 1),
+	DEF_FIXED(".pll4d3_div10", CLK_PLL4D3_DIV10, CLK_PLL4D3, 10, 1),
+	DEF_FIXED(".pll4d3_div20", CLK_PLL4D3_DIV20, CLK_PLL4D3, 20, 1),
 
 	DEF_DIV(".sci0async", CLK_SCI0ASYNC, CLK_PLL4D1, DIVSCI0ASYNC,
 		dtable_24_25_30_32),
@@ -232,6 +240,8 @@ static const struct cpg_core_clk r9a09g077_core_clks[] __initconst = {
 			 FSELXSPI0, dtable_6_8_16_32_64),
 	DEF_DIV_FSELXSPI("XSPI_CLK1", R9A09G077_XSPI_CLK1, CLK_DIVSELXSPI1_SCKCR,
 			 FSELXSPI1, dtable_6_8_16_32_64),
+	DEF_MUX("PCLKCAN", R9A09G077_PCLKCAN, FSELCANFD,
+		sel_clk_pll4d3_div10_div20, ARRAY_SIZE(sel_clk_pll4d3_div10_div20), 0),
 };
 
 static const struct mssr_mod_clk r9a09g077_mod_clks[] __initconst = {
@@ -251,6 +261,7 @@ static const struct mssr_mod_clk r9a09g077_mod_clks[] __initconst = {
 	DEF_MOD("adc1", 207, R9A09G077_CLK_PCLKH),
 	DEF_MOD("adc2", 225, R9A09G077_CLK_PCLKM),
 	DEF_MOD("tsu", 307, R9A09G077_CLK_PCLKL),
+	DEF_MOD("canfd", 310, R9A09G077_CLK_PCLKM),
 	DEF_MOD("gmac0", 400, R9A09G077_CLK_PCLKM),
 	DEF_MOD("ethsw", 401, R9A09G077_CLK_PCLKM),
 	DEF_MOD("ethss", 403, R9A09G077_CLK_PCLKM),
-- 
2.52.0


