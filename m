Return-Path: <linux-renesas-soc+bounces-32818-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id zliUOlRyDGqjhwUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32818-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 May 2026 16:23:16 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 48DE8580765
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 May 2026 16:23:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9EBCE311ADDA
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 May 2026 14:15:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5451745349C;
	Tue, 19 May 2026 14:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MMjcWyBi"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0356C3ED3D2
	for <linux-renesas-soc@vger.kernel.org>; Tue, 19 May 2026 14:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779200127; cv=none; b=DyhoH81oH9QnQN6AZlSdS0fMCmPeRljGQzS1Hdnf3NYo29W2VbtqIlV7bmdmfmerpQECHB+wAtzucKO3ITGSHi0B4PiutCwCSYQQMTPHE1cqJt9yQWieD5hrOZoGH6s8ut4WOUG2tyoyH1OXihyFoosVka0oQUiPJTAZIf0VqMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779200127; c=relaxed/simple;
	bh=pCIbonQaY01gdkVUQZdkziRl+vA0GKesQQYmOj+A/PU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PXDnP19HGMd7Oy2xK/lQ4nJ1wSLJpYkHeqzRe0PQF4jE71AmSlmV0eMe1lCOsmIZ8oXCBMyzHtxLwyNC+ADAKQ44v/9oDSHnJ9eqbXGPe97vscy+E1f5uIPTGxHpZoPu7eu9lRQhqMPItQfVf5TrWE1ENEwJl4Rmi3/Dpwjc6jk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MMjcWyBi; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-48fe26a177cso26640025e9.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 19 May 2026 07:15:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779200123; x=1779804923; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A6DuZOB9oPUQHqKQEB3iHnG+d1dypyecAQyiCjdc3Bc=;
        b=MMjcWyBiRsx/PuwwOugOcRGghPiDULrIZVGl7JUoVhbd8NB92J/Tm4UTE0IfKB0hE6
         p3H5TkOAxB8oLmz7Dh8W0WIULzcnp9/YzrpNGIvB/sQCor5ohTVPY+2H8+0hIaW0vOcp
         Mb4vEpJ8LLBUyqrQ2oU/21D/AyiIjXf67SaSkN09TK2i8l2j1p5c1JImDydzxUvFmEVq
         4r0dVDMWanWgMaSlF8LYbYEBMgSkG5BcKIzKBLzrLHuxdPgJveimUgAF5GuYCM/Mad4h
         w947I34X4sbVL/c78QMn49NtfT2+sXoO82lVLjmOzjibMD9wiajgJvtKjeisTs1g7ies
         wNSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779200123; x=1779804923;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=A6DuZOB9oPUQHqKQEB3iHnG+d1dypyecAQyiCjdc3Bc=;
        b=oMxdB01qfpQ3ieA3h7c0tSMnnEPMyzNilhegHs2nQahCNEYBZz2G18zTmL3yFksLLP
         vaqL01PHXxxAfHo0wwJKQnWimLdhu0DT2ff3xHj7eRMlSeZK7OUpkDrRKumb/yYHf1Az
         33UC0OioLaNtJNaHA7bt7iML9KnW+HgfuFaXj8AjzVC+atyfU4Yi7DOy3GEA+Axj4ddD
         tRzRdh8tNxMCc3rn2l4uU/KpiQe9E2zscqGr/zvjjCwN9HvPBlLa3PmJIU7jJGnfbcd4
         MwEZ1fEyxDNJucBIIzI0IOvL1s7aQ66SXCJsw0EohlRKodvJRCLXcS7C0ndxj9dmLvJ7
         2ddA==
X-Forwarded-Encrypted: i=1; AFNElJ9ob+BKJHQYcVRnzphZ2FUvjaqYLyClVn0Bv9cQCvsCaReHfGuUwezSxPXREpSZ8vnGMzeOJftyDHjZ1LQZFB3ucg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yybb7B8z8vKQ3HjX9Ykl1JJDntz7YJF726kIyr8DeFdW+z1+dmM
	s6ezm3bDpWMy0zYtYTJJCTbF8cp4uhPZz1kBgJIupWw2Oty8e5aDOY+6
X-Gm-Gg: Acq92OGtQ8ijKXQ1QbXf7Z1qcWS7ytR2K8nuCj4tc6mp31eqbASXJVKNZVoVUEEA03r
	f+wj07LaVm4jz0YQwJpbEjEoMDEX5Rc6/61L2rPk8GRFvBoQmnNfiPWiZ6sGGmxn6o3Y3RB/+fs
	cv2ioYyoPbvfA/lqxUvbRkbO+QzfQrV65etZShp4Mhyv4StiEFMITT5yKMryQNFkK+WOUiBmna6
	ZbyZqLl7i1lTEDToQPCzfwFXTwfOrZWWKftsjlYX/3a/EIX/bqJcI6wFLLhLWZYaNzMOHMLmZCr
	PQnjO77df5GRdEJoNV3hWYFLbgHWd4Umjhg477KEB5/j/PPDi+xCA19EtY92NFS0H20pDH1/bPT
	JN0oEypdDaxY6FeCpGwEr6Mu/hRJykicqVnzxQwmax1l+haLgZ7dDvYeyXZ1YUzJGZM9eDtCqVP
	I2kJAHexdOvErwAdBuLEA+uGNAuumU9RChTsQQhCwVqt68N0f9
X-Received: by 2002:a05:600c:b95:b0:48a:8b02:ae91 with SMTP id 5b1f17b1804b1-48fe60ea2dfmr299875135e9.11.1779200123300;
        Tue, 19 May 2026 07:15:23 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a700:7301:4abf:a82a:41d5:6663])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe4c8344asm557912205e9.1.2026.05.19.07.15.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 07:15:22 -0700 (PDT)
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
Subject: [PATCH v3 2/3] clk: renesas: rzg3s/rzg3l: Simplify PLL configuration macro
Date: Tue, 19 May 2026 15:15:14 +0100
Message-ID: <20260519141518.389670-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260519141518.389670-1-biju.das.jz@bp.renesas.com>
References: <20260519141518.389670-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[bp.renesas.com,redhat.com,vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-32818-lists,linux-renesas-soc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,renesas.com:email,bp.renesas.com:mid]
X-Rspamd-Queue-Id: 48DE8580765
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Biju Das <biju.das.jz@bp.renesas.com>

Replace the per-SoC G3S_PLL146_CONF() and G3L_PLL1467_CONF() macros with
a unified CPG_PLL_CONF(stby, setting) macro defined in rzg2l-cpg.h.

Drop the now-redundant GET_REG_SAMPLL_{CLK1, SETTING}() macros, replacing
the latter with CPG_PLL1_SETTING_OFFSET() using FIELD_GET() to extract the
offset value. Update RZG3L_PLL_{STBY,MON}_OFFSET() macros to derive
offsets directly from CPG_PLL_STBY_OFFSET().

No functional changes.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2->v3:
 * Rebased to renesas-clk and fixed the merge conflict.
v1->v2:
 * Updated commit description.
 * Fixed the macro RZG3L_PLL_STBY_OFFSET by using CPG_PLL_STBY_OFFSET.
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
index fc9db5a2f0ac..a57638734ce7 100644
--- a/drivers/clk/renesas/r9a08g046-cpg.c
+++ b/drivers/clk/renesas/r9a08g046-cpg.c
@@ -81,9 +81,6 @@
 #define G3L_SEL_RSPI1		SEL_PLL_PACK(G3L_CPG_RSPI_SSEL, 2, 2)
 #define G3L_SEL_RSPI2		SEL_PLL_PACK(G3L_CPG_RSPI_SSEL, 4, 2)
 
-/* PLL 1/4/6/7 configuration registers macro. */
-#define G3L_PLL1467_CONF(clk1, clk2, setting)	((clk1) << 22 | (clk2) << 12 | (setting))
-
 enum clk_ids {
 	/* Core Clock Outputs exported to DT */
 	LAST_DT_CORE_CLK = R9A08G046_USB_SCLK,
@@ -207,11 +204,11 @@ static const struct cpg_core_clk r9a08g046_core_clks[] __initconst = {
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
 	DEF_FIXED(".pll2_div2_4", CLK_PLL2_DIV2_4, CLK_PLL2_DIV2, 1, 4),
diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
index ad9aab2ecc62..096901e25317 100644
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
+#define RZG3L_PLL_STBY_OFFSET(x)	(CPG_PLL_STBY_OFFSET(x))
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
 
@@ -1117,14 +1116,14 @@ static unsigned long rzg3s_cpg_pll_clk_recalc_rate(struct clk_hw *hw,
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


