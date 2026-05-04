Return-Path: <linux-renesas-soc+bounces-31949-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2KO3F3Cz+GmWzAIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31949-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 04 May 2026 16:55:44 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 13EDA4C0372
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 04 May 2026 16:55:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4B24130A23B9
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 May 2026 14:46:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B78A03E0C7A;
	Mon,  4 May 2026 14:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FYpxs5Uc"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53B873DF000
	for <linux-renesas-soc@vger.kernel.org>; Mon,  4 May 2026 14:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777905931; cv=none; b=sRCFHVecZOWmMy1JyqWU9Lr9dxcaWqtwvTjnKwAY9qjjF8GgxMjxge6vnne8LDIwAP1yhJLhzytmR+ycWPX5DgucN+Qxv4NQlPcJYs13nxA4Um9s/05FG+eAq9DxNVMfbIzwMJF+REeMzqRrHtalp7QlK+Qi45Z3O4c4xgEB3h4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777905931; c=relaxed/simple;
	bh=IuPuNT0iWwufeeItnNYuVUA1dN8Pvp00SEXIeDTiV0g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZnNX3qpvCXNAz1yVdhYGXRT5297YDl93dx1wOjI711wopsPLKszDjTBeUr56QUl0EWJN5ry5sVQZ96ofWkz38rNdYbAIlewmEKuZFHus5wgl9tMfNPofmkjuVv/d0gSlvzXhq3C9yplQAej4/GbyYZae+0GE20UHkG0UGfl3FHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FYpxs5Uc; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-48a7fe4f40bso44075695e9.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 04 May 2026 07:45:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777905928; x=1778510728; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X5fkkKuXHHDwakN2Kt3vbnokuaWWi6ricw4daqx44Ro=;
        b=FYpxs5UcX1THOKjpk/RZYZB1KPAb2XaPtY5t82ilvKWkBpyFr01qW1G1G4Vn+i98qb
         CDvyxjCn0yxLaiUff1SHCg8uSFSkCppiAucbcmXSKgWWRWAyMlOTQ8tl4XbY8d9D3Zcz
         LMI/g1BoOmas5hICsjoebSlUkiZtgoQRtcPbEywM1E81XNzJ/UDWRNUCpD2TUKzBsuN9
         /G4xpbWwE0gigs0I7oVlaCTQCT5XYqwoCH3qmBOLMTnx+fHPW2x+6GFNFiWTfeq/g26p
         MkFdzq7PDJujMBuRMtzJPAimiwtblvEoVT6gZALtqmi590+ZtCRVRsOHagX5W19l/+Wy
         6Amw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777905928; x=1778510728;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=X5fkkKuXHHDwakN2Kt3vbnokuaWWi6ricw4daqx44Ro=;
        b=J6fgFXIC5meqen7WWnE+FQz3lJ5H2fTrC9W32P/oWkpP4h6NF+iGsuug8TIyEEql94
         KER9Ik7AJ1BqlgiW3nIBzasHxzJK/VOe7kYtsI82V7775Cl2YJeWm/aMkw0FzswAMxWd
         Q2jmNtZjVQ1I3kUngR5EyPyKq6kZeYjq9BsWMY0PkKKUL+zPurzj6u+DXTIvVjx3SzD8
         d5uTLBPHoGyiQtzJucrTKDadLTuloNB3xP5UxlCIgsa0StG5bYO2vO54SmUmA9oByFEJ
         IbJj/xphaVAYeb59PL9T1UvJf2Ym0o+faBdyB4V8MMqtGIzBXPV5uWfC1U1hjQCZQzzA
         mvRA==
X-Forwarded-Encrypted: i=1; AFNElJ/FSVJPtPkZCCUfWuYSguRHGptXa3htcRbCpD32K8HF88g3EDLWXFKLawcPkkLYIPYBpgS1ckaoV5xeCLncRgJddg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyBgiH49M8U8U3s6w+tgh5DshotaLMnd5qSD09FiPZCKZBbcuiR
	WALt2isQILEIlhNihLQt0GgPkcR5VcXntYM2V4pAEWzzcDPsjNRv6+8Z
X-Gm-Gg: AeBDieuuvgcVzscoZjNsni4EsbwJL0qNlWCabLaq3dE73I8Nk9bpDSdSB/C+3hSsAEt
	mUaruwy+4kjw2KQ6z5xtIpb98XTSs1Kl5Aeeo0IHfsPIkoQofjWIV14OMwCEqn9G53LrFFfDxPZ
	NT6op8dhASNVvPwmeAgW+X7IgESlkNxJ718YHv65JeGMUEIk+DRNVDtXjf7KIVjjSh1W3vhajjo
	Hu7tdXtTztgYpzfwLGlYOsW/Ablj+UaHoIVUSYT0gSCKYNV+KeS+jXyNk5W2qpdVsMeVVXINn6a
	OXV9wzjsHjDudE/Mz/xVIAxod3P0o/pjKVZu+jPwAPrLzc9yTi5+efI/3RFA5WFiGaZR8aCo/Jq
	iU99hlrryxa/jZnJJ1GybFRvTloxoqDYKpsnUxf2XfuUKpwpMaopDmOBsubnLVVgGv32Hdzt+LS
	Kfishb3EDcUKju6TglX/yyiiODg9gCM2i0ZsT42fT5OD6auAVgLQgVfW2RKyoaPpBNkx2Otw==
X-Received: by 2002:a05:600c:c170:b0:48a:80cb:1bb4 with SMTP id 5b1f17b1804b1-48a98671d52mr158941185e9.22.1777905927533;
        Mon, 04 May 2026 07:45:27 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:6444:b23f:58b2:338c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-44a981defa6sm24371239f8f.24.2026.05.04.07.45.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 07:45:27 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Brian Masney <bmasney@redhat.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH 2/3] clk: renesas: rzg3s/rzg3l: Simplify PLL configuration macro
Date: Mon,  4 May 2026 15:45:18 +0100
Message-ID: <20260504144523.153906-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260504144523.153906-1-biju.das.jz@bp.renesas.com>
References: <20260504144523.153906-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 13EDA4C0372
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-31949-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[bp.renesas.com,redhat.com,vger.kernel.org,gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-0.996];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,renesas.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

From: Biju Das <biju.das.jz@bp.renesas.com>

Replace the per-SoC G3S_PLL146_CONF() and G3L_PLL1467_CONF() macros with
a unified CPG_PLL_CONF(stby, setting) macro defined in rzg2l-cpg.h.

Drop the now-redundant GET_REG_SAMPLL_CLK1() and GET_REG_SAMPLL_SETTING()
macros, replacing the latter with CPG_PLL1_SETTING_OFFSET() using
FIELD_GET() to extract the offset value. Update RZG3L_PLL_MON_OFFSET() to
use CPG_PLL_STBY_OFFSET() + 0xc directly.

No functional changes.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/clk/renesas/r9a08g045-cpg.c |  5 +----
 drivers/clk/renesas/r9a08g046-cpg.c |  7 ++-----
 drivers/clk/renesas/rzg2l-cpg.c     | 11 +++++------
 drivers/clk/renesas/rzg2l-cpg.h     |  1 +
 4 files changed, 9 insertions(+), 15 deletions(-)

diff --git a/drivers/clk/renesas/r9a08g045-cpg.c b/drivers/clk/renesas/r9a08g045-cpg.c
index 1232fec913eb..9610676058de 100644
--- a/drivers/clk/renesas/r9a08g045-cpg.c
+++ b/drivers/clk/renesas/r9a08g045-cpg.c
@@ -50,9 +50,6 @@
 #define G3S_SEL_SDHI1		SEL_PLL_PACK(G3S_CPG_SDHI_DSEL, 4, 2)
 #define G3S_SEL_SDHI2		SEL_PLL_PACK(G3S_CPG_SDHI_DSEL, 8, 2)
 
-/* PLL 1/4/6 configuration registers macro. */
-#define G3S_PLL146_CONF(clk1, clk2, setting)	((clk1) << 22 | (clk2) << 12 | (setting))
-
 #define DEF_G3S_MUX(_name, _id, _conf, _parent_names, _mux_flags, _clk_flags) \
 	DEF_TYPE(_name, _id, CLK_TYPE_MUX, .conf = (_conf), \
 		 .parent_names = (_parent_names), \
@@ -134,7 +131,7 @@ static const struct cpg_core_clk r9a08g045_core_clks[] __initconst = {
 
 	/* Internal Core Clocks */
 	DEF_FIXED(".osc_div1000", CLK_OSC_DIV1000, CLK_EXTAL, 1, 1000),
-	DEF_G3S_PLL(".pll1", CLK_PLL1, CLK_EXTAL, G3S_PLL146_CONF(0x4, 0x8, 0x100),
+	DEF_G3S_PLL(".pll1", CLK_PLL1, CLK_EXTAL, CPG_PLL_CONF(0, 0x100),
 		    1100000000UL),
 	DEF_FIXED(".pll2", CLK_PLL2, CLK_EXTAL, 200, 3),
 	DEF_FIXED(".pll3", CLK_PLL3, CLK_EXTAL, 200, 3),
diff --git a/drivers/clk/renesas/r9a08g046-cpg.c b/drivers/clk/renesas/r9a08g046-cpg.c
index 0004b9516fdf..0657dc01ff8a 100644
--- a/drivers/clk/renesas/r9a08g046-cpg.c
+++ b/drivers/clk/renesas/r9a08g046-cpg.c
@@ -56,9 +56,6 @@
 #define G3L_SEL_ETH1_CLK_TX_I	SEL_PLL_PACK(G3L_CPG_ETH_SSEL, 11, 1)
 #define G3L_SEL_ETH1_CLK_RX_I	SEL_PLL_PACK(G3L_CPG_ETH_SSEL, 12, 1)
 
-/* PLL 1/4/6/7 configuration registers macro. */
-#define G3L_PLL1467_CONF(clk1, clk2, setting)	((clk1) << 22 | (clk2) << 12 | (setting))
-
 enum clk_ids {
 	/* Core Clock Outputs exported to DT */
 	LAST_DT_CORE_CLK = R9A08G046_USB_SCLK,
@@ -154,11 +151,11 @@ static const struct cpg_core_clk r9a08g046_core_clks[] __initconst = {
 	DEF_INPUT("eth1_rxc_rx_clk", CLK_ETH1_RXC_RX_CLK_IN),
 
 	/* Internal Core Clocks */
-	DEF_G3L_PLL(".pll1", CLK_PLL1, CLK_EXTAL, G3L_PLL1467_CONF(0x4, 0x8, 0x100),
+	DEF_G3L_PLL(".pll1", CLK_PLL1, CLK_EXTAL, CPG_PLL_CONF(0, 0x100),
 		    1200000000UL),
 	DEF_FIXED(".pll2", CLK_PLL2, CLK_EXTAL, 200, 3),
 	DEF_FIXED(".pll3", CLK_PLL3, CLK_EXTAL, 200, 3),
-	DEF_G3L_PLL(".pll6", CLK_PLL6, CLK_EXTAL, G3L_PLL1467_CONF(0x54, 0x58, 0),
+	DEF_G3L_PLL(".pll6", CLK_PLL6, CLK_EXTAL, CPG_PLL_CONF(0x50, 0),
 		    500000000UL),
 	DEF_FIXED(".pll2_div2", CLK_PLL2_DIV2, CLK_PLL2, 1, 2),
 	DEF_FIXED(".pll3_div2", CLK_PLL3_DIV2, CLK_PLL3, 1, 2),
diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
index c6f9f3417ce9..7e5173a37f3a 100644
--- a/drivers/clk/renesas/rzg2l-cpg.c
+++ b/drivers/clk/renesas/rzg2l-cpg.c
@@ -58,14 +58,15 @@
 #define RZG3S_DIV_NF		GENMASK(12, 1)
 #define RZG3S_SEL_PLL		BIT(0)
 
+#define CPG_PLL1_SETTING_OFFSET(conf)	FIELD_GET(GENMASK(11, 0), (conf))
 #define CPG_PLL_STBY_OFFSET(conf)	FIELD_GET(GENMASK(23, 12), (conf))
 #define CPG_PLL_CLK1_OFFSET(x)		(CPG_PLL_STBY_OFFSET(x) + 0x4)
 #define CPG_PLL_CLK2_OFFSET(x)		(CPG_PLL_STBY_OFFSET(x) + 0x8)
 
-#define RZG3L_PLL_STBY_OFFSET(x)	(GET_REG_SAMPLL_CLK1(x) - 0x4)
+#define RZG3L_PLL_STBY_OFFSET(x)	(CPG_PLL1_SETTING_OFFSET(x))
 #define RZG3L_PLL_STBY_RESETB		BIT(0)
 #define RZG3L_PLL_STBY_RESETB_WEN	BIT(16)
-#define RZG3L_PLL_MON_OFFSET(x)		(GET_REG_SAMPLL_CLK1(x) + 0x8)
+#define RZG3L_PLL_MON_OFFSET(x)		(CPG_PLL_STBY_OFFSET(x) + 0xc)
 #define RZG3L_PLL_MON_RESETB		BIT(0)
 #define RZG3L_PLL_MON_LOCK		BIT(4)
 
@@ -75,8 +76,6 @@
 #define CLK_MRST_R(reg)		(0x180 + (reg))
 
 #define GET_REG_OFFSET(val)		((val >> 20) & 0xfff)
-#define GET_REG_SAMPLL_CLK1(val)	((val >> 22) & 0xfff)
-#define GET_REG_SAMPLL_SETTING(val)	((val) & 0xfff)
 
 #define CPG_WEN_BIT		BIT(16)
 
@@ -1147,14 +1146,14 @@ static unsigned long rzg3s_cpg_pll_clk_recalc_rate(struct clk_hw *hw,
 	u32 nir, nfr, mr, pr, val, setting;
 	u64 rate;
 
-	setting = GET_REG_SAMPLL_SETTING(pll_clk->conf);
+	setting = CPG_PLL1_SETTING_OFFSET(pll_clk->conf);
 	if (setting) {
 		val = readl(priv->base + setting);
 		if (val & RZG3S_SEL_PLL)
 			return pll_clk->default_rate;
 	}
 
-	val = readl(priv->base + GET_REG_SAMPLL_CLK1(pll_clk->conf));
+	val = readl(priv->base + CPG_PLL_CLK1_OFFSET(pll_clk->conf));
 
 	pr = 1 << FIELD_GET(RZG3S_DIV_P, val);
 	/* Hardware interprets values higher than 8 as p = 16. */
diff --git a/drivers/clk/renesas/rzg2l-cpg.h b/drivers/clk/renesas/rzg2l-cpg.h
index 17ec6f285c21..bd6169f62538 100644
--- a/drivers/clk/renesas/rzg2l-cpg.h
+++ b/drivers/clk/renesas/rzg2l-cpg.h
@@ -59,6 +59,7 @@
 #define CPG_CLKSTATUS_SELSDHI1_STS	BIT(29)
 
 #define CPG_SAM_PLL_CONF(stby)		((stby) << 12)
+#define CPG_PLL_CONF(stby, setting)	((stby) << 12 | (setting))
 
 #define DDIV_PACK(offset, bitpos, size) \
 		(((offset) << 20) | ((bitpos) << 12) | ((size) << 8))
-- 
2.43.0


