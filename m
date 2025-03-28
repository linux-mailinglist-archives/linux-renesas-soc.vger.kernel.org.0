Return-Path: <linux-renesas-soc+bounces-15036-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B3BE9A75129
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Mar 2025 21:02:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EEC4D3AA6B5
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Mar 2025 20:02:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DAB31F2BAE;
	Fri, 28 Mar 2025 20:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aNXKDXXJ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BF501F09A3;
	Fri, 28 Mar 2025 20:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743192094; cv=none; b=vD2cK42TkWQEvS0hQ8AS1GA1zsua40OTNcsqV7Rk42zTGPwI6jUx3MRpPNyMVqYPR0fJX69NJLgyMvSYqzUp6LcJLuXzC6PbBNM1DmEsFH+dax35XEoncI6FBztp2njvYO1EXbq0qMDCFmchN+RTXLaq6yAIfz36Lumj3mu6LLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743192094; c=relaxed/simple;
	bh=ugyqHTFe5dAIP8w+jtcX3EeXua5/7kTcCP6vhlCOgAQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Bq2f3XtuYnS1JCfCq7YX5nltffQ42nSa2xF0NUaFQbwHLj43Xt0v1KeW+aLEi/M9e0InwNP+1G7FbIab3GxcOguotxVCtjs1QpUvlgyKRx/3H9Cuq3dw7nGGFEEMqnYtRvFEIwrXFtoKLrv1m4/VfmKhmzLnZws3sleqJojPoMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aNXKDXXJ; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43948021a45so25320355e9.1;
        Fri, 28 Mar 2025 13:01:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743192089; x=1743796889; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pWPeody0yl6K0oerpL14uBR8W8cRKVcUF0FRIWM0S0M=;
        b=aNXKDXXJtckOAelP7w5zCcShTxMqYFkibOBKRO4fldFuP14qTs3ND500VYCMixLK2Z
         8TqWV43m49jhED72ykdTAgRR9mfMJPs83+ghHgFFwNOAKPfHejgB/fnjSSQKCuU2dtGE
         g1BuAbVHuMTvBe71Kax/MOKInac2iknzRHNU4FjpZA95A364H3wITkSxfnj9GR1IiNf/
         UQg7jY5r0/7ZdMUsM4Kij/QevQo0Nn+f2cQq/g7scoWSxKncouxoO7b81pH8l7sKBS4R
         eD4nhLOrWonDx+fXXWsb/Odt8pXCjV3Gb12GSoxqIl7256gHwCVRmXIoIVRIV9JdcmDA
         iONw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743192089; x=1743796889;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pWPeody0yl6K0oerpL14uBR8W8cRKVcUF0FRIWM0S0M=;
        b=bpkQo9Iib1HzEsL8nfAJLPPRjws8YEw6cg79G7SKRpzfBZvvpz54OazXQfZutQL8x8
         z4DPzj/GG3q/csa+lkd4v5p+mEVyaBW4+6R3Bmfh3lNSKCIEzpyfQ5cDXTZ0oRMQlG6H
         ZgWLie8rbsO6CUllCjbthzN3AP+7TQaIj4WzSMXfwSC28GoSkLGHcR6EnvsgsChbEey9
         CbxSTvxANENXfb/d4R07UJ4kfvXbuEpEwkmjWjW7BJvIHcj7/hPThrbVVzsCgI627+AR
         pfZItycjvjBsvHyfk4ZXvoaMnMNk5uXnL4KR9wkqNJ8mfbpV4IXv1jSTl8qOUtecp5wY
         vHFA==
X-Forwarded-Encrypted: i=1; AJvYcCVEPXUpOMEl4Y9O0YNj86aevkFipC65NsdVRcpHAhHlwX55TnS3YnvP/STqTJEJJkZmaYdRrIoyWkLb@vger.kernel.org, AJvYcCWOtsnNUrSCjv4ioz78E4sjQgW7dw5if3QyEgMY2xo/idd5uEudore9Za1Pmkd2Z9lSgEpJs5maaAZl2mBL@vger.kernel.org, AJvYcCXp/RybHKkXANWoxsxXU/6iKJ69sby8/zgUie6XytH8/zswDEYlLELRDL2i+FmoBZqtWkfAUidOThdn@vger.kernel.org
X-Gm-Message-State: AOJu0YxTTZXtXJgRK07X35vXEEv/uRx/brv+jTqWRwPMYLGw2nC3Vmm9
	3uBR7Lf89kSjJwJcYiYj7XW+ct+CukhYhZ78zRQB/97XzLNTMgMW
X-Gm-Gg: ASbGncsm0DjRHm3x9ARGouIz9u9R+NgF6xqDHnxyz9dEGRp/3E/zCcfnv17n45Kx5lE
	2E3y0hQOeeKmcAcJlMyWQO8x9S7PKqSabTqAqrQljSjkFWe1Ka5B2rWTO/EZc7yvN6YallWqb1g
	X9v35Er88M5qvyA+pOfvD0+SnSE/RSckp9fIPGWBXJVrU0fK5EvsIWTHK8LFhO1nuxQO2ci9zIA
	kMqlkIOv87OWN5ZhCb4lxTlahuvUdp3PvF+HfGJalhqFrv+0MzpNdecovqThjpKgOihUgmfwhWk
	WR+SumthG0Ugo0DepcEE/Vs7jZ+07JoquqGCkr221RneISr/SljFAi2mCiazgs3QlwZjhPWunYf
	TGw==
X-Google-Smtp-Source: AGHT+IF3E3bidKyccmvEGIqdEplM0EWPThAIKx2qf+HjkUECmwqCjSCjc6xm9gm0yxYfaL/mlrZXOw==
X-Received: by 2002:a05:6000:184c:b0:39c:e0e:a1d8 with SMTP id ffacd0b85a97d-39c120de325mr349436f8f.21.1743192089310;
        Fri, 28 Mar 2025 13:01:29 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:b400:d08:873:badd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d8fcceaaasm37930955e9.18.2025.03.28.13.01.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 13:01:28 -0700 (PDT)
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
Subject: [PATCH 5/6] clk: renesas: r9a09g057: Add clock and reset entries for USB2
Date: Fri, 28 Mar 2025 20:01:04 +0000
Message-ID: <20250328200105.176129-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250328200105.176129-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250328200105.176129-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add clock and reset entries for USB2.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/clk/renesas/r9a09g057-cpg.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/renesas/r9a09g057-cpg.c b/drivers/clk/renesas/r9a09g057-cpg.c
index da20dbaead1f..3c40e36259fe 100644
--- a/drivers/clk/renesas/r9a09g057-cpg.c
+++ b/drivers/clk/renesas/r9a09g057-cpg.c
@@ -16,7 +16,7 @@
 
 enum clk_ids {
 	/* Core Clock Outputs exported to DT */
-	LAST_DT_CORE_CLK = R9A09G057_IOTOP_0_SHCLK,
+	LAST_DT_CORE_CLK = R9A09G057_GBETH_1_CLK_PTP_REF_I,
 
 	/* External Input Clocks */
 	CLK_AUDIO_EXTAL,
@@ -41,6 +41,7 @@ enum clk_ids {
 	CLK_PLLDTY_ACPU,
 	CLK_PLLDTY_ACPU_DIV2,
 	CLK_PLLDTY_ACPU_DIV4,
+	CLK_PLLDTY_DIV8,
 	CLK_PLLDTY_DIV16,
 	CLK_PLLDTY_RCPU,
 	CLK_PLLDTY_RCPU_DIV4,
@@ -104,6 +105,7 @@ static const struct cpg_core_clk r9a09g057_core_clks[] __initconst = {
 	DEF_DDIV(".plldty_acpu", CLK_PLLDTY_ACPU, CLK_PLLDTY, CDDIV0_DIVCTL2, dtable_2_64),
 	DEF_FIXED(".plldty_acpu_div2", CLK_PLLDTY_ACPU_DIV2, CLK_PLLDTY_ACPU, 1, 2),
 	DEF_FIXED(".plldty_acpu_div4", CLK_PLLDTY_ACPU_DIV4, CLK_PLLDTY_ACPU, 1, 4),
+	DEF_FIXED(".plldty_div8", CLK_PLLDTY_DIV8, CLK_PLLDTY, 1, 8),
 	DEF_FIXED(".plldty_div16", CLK_PLLDTY_DIV16, CLK_PLLDTY, 1, 16),
 	DEF_DDIV(".plldty_rcpu", CLK_PLLDTY_RCPU, CLK_PLLDTY, CDDIV3_DIVCTL2, dtable_2_64),
 	DEF_FIXED(".plldty_rcpu_div4", CLK_PLLDTY_RCPU_DIV4, CLK_PLLDTY_RCPU, 1, 4),
@@ -126,6 +128,8 @@ static const struct cpg_core_clk r9a09g057_core_clks[] __initconst = {
 	DEF_DDIV("ca55_0_coreclk3", R9A09G057_CA55_0_CORE_CLK3, CLK_PLLCA55,
 		 CDDIV1_DIVCTL3, dtable_1_8),
 	DEF_FIXED("iotop_0_shclk", R9A09G057_IOTOP_0_SHCLK, CLK_PLLCM33_DIV16, 1, 1),
+	DEF_FIXED("usb2_0_clk_core0", R9A09G057_USB2_0_CLK_CORE0, CLK_QEXTAL, 1, 1),
+	DEF_FIXED("usb2_0_clk_core1", R9A09G057_USB2_0_CLK_CORE1, CLK_QEXTAL, 1, 1),
 };
 
 static const struct rzv2h_mod_clk r9a09g057_mod_clks[] __initconst = {
@@ -219,6 +223,16 @@ static const struct rzv2h_mod_clk r9a09g057_mod_clks[] __initconst = {
 						BUS_MSTOP(8, BIT(4))),
 	DEF_MOD("sdhi_2_aclk",			CLK_PLLDTY_ACPU_DIV4, 10, 14, 5, 14,
 						BUS_MSTOP(8, BIT(4))),
+	DEF_MOD("usb2_0_u2h0_hclk",		CLK_PLLDTY_DIV8, 11, 3, 5, 19,
+						BUS_MSTOP(7, BIT(7))),
+	DEF_MOD("usb2_0_u2h1_hclk",		CLK_PLLDTY_DIV8, 11, 4, 5, 20,
+						BUS_MSTOP(7, BIT(8))),
+	DEF_MOD("usb2_0_u2p_exr_cpuclk",	CLK_PLLDTY_ACPU_DIV4, 11, 5, 5, 21,
+						BUS_MSTOP(7, BIT(9))),
+	DEF_MOD("usb2_0_pclk_usbtst0",		CLK_PLLDTY_ACPU_DIV4, 11, 6, 5, 22,
+						BUS_MSTOP(7, BIT(10))),
+	DEF_MOD("usb2_0_pclk_usbtst1",		CLK_PLLDTY_ACPU_DIV4, 11, 7, 5, 23,
+						BUS_MSTOP(7, BIT(11))),
 	DEF_MOD("cru_0_aclk",			CLK_PLLDTY_ACPU_DIV2, 13, 2, 6, 18,
 						BUS_MSTOP(9, BIT(4))),
 	DEF_MOD_NO_PM("cru_0_vclk",		CLK_PLLVDO_CRU0, 13, 3, 6, 19,
@@ -286,6 +300,10 @@ static const struct rzv2h_reset r9a09g057_resets[] __initconst = {
 	DEF_RST(10, 7, 4, 24),		/* SDHI_0_IXRST */
 	DEF_RST(10, 8, 4, 25),		/* SDHI_1_IXRST */
 	DEF_RST(10, 9, 4, 26),		/* SDHI_2_IXRST */
+	DEF_RST(10, 12, 4, 29),		/* USB2_0_U2H0_HRESETN */
+	DEF_RST(10, 13, 4, 30),		/* USB2_0_U2H1_HRESETN */
+	DEF_RST(10, 14, 4, 31),		/* USB2_0_U2P_EXL_SYSRST */
+	DEF_RST(10, 15, 5, 0),		/* USB2_0_PRESETN */
 	DEF_RST(12, 5, 5, 22),		/* CRU_0_PRESETN */
 	DEF_RST(12, 6, 5, 23),		/* CRU_0_ARESETN */
 	DEF_RST(12, 7, 5, 24),		/* CRU_0_S_RESETN */
-- 
2.49.0


